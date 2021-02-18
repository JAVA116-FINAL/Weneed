package com.it.wanted.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.main.search.model.MainSearchService;
import com.it.wanted.main.search.model.MainSearchVO;
import com.it.wanted.position.model.PosNewVO;

@Controller
public class IndexController {
	private static final Logger logger
		= LoggerFactory.getLogger(IndexController.class);
	
	@Autowired private MainSearchService mainSearchService;
	
	@RequestMapping("/main/onboarding.do")
	public void onboarding() {
		logger.info("회원가입 후 매칭 정보 입력 화면 보여주기");
	}
	@RequestMapping("/main/onboarding2.do")
	public void onboarding2() {
		logger.info("회원가입 후 매칭 정보 입력2 화면 보여주기");
	}
	
	@RequestMapping("/inc/top.do")
	public void top() {
		logger.info("top화면 보여주기");
	}
	
	@RequestMapping("/inc/bottom.do")
	public void bottom() {
		logger.info("bottom화면 보여주기");
	}
	
	@RequestMapping("/jobSalary/jobSalary.do")
	public void jobSalary() {
		logger.info("직군별 연봉 화면 보여주기");
	}
	
	@RequestMapping("/main/afterLoginMain.do")
	public void loginMain() {
		logger.info("afterLoginMain 보여주기");
	}
	
	@RequestMapping("/profileSetting/setting.do")
	public void profileSetting() {
		logger.info("profileSetting 보여주기");
	}
	
	@RequestMapping("/profileSetting/passwordChange.do")
	public void passwordChange() {
		logger.info("passwordChange 보여주기");
	}
	
	//메인
	@RequestMapping("/index.do")
	public String mainList(Model model) {
		List<MainSearchVO> listNewRecruit = mainSearchService.selectNewRecruit();
		List<ProgramVO> listMainCareerList = mainSearchService.selectMainCareerList();
		List<PosNewVO> listMainNewPosiiton = mainSearchService.selectMainNewPos();
		
		logger.info("신규회사 list={}",listNewRecruit);
		logger.info("커리어 성장 list={}",listMainCareerList);
		logger.info("신규 포지션 list={}",listMainNewPosiiton);
			
		model.addAttribute("listNewRecruit", listNewRecruit);
		model.addAttribute("listMainCareerList", listMainCareerList);
		model.addAttribute("listMainNewPosiiton", listMainNewPosiiton);
			
		return "/index";
	}
	
	
}
