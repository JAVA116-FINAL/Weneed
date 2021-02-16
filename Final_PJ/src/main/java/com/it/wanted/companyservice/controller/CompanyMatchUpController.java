package com.it.wanted.companyservice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.it.wanted.career.model.CareerService;
import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.commeminfo.model.ComMemInfoService;
import com.it.wanted.education.model.EducationService;
import com.it.wanted.jikgun.model.JikgunService;
import com.it.wanted.jikgun.model.JikgunVO;
import com.it.wanted.jikmu.model.JikmuService;
import com.it.wanted.jikmu.model.JikmuVO;
import com.it.wanted.matchup.model.MatchupMemSearchVO;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchupCom.model.MatchupComService;
import com.it.wanted.matchupCom.model.MatchupComVO;
import com.it.wanted.matchupCom.model.MatchupZzimVO;
import com.it.wanted.matchupStatus.model.MatchupStatusService;
import com.it.wanted.member.model.MemberService;
import com.it.wanted.position.model.PositionService;
import com.it.wanted.position.model.PositionVO;
import com.it.wanted.proposal.model.ProposalService;
import com.it.wanted.proposal.model.ProposalVO;
import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeService;

@Controller
@RequestMapping("/company")
public class CompanyMatchUpController {
	
	private static final Logger logger=LoggerFactory.getLogger(CompanyMatchUpController.class);
	@Autowired CareerService careerService;
	@Autowired MatchupMemService matchupMemService;
	@Autowired MatchupComService matchupComService;
	@Autowired JikgunService jgService;
	@Autowired JikmuService jmService;
	@Autowired EducationService eduService;
	@Autowired ComMemInfoService comMemInfoService;
	@Autowired ComInfoService comInfoService;
	@Autowired ResumeService resumeService;
	@Autowired MatchupStatusService matchupStatusService; 
	@Autowired PositionService positionService;
	@Autowired ProposalService proposalService;
	@Autowired MemberService memberService;
	
	@RequestMapping(value = "/matchupService.do", method = RequestMethod.GET)
	public String matchupMain(HttpSession session, HttpServletRequest request, Model model) {
		logger.info("기업서비스 매치업 메인화면");
		
		//여기서 세션에서 comCode 따다가 매치업기업목록에 해당 컴코드가 있으면 session에 매치업기업번호 추가해놓고
		//redirect company/matchupSearch.do
	//	HttpSession session = request.getSession();
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("session에서 읽어온 cominfoVo comVo={}", comVo);
		String comCode=comVo.getComCode();
		
		//분기처리 해야함 매치업 구입기업, 비구입기업
		String url="";
		Map<String, Object> checkMap=matchupComService.hasMatchup(comCode);
		logger.info("받아온 checkMap={}", checkMap);
		if(checkMap == null) {
			url="redirect:/company/matchupMain.do";
		}else if(Integer.parseInt(String.valueOf(checkMap.get("LEFTDATE")))>0
				&& Integer.parseInt(String.valueOf(checkMap.get("LEFTCOUNT")))>0) { //매치업 구입기업이고 기한내에 있으면
			url="redirect:/company/matchupSearch.do";
		}
		return url;
	}
	
	@RequestMapping("/matchupMain.do")
	public String matchupMain() {
		logger.info("매치업 비구입기업 메인화면 조회");
		
		return "company/matchupMain";
	}
	
