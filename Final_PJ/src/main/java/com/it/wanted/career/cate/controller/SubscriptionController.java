package com.it.wanted.career.cate.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.wanted.career.detail.model.CareerSubsService;
import com.it.wanted.career.detail.model.CareerSubsVO;

@Controller
@RequestMapping("/career/subscribe")
public class SubscriptionController {
	private static final Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	@Autowired 
	private CareerSubsService subsService;
	
	/* 정기권 신청 뷰페이지 */
	@RequestMapping(value="/subsRegister.do", method=RequestMethod.GET)
	public void subsRegister_get(){
		logger.info("원티드플러스 구독신청 페이지 보여주기");
	}


	/* 정기권 신청 등록처리와 결제창*/
	@RequestMapping(value="/subsRegister.do", method=RequestMethod.POST)
	public void subsRegister_post(){
		logger.info("원티드플러스 구독신청 페이지 보여주기");
	}

	
	/* 정기권 신청 등록처리와 결제창*/
	@RequestMapping("/subscriptionPay.do")
	public void subscriptionPay_post(@ModelAttribute CareerSubsVO subsVo){
		logger.info("결제 뷰페이지 파라미터, subsVo={}", subsVo);
		int cnt = subsService.insertSubs(subsVo);

		
	}
	
	
	
	
}
