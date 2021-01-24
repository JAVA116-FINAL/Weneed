package com.it.wanted.freelancer.controller;

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
}