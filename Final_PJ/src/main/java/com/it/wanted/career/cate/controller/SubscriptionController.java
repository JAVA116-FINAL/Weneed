package com.it.wanted.career.cate.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.career.detail.model.CareerSubsService;
import com.it.wanted.career.detail.model.CareerSubsVO;
import com.it.wanted.member.model.MemberVO;

@Controller
@RequestMapping("/career/subscribe")
public class SubscriptionController {
	private static final Logger logger = LoggerFactory.getLogger(SubscriptionController.class);
	
	@Autowired 
	private CareerSubsService subsService;
	
	/* 정기권 신청 뷰페이지 */
	@RequestMapping(value="/subsRegister.do", method=RequestMethod.GET)
	public void subsRegister_get(HttpSession session, Model model){
		logger.info("원티드플러스 구독신청 페이지 보여주기");
		
		int memNo=0;
		String email="";
		if(session.getAttribute("mem_no") != null ) {
			memNo= (Integer) session.getAttribute("mem_no"); 
		}
		if(session.getAttribute("email")!= null) {
			email= (String)session.getAttribute("email");
		}
		
		MemberVO memVo = new MemberVO();
		memVo = subsService.selectMemberNameSub(email);
		logger.info("회원이메일 email={}", email);
		logger.info("회원이름 memName={}", memVo);
		
		model.addAttribute("email", email);
		model.addAttribute("memVo", memVo);

	}


	/* 정기권 신청 등록처리와 결제창*/
	@RequestMapping(value="/subsRegister.do",method=RequestMethod.POST)
	public String subsRegister_post(HttpSession session, Model model){
		CareerSubsVO subsVo = new CareerSubsVO();
		logger.info("결제 뷰페이지 파라미터, subsVo={}", subsVo); 
		  int cnt = subsService.insertSubs(subsVo);
		  
		  String msg = "구독신청 실패", url = "/career/subscribe/subsRegister.do";
			if (cnt > 0) {
				msg = "결제페이지로 넘어갑니다.";
				url = "/career/subscribe/subscriptionPay.do?subEmail=" + subsVo.getSubEmail();
			}

			// 3
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		
		
	}

	
	/* 정기권 신청 등록처리와 결제창*/
	
	  @RequestMapping(value="/subscriptionPay.do", method=RequestMethod.POST) 
	  public void subscriptionPay_post(HttpSession session, Model model){
	  
			/*
			 * logger.info("결제 뷰페이지 파라미터, subsVo={}", subsVo);
			 */		 	  
	  
	  }

	  /* 개별 프로그램 구매 */
	  @RequestMapping("/buyProgram.do") 
	  public void buyProgram(@RequestParam int programNo, HttpSession session, Model model){
		  
			logger.info("프로그램 구매 페이지 보여주기");
			
			int memNo=0;
			String email="";
			if(session.getAttribute("mem_no") != null ) {
				memNo= (Integer) session.getAttribute("mem_no"); 
			}
			if(session.getAttribute("email")!= null) {
				email= (String)session.getAttribute("email");
			}
			
			MemberVO memVo = new MemberVO();
			memVo = subsService.selectMemberNameSub(email);
			logger.info("회원이메일 email={}", email);
			logger.info("회원이름 memName={}", memVo);
			
			ProgramVO proVo = new ProgramVO();
			proVo = subsService.selectProgramInfo(programNo);
			
			model.addAttribute("email", email);
			model.addAttribute("memVo", memVo);		  
			model.addAttribute("proVo", proVo);		  
		  
	  }
	 
	
	
	
}
