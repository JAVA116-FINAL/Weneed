package com.it.wanted.career.detail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/career/detailpage")
public class CareerDetailController {

	private static final Logger logger = LoggerFactory.getLogger(CareerDetailController.class);
	
	@RequestMapping("/programDetail.do")
	public void programDetail() {
		logger.info("프로그램 상세페이지 보여주기");
		
	}
	
}
