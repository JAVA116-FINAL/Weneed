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
public class ApplicantsController {
	
	private static final Logger logger=LoggerFactory.getLogger(ApplicantsController.class);
	
	@RequestMapping("/applicants.do")
	public String applicantsMain() {
		logger.info("기업서비스 지원자 목록 조회 메인페이지");
		//기업코드에 해당하는 직군코드 싹 긁어다가 리스트로 뿌려줘야 함
				
		//응답률, 응답일 계산
		
		//지원자 목록 전달.. 페이징처리 해야할거같음
		
		return "company/applicants";
	}
}