	@RequestMapping("/matchupSearch.do")
	public String matchupSearch(Model model, @ModelAttribute MatchupMemSearchVO searchVo,
			HttpSession session) {
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		searchVo=setSearchInfoDefault(searchVo, comVo.getComCode());
		searchVo=setBeforeMethod(searchVo);
		//매치업 구입 기업만 여기 들어올수 있습니다. 구입한 적이 있는 기업만? 
		//그럼 그냥 구입내역을 찍어서 리턴시키면 되는 거 아니야?
		MatchupComVO matchupComVo=matchupComService.selectMatchupCom(comVo.getComCode());
		Map<String, Object> checkMap=matchupComService.hasMatchup(comVo.getComCode());
		
		logger.info("기업서비스 매치업 검색/조회화면, 파라미터 searchVo={}, matchupComVo={}", searchVo, matchupComVo);
		
		//[1-1] 직군리스트 불러오기
		List<JikgunVO> jikgunList=jgService.selectAllJikgun();
		logger.info("직군리스트 불러오기 결과 jikgunList={}", jikgunList);
		
		//[1-2] 첫번째 직군 코드 불러오기 이걸 굳이 할 필요가 없지 않나?
		String basicCode=jgService.selectBasicJikgunCode();
		logger.info("첫번째 직군코드 basicCode={}", basicCode);
		
		//[1-3] 직무리스트 불러오기 개발에 해당하는
		List<JikmuVO> jikmuList=jgService.selectJikmuByJikgunCode(basicCode);
		logger.info("첫번째 직군코드에 해당하는 직무리스트 jikmuList={}", jikmuList);
		
		//포지션 목록도.. 불러와야 해요. 제안하기 팝업이 여기서 열리기 때문. 
		List<PositionVO> posList=positionService.selectPositionByComcode(comVo.getComCode());
		logger.info("포지션 목록 조회 결과, posList.size={}", posList.size());
		
		searchVo.setViewMoreSize(0);
		List<Map<String, Object>> memList=matchupMemService.selectSearchedMemList(searchVo);
		logger.info("5번째 리스트까지 불러오기 결과, memList.size={}", memList.size());
		
		Map<String, Object> emptyMapCheck=new HashMap<String, Object>();
		String emptyCheck="";
		if(memList.size()==1) {
			emptyMapCheck=memList.get(0);
			if(emptyMapCheck.get("MCUMEMNO")==null) {
				emptyCheck="검색결과 없음";
			}
		}
		
		searchVo=setAfterMethod(searchVo);
		
		logger.info("세팅 끝난 searchVo={}", searchVo);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("jikgunList", jikgunList);
		model.addAttribute("basicCode", basicCode);
		model.addAttribute("jikmuList", jikmuList);
		model.addAttribute("memList", memList);
		model.addAttribute("emptyCheck", emptyCheck);
		model.addAttribute("matchupComVo", matchupComVo);
		model.addAttribute("checkMap", checkMap);
		model.addAttribute("posList", posList);
		return "company/matchupSearch";
	}

	@RequestMapping("/sendProposal.do")
	public String sendProposal(@ModelAttribute ProposalVO propoVo, @RequestParam int resumeNo, 
			HttpSession session, Model model) {
		logger.info("제안하기, 파라미터 propoVo={}", propoVo);
		String comMemId=(String)session.getAttribute("comMemId");
		
		//멤노와 컴멤노를 가져와야 하네... 
		int comMemNo=comMemInfoService.selectComMem(comMemId).getComMemNo();
		propoVo.setComMemNo(comMemNo);
		
		//레주메노로 멤노 가져오기
		int memNo=matchupMemService.selectMemNo(resumeNo);
		propoVo.setMemNo(memNo);
		
		//제안하기 테이블에 insert 시키는 것이다. 확인은.. 안 해도 되나... 
		int cnt=proposalService.insertProposal(propoVo);
		logger.info("제안하기 insert 결과 cnt={}", cnt);
		String url="/company/matchupSearch.do", msg="제안하기 전송 실패!";
		
		if(cnt>0) {
			msg="제안하기 전송 성공!";
		}
		
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		//이것도 랜딩페이지 하나 만들어서 보내면 좋겠는데 
		return "common/message";
	}
	
	@RequestMapping("/modal/modalButtonsTest.do")
	public String modalTest() {
		return "company/modal/modalButtonsTest";
	}
	
/*	@ResponseBody
	@RequestMapping("/jikmuListByjikguncode.do")
	public List<JikmuVO> getjikmuList(@RequestParam String jikgunCode) {
		logger.info("직군코드에 따라 직무리스트 불러오기 ajax, 파라미터 jikgunCode={}", jikgunCode);
		
		List<JikmuVO> jikmuList=jgService.selectJikmuByJikgunCode(jikgunCode);
		logger.info("직군코드에 따라 직무리스트 조회 결과, jikmuList.size={}", jikmuList.size());
		
		return jikmuList;
	}
	*/
	
	@ResponseBody
	@JsonBackReference
	@RequestMapping("/viewMoreMatchupMem.do")
	public List<Map<String, Object>> getMoreMem(@ModelAttribute MatchupMemSearchVO searchVo
			, Model model){
		searchVo=setSearchInfoDefault(searchVo, searchVo.getComCode());
		searchVo=setBeforeMethod(searchVo);
		
		logger.info("리스트 더보기  시작, searchVo={}", searchVo);

		List<Map<String, Object>> memList=matchupMemService.selectSearchedMemList(searchVo);
		logger.info("더보기 결과, memList.size={}", memList.size());
		
		//이걸 왜 하지
		searchVo=setAfterMethod(searchVo);
		
		return memList;
	}

