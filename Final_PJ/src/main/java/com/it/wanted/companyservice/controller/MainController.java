package com.it.wanted.companyservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class MainController {

	private static final Logger logger=LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/welcome.do")
	public String companyMain() {
		logger.info("기업서비스 첫화면 조회");
		
		return "company/welcome";
	}
}
