package com.it.wanted.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;

@Controller
@RequestMapping("/admin")
public class AdminMainController {

	private Logger logger=LoggerFactory.getLogger(AdminMainController.class);
	
	@RequestMapping("/index.do")
	public void adminMain() {
		logger.info("위니드 관리자 메인페이지 조회");
	}
}