	@ResponseBody
	@RequestMapping("/showZzimedList.do")
	public List<Map<String, Object>> showZzimedList(@ModelAttribute MatchupMemSearchVO searchVo
		, Model model) {
		searchVo=setSearchInfoDefault(searchVo, searchVo.getComCode());
		searchVo=setBeforeMethod(searchVo);
		
		List<Map<String, Object>> memList=matchupMemService.selectZzimedList(searchVo);
		logger.info("찜한 목록 조회 결과, memList.size={}", memList.size());

		searchVo=setAfterMethod(searchVo);
		
		return memList;
	}
	
	@ResponseBody
	@JsonBackReference
	@RequestMapping("/viewMoreZzimedList.do")
	public List<Map<String, Object>> getMoreZzimedMem(@ModelAttribute MatchupMemSearchVO searchVo
			, Model model, HttpSession session){
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		searchVo=setSearchInfoDefault(searchVo, comVo.getComCode());
		searchVo=setBeforeMethod(searchVo);
		
		logger.info("찜한 리스트 더 불러오기 시작, searchVo={}", searchVo);

		List<Map<String, Object>> memList=matchupMemService.selectZzimedList(searchVo);
		logger.info("찜한 리스트 더 불러오기 결과, memList.size={}", memList.size());
		
		//이걸 왜 하지
		searchVo=setAfterMethod(searchVo);
		
		return memList;
	}
	
	//이력서 그려주려고 데이터 받아오는 것
	@ResponseBody
	@RequestMapping("/getResumeData.do")
	public ResumeAllVO getResumeForMatchupModal(@RequestParam int resumeNo) {
		ResumeAllVO resumeAllVo=new ResumeAllVO();
		logger.info("레주메넘버로 레주메 조회 시작, resumeNo={}", resumeNo);
		
		resumeAllVo=resumeService.selectResumeByResumeNo(resumeNo);
		logger.info("레주메넘버로 레주메 조회 결과, resume={}", resumeAllVo);
		
		return resumeAllVo;
	}
	
