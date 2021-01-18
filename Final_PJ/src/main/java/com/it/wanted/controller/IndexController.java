package com.it.wanted.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	private static final Logger logger
		= LoggerFactory.getLogger(IndexController.class);
	
	@RequestMapping("/index.do")
	public void index() {
		logger.info("index화면 보여주기");
	}
	
	@RequestMapping("/inc/top.do")
	public void top() {
		logger.info("top화면 보여주기");
	}
	
	@RequestMapping("/inc/bottom.do")
	public void bottom() {
		logger.info("bottom화면 보여주기");
	}
}
