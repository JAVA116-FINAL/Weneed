package com.it.wanted.career.cate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/career/Mainpage")

public class CareerMainController {

	private static final Logger logger = LoggerFactory.getLogger(CareerMainController.class);
	
	@RequestMapping("/careerMain.do")
	public void career(){
		logger.info("career 화면 보여주기");
		
	}
	
	@RequestMapping("/programList.do")
	public void programList() {
		logger.info("pogramList를 careerMain페이지에 뿌려주기");
	}
	
	@RequestMapping("/subscription.do")
	public void subscription() {
		logger.info("subscription (구독신청) 페이지 보여주기");
	}
	
}
