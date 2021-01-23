package com.it.wanted.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private final static Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping("/notice.do")
	public void notice() {
		logger.info("notice메인 출력");
	}
	
	@RequestMapping("/notice_qna.do")
	public void notice_qna() {
		logger.info("notice_qna 출력");
	}
	
	@RequestMapping("/notice_dept1.do")
	public void notice_dept1() {
		logger.info("notice_dept1 출력");
	}
	
	@RequestMapping("/notice_dept2.do")
	public void notice_dept2() {
		logger.info("notice_dept2 출력");
	}
	
	@RequestMapping("/notice_result.do")
	public void notice_result() {
		logger.info("notice_result 출력");
	}
	
	@RequestMapping("/notice_detail.do")
	public void notice_detail() {
		logger.info("notice_detail 출력");
	}
}
