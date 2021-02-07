package com.it.wanted.companyservice.controller;

import java.util.ArrayList;
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

import com.it.wanted.career.model.CareerService;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.commeminfo.model.ComMemInfoService;
import com.it.wanted.commeminfo.model.ComMemInfoVO;
import com.it.wanted.commemlist.model.ComMemListService;
import com.it.wanted.common.MatchupPagination;
import com.it.wanted.common.MatchupSearchVO;
import com.it.wanted.education.model.EducationService;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.jikgun.model.JikgunService;
import com.it.wanted.jikgun.model.JikgunVO;
import com.it.wanted.jikmu.model.JikmuService;
import com.it.wanted.jikmu.model.JikmuVO;
import com.it.wanted.matchup.model.MatchupMemSearchVO;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchup.model.MatchupMemVO;
import com.it.wanted.matchupCom.model.MatchupComService;
import com.it.wanted.matchupCom.model.MatchupZzimVO;

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
	
	@RequestMapping(value = "/matchupService.do", method = RequestMethod.GET)
	public String matchupMain(HttpServletRequest request, Model model) {
		logger.info("기업서비스 매치업 메인화면");
		
		//여기서 세션에서 comCode 따다가 매치업기업목록에 해당 컴코드가 있으면 session에 매치업기업번호 추가해놓고
		//redirect company/matchupSearch.do
		HttpSession session = request.getSession();
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("session에서 읽어온 cominfoVo comVo={}", comVo);
		String comCode=comVo.getComCode();
		
		//분기처리 해야함 매치업 구입기업, 비구입기업
		String url="";
		Map<String, Float> checkMap=matchupComService.hasMatchup(comCode);
		logger.info("받아온 checkMap={}", checkMap);
		if(checkMap == null) {
			url="redirect:/company/matchupMain.do";
		}else if(checkMap.get("leftDate")>0 && checkMap.get("leftCount")>0) { //매치업 구입기업이고 기한내에 있으면
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
	public String matchupSearch(Model model, @ModelAttribute MatchupMemSearchVO searchVo) {
		
		if(searchVo.getSearchJikmu()==null || searchVo.getSearchJikmu().isEmpty()) {
			searchVo.setSearchJikmu("");
		}
		if(searchVo.getSearchJikgun()==null || searchVo.getSearchJikgun().isEmpty()) {
			searchVo.setSearchJikgun("");
		}
		if(searchVo.getSearchKeyword()==null || searchVo.getSearchKeyword().isEmpty()) {
			searchVo.setSearchKeyword("");
		}
		if(searchVo.getSearchMaxCareer()==null || searchVo.getSearchMaxCareer().isEmpty()) {
			searchVo.setSearchMaxCareer("100");
		}
		if(searchVo.getSearchMinCareer()==null || searchVo.getSearchMinCareer().isEmpty()) {
			searchVo.setSearchMinCareer("0");
		}
		
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
		
		logger.info("기업서비스 매치업 검색/조회화면, 파라미터 searchVo={}", searchVo);
		
		//[1-1] 직군리스트 불러오기
		List<JikgunVO> jikgunList=jgService.selectAllJikgun();
		logger.info("직군리스트 불러오기 결과 jikgunList={}", jikgunList);
		
		//[1-2] 첫번째 직군 코드 불러오기 이걸 굳이 할 필요가 없지 않나?
		String basicCode=jgService.selectBasicJikgunCode();
		logger.info("첫번째 직군코드 basicCode={}", basicCode);
		
		//[1-3] 직무리스트 불러오기 개발에 해당하는
		List<JikmuVO> jikmuList=jgService.selectJikmuByJikgunCode(basicCode);
		logger.info("첫번째 직군코드에 해당하는 직무리스트 jikmuList={}", jikmuList);
		
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
		
		logger.info("세팅 끝난 searchVo={}", searchVo);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("jikgunList", jikgunList);
		model.addAttribute("basicCode", basicCode);
		model.addAttribute("jikmuList", jikmuList);
		model.addAttribute("memList", memList);
		model.addAttribute("emptyCheck", emptyCheck);
		return "company/matchupSearch";
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
	@RequestMapping("/viewMoreMatchupMem.do")
	public List<Map<String, Object>> getMoreMem(@ModelAttribute MatchupMemSearchVO searchVo){
		if(searchVo.getSearchJikmu()==null || searchVo.getSearchJikmu().isEmpty()) {
			searchVo.setSearchJikmu("");
		}
		if(searchVo.getSearchJikgun()==null || searchVo.getSearchJikgun().isEmpty()) {
			searchVo.setSearchJikgun("");
		}
		if(searchVo.getSearchKeyword()==null || searchVo.getSearchKeyword().isEmpty()) {
			searchVo.setSearchKeyword("");
		}
		if(searchVo.getSearchMaxCareer()==null || searchVo.getSearchMaxCareer().isEmpty()) {
			searchVo.setSearchMaxCareer("100");
		}
		if(searchVo.getSearchMinCareer()==null || searchVo.getSearchMinCareer().isEmpty()) {
			searchVo.setSearchMinCareer("0");
		}
		
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
		logger.info("리스트까지 불러오기 결과, searchVo={}", searchVo);

		List<Map<String, Object>> memList=matchupMemService.selectSearchedMemList(searchVo);
		logger.info("리스트까지 불러오기 결과, memList.size={}", memList.size());
		
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
		
		return memList;
	}
	
	@ResponseBody
	@RequestMapping("/addZzim.do")
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
	@RequestMapping("/delZzim.do")
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
			result="찜 제외 성공!";
		}
		return result;
	}
	
	/*
	 @RequestMapping("") public showZzimedList() {
	 
	 }
	 */
}
