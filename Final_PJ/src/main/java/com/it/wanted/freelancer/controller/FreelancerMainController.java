package com.it.wanted.freelancer.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/freelancer")
public class FreelancerMainController {
   private static final Logger logger=LoggerFactory.getLogger(FreelancerMainController.class);
   
   @RequestMapping("/freelancerMain.do")
   public String freelancerMain() {
      logger.info("프리랜서 메인화면 조회하기");
      
      return "freelancer/freelancerMain";
   }
   
	/*
	 * @RequestMapping("/logout.do") public String logout(HttpSession session) {
	 * String email = (String) session.getAttribute("email");
	 * 
	 * logger.info("로그아웃 처리, 파라미터 email={}", email);
	 * 
	 * session.removeAttribute("email"); session.removeAttribute("name");
	 * session.removeAttribute("mem_no"); session.removeAttribute("fileName");
	 * 
	 * return "redirect:/freelancerMain.do"; }
	 */
}