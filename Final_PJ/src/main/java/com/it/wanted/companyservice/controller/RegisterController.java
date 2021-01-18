package com.it.wanted.companyservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/company")
public class RegisterController {
	
	private static final Logger logger=LoggerFactory.getLogger(RegisterController.class);
	
	@RequestMapping(value="/member/join.do", method = RequestMethod.GET)
	public String join_modal_get() {
		logger.info("기업회원 회원가입 모달 팝업 오픈");

		return "company/member/join";
	}
	
	@RequestMapping(value = "/member/join.do", method= RequestMethod.POST)
	public String join_modal_post() {
		logger.info("기업회원 회원가입 처리");
		
		return "";
	}
	
	@RequestMapping("/member/modalTest.do")
	public String modalTest() {
		logger.info("모달팝업 테스트");
		
		return "company/member/modalTest";
	}
	
	@RequestMapping("/register.do")
	public void register_get() {
		logger.info("회사정보등록 페이지 조회");
		
	}
}
