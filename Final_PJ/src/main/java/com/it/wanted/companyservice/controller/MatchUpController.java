package com.it.wanted.companyservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class MatchUpController {
	private static final Logger logger=LoggerFactory.getLogger(MatchUpController.class);
	
	@RequestMapping("/matchupMain.do")
	public String matchupMain() {
		logger.info("기업서비스 매치업 메인화면");
		
		return "company/matchupMain";
	}
	
	@RequestMapping("/modal/modalButtonsTest.do")
	public String modalTest() {
		return "company/modal/modalButtonsTest";
	}
}
