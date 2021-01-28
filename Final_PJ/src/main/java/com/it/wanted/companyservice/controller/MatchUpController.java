package com.it.wanted.companyservice.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class MatchUpController {
	private static final Logger logger=LoggerFactory.getLogger(MatchUpController.class);
//	@Autowired matchupmemService matchupMemService;
	
	@RequestMapping("/matchupMain.do")
	public String matchupMain() {
		logger.info("기업서비스 매치업 메인화면");
		
		return "company/matchupMain";
	}
	
	@RequestMapping("/matchupSearch.do")
	public String matchupSearch() {
		logger.info("기업서비스 매치업 검색/조회화면");
		
		// [1] 직군리스트 세팅
		/*
		// [2] 전체 매치업이력서 불러오기, 이력서 공개여부 Y에 해당하는 
		List<MatchupMemVO> matchupMemList=matchupMemService.selectOpen();
		
		List<Map<String, Integer>> careerList=null;
		
		for(matchupmemvo vo : matchupMemList) {
			int resumeNo=vo.getresumeno();
			
			careerVo
		}
		// [3] 이력서 번호에 해당하는 경력 (career) 불러와서 기간 계산하기
		// 커리어VO 리스트 가져오기
		
		
		 if(마감월 == 시작월){
		 	경력 = 마감년도-시작년도 년
		 				 0 개월
		 }else if(마감월 < 시작월){
		 	경력 = 마감년도-시작년도+1 년,
		 		 (12-시작월)+마감월이 <6이면 그냥 년도만 셀렉
		 		 				 >=6 이면 년도+1 셀렉
		 }else{ //마감월 > 시작월
		 	경력 = 마감년도-시작년도 년,
		 		 마감월 - 시작월 이 <6이면 년도만 셀렉
		 		 			 >=6이면 년도+1 셀렉
		 }
		 */
		
		// [4] 이력서 번호에 해당하는 학력 (education) 불러와서 학교명, 전공및 학위 출력해주기
		
		
		return "company/matchupSearch";
	}
	
	@RequestMapping("/modal/modalButtonsTest.do")
	public String modalTest() {
		return "company/modal/modalButtonsTest";
	}
}
