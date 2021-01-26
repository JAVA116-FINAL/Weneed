package com.it.wanted.companyservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class PositionController {
	private static final Logger logger=LoggerFactory.getLogger(PositionController.class);
	
	@RequestMapping("/positionList.do")
	public void positionList() {
		logger.info("포지션목록 조회");
	}
	
	@RequestMapping("/positionAdd.do")
	public void positionAdd() {
		logger.info("포지션등록 페이지 조회");
	}
}