	@ResponseBody
	@RequestMapping(value="/addZzim.do", produces = "application/text; charset=utf8")
	public String addZzim(@RequestParam int resumeNo, HttpSession session) {
		ComInfoVO comInfoVo=(ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("매치업 찜하기, resumeNo={}, comCode={}", resumeNo, comInfoVo.getComCode());
		
		//이력서 번호로 매치업일반번호 불러오기
		int mcumemNo=matchupMemService.selectMcumemNo(resumeNo);
		logger.info("이력서 번호로 매치업일반번호 조회 결과, mcumemNo={}", mcumemNo);
		
		MatchupZzimVO zzimVo=new MatchupZzimVO();
		zzimVo.setComCode(comInfoVo.getComCode());
		zzimVo.setMcumemNo(mcumemNo);
		
		int cnt=matchupComService.addZzim(zzimVo);
		logger.info("찜하기 결과, cnt={}", cnt);
		
		String result="찜하기 실패";
		if(cnt>0) {
			result="찜하기 성공";
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/delZzim.do", produces = "application/text; charset=utf8")
	public String delZzim(@RequestParam int resumeNo, HttpSession session) {
		ComInfoVO comInfoVo=(ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("매치업 찜하기, resumeNo={}, comCode={}", resumeNo, comInfoVo.getComCode());
		
		//이력서 번호로 매치업일반번호 불러오기
		int mcumemNo=matchupMemService.selectMcumemNo(resumeNo);
		logger.info("이력서 번호로 매치업일반번호 조회 결과, mcumemNo={}", mcumemNo);
		
		MatchupZzimVO zzimVo=new MatchupZzimVO();
		zzimVo.setComCode(comInfoVo.getComCode());
		zzimVo.setMcumemNo(mcumemNo);
		
		String result="찜 제외 실패!";
		int cnt=matchupComService.delZzim(zzimVo);
		if(cnt>0) {
			result="찜 제외 성공!!";
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping("/isZzimed.do")
	public String isZzimed(@RequestParam int resumeNo, HttpSession session) {
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		String comCode=comVo.getComCode();
		
		logger.info("팝업이력서 찜여부 확인하기, 파라미터 resumeNo={}, comCode={}", resumeNo, comCode);
		
		int cnt=matchupMemService.isZzimed(resumeNo, comCode);
		
		String result="N";
		if(cnt>0) {
			result="Y";
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/updateMatchupStatus.do", produces = "application/text; charset=utf8")
	public String updateMatchupStatus(@RequestParam int resumeNo, HttpSession session) {
		logger.info("매치업현황 추가 및 업데이트, 세션 받기 전");
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("매치업현황 추가 및 업데이트, 파라미터 resumeNo={}, comInfoVo={}", resumeNo, comVo);
		//여기서 해야 하는 것들 
		//매칭에 없는 조합이라면 매칭에 추가해주고, 추가되면서 service단에서 이력서 조회 건수 -1 시켜줘야 한다. 
		
		int result=matchupStatusService.updateStatus(resumeNo, comVo.getComCode());
		logger.info("조회 검사 후 result={}", result);
		
		String str="";
		if(result==MatchupStatusService.RESUMECNT_OVER) {
			str="열람권을 모두 소진했습니다.";
		}else if(result==MatchupStatusService.RESUMECNT_REDUCED) {
			str="열람권이 1회 차감되었습니다.";
		}else if(result==MatchupStatusService.RESUMECNT_READ) {
			str="이미 조회한 이력서입니다. 열람한 이력서 목록에서 확인하실 수 있습니다.";
		}
		return str;
	}
	
	/* 기본 함수들 */
	public MatchupMemSearchVO setSearchInfoDefault(MatchupMemSearchVO vo, String comCode) {
		if(vo.getSearchJikmu()==null || vo.getSearchJikmu().isEmpty() || vo.getSearchJikmu().equals("all")) {
			vo.setSearchJikmu("");
		}
		if(vo.getSearchJikgun()==null || vo.getSearchJikgun().isEmpty()) {
			vo.setSearchJikgun("");
		}
		if(vo.getSearchKeyword()==null || vo.getSearchKeyword().isEmpty()) {
			vo.setSearchKeyword("");
		}
		if(vo.getSearchMaxCareer()==null || vo.getSearchMaxCareer().isEmpty()) {
			vo.setSearchMaxCareer("100");
		}
		if(vo.getSearchMinCareer()==null || vo.getSearchMinCareer().isEmpty()) {
			vo.setSearchMinCareer("0");
		}
		if(vo.getComCode()==null || vo.getComCode().isEmpty()) {
			vo.setComCode(comCode);
		}
		return vo;
	}
	
	public MatchupMemSearchVO setBeforeMethod(MatchupMemSearchVO searchVo){
		//최소가 신입이거나 전체일 땐 미니멈 0으로 세팅해주기 
		if(searchVo.getSearchMinCareer().equals("신입") || searchVo.getSearchMinCareer().equals("전체")) {
			searchVo.setSearchMinCareer("0");
		}
		//최대가 신입이면 맥시멈도 0으로 세팅
		if(searchVo.getSearchMaxCareer().equals("신입")) {
			searchVo.setSearchMaxCareer("0");
		}
		//최대가 전체거나 10년이상일 때 맥시멈 100으로 세팅 
		if(searchVo.getSearchMaxCareer().equals("전체") || searchVo.getSearchMaxCareer().equals("10")) {
			searchVo.setSearchMaxCareer("100");
		}
		
		return searchVo;
	}
	
	public MatchupMemSearchVO setAfterMethod(MatchupMemSearchVO searchVo){
		//다시 돌려줘야 화면에 세팅값이 제대로 들어가겠죠
		//최소가 0이면 전체로 세팅 - 최소가 전체거나 신입이었음
		if(searchVo.getSearchMinCareer().equals("0")) {
			searchVo.setSearchMinCareer("전체");
		}
		//최대가 0이면 맥스 new로 (신입)으로 설정
		if(searchVo.getSearchMaxCareer().equals("0")) {
			searchVo.setSearchMaxCareer("신입");
		}
		//최대가 100이면 전체로 세팅
		if(searchVo.getSearchMaxCareer().equals("100")){
			searchVo.setSearchMaxCareer("전체");
		}
		return searchVo;
	}
}
