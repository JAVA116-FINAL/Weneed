package com.it.wanted.career.cate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/career/mainpage")

public class CareerMainController {

	private static final Logger logger = LoggerFactory.getLogger(CareerMainController.class);
	
	@RequestMapping("/careerMain.do")
	public void career(){
		logger.info("career 화면 보여주기");
		
	}
	
	
}
