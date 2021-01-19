package com.it.wanted.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/resume")
public class resumeController {
	private static final Logger logger=LoggerFactory.getLogger(resumeController.class);
	
	@RequestMapping("/resumeList.do")
	public String resumeList() {
		logger.info("이력서 관리 화면 보여주기");
		return "resume/resumeList";
	}
	
	@RequestMapping(value = "/resumeWrite.do", method = RequestMethod.GET)
	public String resumeWrite_get() {
		logger.info("이력서 글쓰기 화면 보여주기");
		//이 때인서트를 하고 보여줘야할듯
		
		return "resume/resumeWrite";
	}
	
}
