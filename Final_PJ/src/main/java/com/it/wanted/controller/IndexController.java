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
}
