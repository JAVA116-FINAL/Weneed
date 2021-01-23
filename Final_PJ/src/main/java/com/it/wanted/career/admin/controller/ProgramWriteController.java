package com.it.wanted.career.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;

@Controller
@RequestMapping("/career/admin")
public class ProgramWriteController {

	private static final Logger logger = LoggerFactory.getLogger(ProgramWriteController.class);
	
	@Autowired private ProgramService programService;
	
	
	//프로그램 글쓰기(등록) 화면 보여주기
	@RequestMapping(value="/programWrite.do", method=RequestMethod.GET)
	public String programWrite_get() {
		logger.info("programWrite 프로그램 등록 글쓰기 페이지 보여주기");		
		
		return "career/admin/programWrite";
	}
	
	//프로그램 등록하기 (등록 처리)
	@RequestMapping(value="/programWrite.do", method=RequestMethod.POST)
	public String programWrite_post(@ModelAttribute ProgramVO proVo) {
		logger.info("programWrite 프로그램 등록 글쓰기 처리, 파라미터 proVo{}=", proVo);
		
		int cnt=programService.insertProgram(proVo);
		logger.info("프로그램 등록 결과, cnt=", cnt);
		
		return "redirect:programDetail.do";		
		
	}
	
	
}
