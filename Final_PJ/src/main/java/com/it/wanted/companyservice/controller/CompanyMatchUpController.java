package com.it.wanted.companyservice.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@RequestMapping("/matchupMain.do")
	public String matchupMain(HttpSession session, Model model) {
		logger.info("기업서비스 매치업 메인화면");
		
		//여기서 세션에서 comCode 따다가 매치업기업목록에 해당 컴코드가 있으면 session에 매치업기업번호 추가해놓고
		//redirect company/matchupSearch.do
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		String comCode=comVo.getComCode();
		
		model.addAttribute("comCode", comCode);
		
		//분기처리 해야함 매치업 구입기업, 비구입기업
		
		return "company/matchupMain";
	}
	
	@RequestMapping("/matchupSearch.do")
	public String matchupSearch(Model model, 
			@ModelAttribute MatchupMemSearchVO searchVo) {
		
		if(searchVo.getSearchJikmu()==null || searchVo.getSearchJikmu().isEmpty()) {
			searchVo.setSearchJikmu("");
		}
		if(searchVo.getSearchKeyword()==null || searchVo.getSearchKeyword().isEmpty()) {
			searchVo.setSearchKeyword("");
		}
		if(searchVo.getSearchMaxCareer()==null || searchVo.getSearchMaxCareer().isEmpty()) {
			searchVo.setSearchMaxCareer("");
		}
		if(searchVo.getSearchMinCareer()==null || searchVo.getSearchMinCareer().isEmpty()) {
			searchVo.setSearchMinCareer("");
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
		
		List<Map<Integer, Integer>> careerList=new ArrayList<Map<Integer,Integer>>();
		List<Map<Integer, String>> eduList=new ArrayList<Map<Integer,String>>();

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
		if(searchVo.getSearchKeyword()==null || searchVo.getSearchKeyword().isEmpty()) {
			searchVo.setSearchKeyword("");
		}
		if(searchVo.getSearchMaxCareer()==null || searchVo.getSearchMaxCareer().isEmpty()) {
			searchVo.setSearchMaxCareer("");
		}
		if(searchVo.getSearchMinCareer()==null || searchVo.getSearchMinCareer().isEmpty()) {
			searchVo.setSearchMinCareer("");
		}
		logger.info("리스트까지 불러오기 결과, searchVo={}", searchVo);

		List<Map<String, Object>> memList=matchupMemService.selectSearchedMemList(searchVo);
		logger.info("리스트까지 불러오기 결과, memList.size={}", memList.size());
		
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
	
}
