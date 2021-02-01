package com.it.wanted.companyservice.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class MainController {

	private static final Logger logger=LoggerFactory.getLogger(MainController.class);
	
	@RequestMapping("/welcome.do")
	public String companyMain(HttpSession session, Model model) {
		logger.info("기업서비스 첫화면 조회");
		
		String comMemId=(String) session.getAttribute("comMemId");
		logger.info("세션에서 읽어온 comMemId={}", comMemId);
		model.addAttribute("comMemId", comMemId);
		
		return "company/welcome";
	}
}
