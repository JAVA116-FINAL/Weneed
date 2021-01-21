package com.it.wanted.jobsearch.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/jobsearch")
public class jobsearchController {

	private static final Logger logger =LoggerFactory.getLogger(jobsearchController.class);
	@RequestMapping("/jobsearchDetail.do")
	public void jobsearchDetail() {
		logger.info("탐색 상세보기 화면보여주기");
	}
}
