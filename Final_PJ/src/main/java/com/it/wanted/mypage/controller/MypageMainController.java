package com.it.wanted.mypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage")
public class MypageMainController {

	private final static Logger logger=LoggerFactory.getLogger(MypageMainController.class);
	
	@RequestMapping("/main.do")
	public String mypageMain() {
		logger.info("마이원티드 메인 조회하기");
		
		return "mypage/main";
	}
	
}
