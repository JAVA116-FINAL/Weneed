package com.it.wanted.career.cate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/career/subscribe")
public class SubscriptionController {
	private static final Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	@RequestMapping("/subsRegister.do")
	public void subsRegister() {
		logger.info("원티드플러스 구독신청 페이지 보여주기");
	}
}
