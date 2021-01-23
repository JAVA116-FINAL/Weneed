package com.it.wanted.career.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/career/Admin")
public class CareerAdminMainController {

	private static final Logger logger = LoggerFactory.getLogger(CareerAdminMainController.class);
	
	@RequestMapping("/careerAdminMain.do")
	public void careerAdminMain() {
		logger.info("careerAdminMain 커리어성장 관리자 메인페이지 보여주기");
	}

	@RequestMapping("/programWrite.do")
	public void programWrite() {
		logger.info("programWrite 관리자 프로그램 등록 페이지 보여주기");
	}
	

}
