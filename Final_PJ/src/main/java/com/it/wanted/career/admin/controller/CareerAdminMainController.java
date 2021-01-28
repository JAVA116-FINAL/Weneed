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

//	@RequestMapping("/programWrite.do")
//	public void programWrite() {
//		logger.info("programWrite 관리자 프로그램 등록 페이지 보여주기");
//	}


	
	@RequestMapping("/programWrite2.do")
	public void programWrite2() {
		logger.info("programWrite2 관리자 프로그램 내용 등록 페이지 보여주기");
	}

	@RequestMapping("/programEdit1.do")
	public void programEdit1() {
		logger.info("programEdit1 프로그램 내용1 수정페이지 보여주기");
	}

	@RequestMapping("/programDelete.do")
	public void programDelete() {
		logger.info("programDelete 프로그램 내용1 삭제페이지 보여주기");
	}

	@RequestMapping("/programList.do")
	public void programList() {
		logger.info("programList 프로그램 리스트페이지 보여주기");
	}

	/*
	 * @RequestMapping("/programComplete1.do") public void programComplete1() {
	 * logger.info("programComplete1 프로그램 등록완료 페이지 보여주기"); }
	 */

	@RequestMapping("/programCompleteAll.do")
	public void programCompleteAll() {
		logger.info("programCompleteAll 프로그램 등록완료 페이지 보여주기");
	}

	@RequestMapping("/programDetail.do")
	public void programDetail() {
		logger.info("programDetail 프로그램 등록 미리보기 페이지 보여주기");
	}

	@RequestMapping("/programEditTotal.do")
	public void programEditTotal() {
		logger.info("programEditTotal 프로그램 전체 수정페이지 보여주기");
	}



	
	
}
