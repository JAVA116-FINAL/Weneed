package com.it.wanted.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	private static final Logger logger
		= LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/index.do")
	public void index() {
		logger.info("index화면 보여주기");
	}
	
	/*
	 * @RequestMapping("/main/beforeLoginMain.do") public void beforeLoginMain() {
	 * logger.info("로그인 전 메인 화면 보여주기"); }
	 * 
	 * @RequestMapping("/main/afterLoginMain.do") public void afterLoginMain() {
	 * logger.info("로그인 후 메인 화면 보여주기"); }
	 */
	
	@RequestMapping("/main/onboarding.do")
	public void onboarding() {
		logger.info("회원가입 후 매칭 정보 입력 화면 보여주기");
	}
	@RequestMapping("/main/onboarding2.do")
	public void onboarding2() {
		logger.info("회원가입 후 매칭 정보 입력2 화면 보여주기");
	}
	
	@RequestMapping("/inc/top.do")
	public void top() {
		logger.info("top화면 보여주기");
	}
	
	@RequestMapping("/inc/bottom.do")
	public void bottom() {
		logger.info("bottom화면 보여주기");
	}
	
	@RequestMapping("/jobSalary/jobSalary.do")
	public void jobSalary() {
		logger.info("직군별 연봉 화면 보여주기");
	}
	
	@RequestMapping("/main/afterLoginMain.do")
	public void loginMain() {
		logger.info("afterLoginMain 보여주기");
	}
	
	@RequestMapping("/profileSetting/setting.do")
	public void profileSetting() {
		logger.info("profileSetting 보여주기");
	}
	
	@RequestMapping("/profileSetting/passwordChange.do")
	public void passwordChange() {
		logger.info("passwordChange 보여주기");
	}
	
	@RequestMapping("/mypage/applicationsStatus.do")
	public void applicationsStatus() {
		logger.info("applicationsStatus 보여주기");
	}
	
}
