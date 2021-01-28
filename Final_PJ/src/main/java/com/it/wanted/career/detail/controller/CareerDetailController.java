package com.it.wanted.career.detail.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;

@Controller
@RequestMapping("/career/detailpage")
public class CareerDetailController {

	private static final Logger logger = LoggerFactory.getLogger(CareerDetailController.class);
	@Autowired private ProgramService programService;
	
	@RequestMapping("/programDetail.do")
	public String programDetail(@RequestParam (defaultValue="0") int programNo, Model model) {
		//1
		logger.info("프로그램 상세페이지 파라미터, programNo={}", programNo);
		
		//2
		ProgramVO proVo = programService.selectByProgramNo(programNo);
		logger.info("프로그램 상세페이지 결과 , proVo={}", proVo);
		
		//3
		model.addAttribute("proVo", proVo);
		
		//4
		return "career/detailpage/programDetail";
		
	}
	
}
