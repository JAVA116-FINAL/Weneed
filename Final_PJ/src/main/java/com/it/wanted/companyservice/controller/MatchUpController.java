package com.it.wanted.companyservice.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.career.model.CareerService;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.matchup.model.MatchupMemVO;

@Controller
@RequestMapping("/company")
public class MatchUpController {
	private static final Logger logger=LoggerFactory.getLogger(MatchUpController.class);
	@Autowired MatchupMemService matchupMemService;
	@Autowired CareerService careerService;
	
	@RequestMapping("/matchupMain.do")
	public String matchupMain() {
		logger.info("기업서비스 매치업 메인화면");
		
		return "company/matchupMain";
	}
	
	@RequestMapping("/matchupSearch.do")
	public String matchupSearch() {
		logger.info("기업서비스 매치업 검색/조회화면");
		
		// [1] 직군리스트 세팅
		
		
		// [2] 전체 매치업이력서 불러오기, 이력서 공개여부 Y에 해당하는 
		List<MatchupMemVO> matchupMemList=matchupMemService.selectOpen();
		
		List<Map<String, Integer>> careerList=null;
		
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
			
		}
		// 커리어VO 리스트 가져오기
		
		
		// [4] 이력서 번호에 해당하는 학력 (education) 불러와서 학교명, 전공및 학위 출력해주기
		
		
		return "company/matchupSearch";
	}
	
	
	@RequestMapping("/modal/modalButtonsTest.do")
	public String modalTest() {
		return "company/modal/modalButtonsTest";
	}
}
