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
import com.it.wanted.education.model.EducationService;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.jikgun.model.JikgunService;
import com.it.wanted.jikgun.model.JikgunVO;
import com.it.wanted.jikmu.model.JikmuService;
import com.it.wanted.jikmu.model.JikmuVO;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchup.model.MatchupMemVO;

@Controller
@RequestMapping("/company")
public class CompanyMatchUpController {
	private static final Logger logger=LoggerFactory.getLogger(CompanyMatchUpController.class);
	@Autowired CareerService careerService;
	@Autowired MatchupMemService matchupMemService;
	@Autowired JikgunService jgService;
	@Autowired JikmuService jmService;
	@Autowired EducationService eduService;
	@Autowired ComMemInfoService comMemInfoService;
	@Autowired ComInfoService comInfoService;
	
	@RequestMapping("/matchupMain.do")
	public String matchupMain(HttpSession session, Model model) {
		logger.info("기업서비스 매치업 메인화면");
		
		return "company/matchupMain";
	}
	
	@RequestMapping("/matchupSearch.do")
	public String matchupSearch(Model model) {
		logger.info("기업서비스 매치업 검색/조회화면");
		
		//[1-1] 직군리스트 불러오기
		List<JikgunVO> jikgunList=jgService.selectAllJikgun();
		logger.info("직군리스트 불러오기 결과 jikgunList={}", jikgunList);
		
		//[1-2] 첫번째 직군 코드 불러오기 이걸 굳이 할 필요가 없지 않나?
		String basicCode=jgService.selectBasicJikgunCode();
		logger.info("첫번째 직군코드 basicCode={}", basicCode);
		
		//[1-3] 직무리스트 불러오기 개발에 해당하는
		List<JikmuVO> jikmuList=jgService.selectJikmuByJikgunCode(basicCode);
		logger.info("첫번째 직군코드에 해당하는 직무리스트 jikmuList={}", jikmuList);
		
		// [2] 매치업이력서 불러오기, 이력서 공개여부 Y에 해당하는 
		List<MatchupMemVO> matchupMemList=matchupMemService.selectOpen();
		logger.info("이력서 공개된 매치업이력서 목록 조회 결과, matchupMemList.size={}", matchupMemList.size());
		
		List<Map<Integer, Integer>> careerList=new ArrayList<Map<Integer,Integer>>();
		List<Map<Integer, String>> eduList=new ArrayList<Map<Integer,String>>();
		
		for(MatchupMemVO vo : matchupMemList) {
			int resumeNo=vo.getResumeNo();
			// [3] 이력서 번호에 해당하는 경력 (career) 불러와서 기간 계산하기
			CareerVO careerVo=careerService.selectCareer(resumeNo);
			int careerPeriod=0;
			int startY=Integer.parseInt(careerVo.getStartYear());
			int startM=Integer.parseInt(careerVo.getStartMonth());
			int endY=Integer.parseInt(careerVo.getEndYear());
			int endM=Integer.parseInt(careerVo.getEndMonth());
			
			if(startM == endM) { //마감월 = 시작월
				careerPeriod=endY-startY;
			}else if(startM < endM) { // 마감월 < 시작월
				careerPeriod=endY-startY+1;
				if((12-startM)+endM >= 6) {
					careerPeriod++;
				}
			}else { // 마감월 > 시작월
				careerPeriod=endY-startY;
				if(endM-startM >= 6) {
					careerPeriod++;
				}
			}
			
			Map<Integer, Integer> carMap=new HashMap<Integer, Integer>();
			carMap.put(resumeNo, careerPeriod);
			careerList.add(carMap);
			
			// [4] 이력서 번호에 해당하는 학력 (education) 불러와서 학교명, 전공및 학위 출력해주기
			String eduResult="";
			List<EducationVO> educationList=eduService.selectEduByResumeNo(resumeNo);
			logger.info("이력서 번호에 해당하는 학력 리스트 ");
			for(EducationVO vo2 : educationList) {
				eduResult=vo2.getEduName()+" "+vo2.getEduMajor();

				Map<Integer, String> eduMap=new HashMap<Integer, String>();
				eduMap.put(resumeNo,eduResult);
				eduList.add(eduMap);
			}
			
		}//for
		/*
		--이력서 번호랑 회원번호를 가지고 view를 만들어야 할 거 같음
		--이력서 번호, 회원번호
		--학교명 전공(education)
		--경력 (career) 시작년 시작월 마감년 마감월
		--회원별 직무
		select resume_no, mem_no, resumeopen_flag from matchupMem matchMem;
		select * from education edu;
		select career_name, career_dep, start_year, start_month, end_year, end_month from career care;
		
		select edu.resume_no, matchMem.mem_no, matchMem.resumeopen_flag, jm.jikmu_name, edu.edu_name, edu.edu_major, edu.cur_enrolled, 
		    care.start_year, care.start_month, care.end_year, care.end_month, care.career_name, care.career_dep
		from education edu 
		join career care on edu.resume_no=care.resume_no
		join matchupMem matchMem on care.resume_no=matchMem.resume_no
		join memberjikmu memjikmu on memjikmu.mem_no=matchMem.mem_no
		join jikmu jm on memjikmu.jikmu_code=jm.jikmu_code;
		--이게 여러개일때도 될까?
		 
		 */
		
		
		model.addAttribute("jikgunList", jikgunList);
		model.addAttribute("basicCode", basicCode);
		model.addAttribute("jikmuList", jikmuList);
		model.addAttribute("matchupMemList", matchupMemList);
		model.addAttribute("careerList", careerList);
		model.addAttribute("eduList", eduList);
		
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
}
