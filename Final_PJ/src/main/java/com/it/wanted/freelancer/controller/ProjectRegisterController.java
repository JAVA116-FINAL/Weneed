package com.it.wanted.freelancer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/freelancer")
public class ProjectRegisterController {
   private static final Logger logger=LoggerFactory.getLogger(ProjectRegisterController.class);
   
   @RequestMapping("/projectRegister/projectRegister1.do")
   public String projectRegister1() {
      logger.info("프로젝트 등록 첫번째 화면 조회하기.");
      return "/freelancer/projectRegister/projectRegister1";
   }
   
   @RequestMapping("/projectRegister/projectRegister2.do")
   public String projectRegister2() {
      logger.info("프로젝트 등록 두번째 화면 조회하기.");
      return "/freelancer/projectRegister/projectRegister2";
   }
   
   @RequestMapping("/projectRegister/projectRegister3.do")
   public String projectRegister3() {
      logger.info("프로젝트 등록 완료 화면 조회하기.");
      return "/freelancer/projectRegister/projectRegister3";
   }
}