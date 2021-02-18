package com.it.wanted.career.cate.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.career.cate.model.CareerCategoryService;
import com.it.wanted.career.cate.model.CareerCategoryVO;
import com.it.wanted.common.PaginationInfo;
import com.it.wanted.common.SearchVO;

@Controller
@RequestMapping("/career/Mainpage")

public class CareerMainController {

	private static final Logger logger = LoggerFactory.getLogger(CareerMainController.class);
	@Autowired CareerCategoryService careerCategoryService;
	@Autowired ProgramService programService;
	
	
	
	@RequestMapping("/careerMain.do")
	public void career(HttpSession session, Model model){
		logger.info("career 화면 보여주기");
		
		List<ProgramVO> proVoMainList = new ArrayList<ProgramVO>(); 
		proVoMainList =	programService.selectAllProgramsForMain();
		logger.info("프로그램들 보여주기 proVoMainList={}", proVoMainList);
		
		
		List<CareerCategoryVO> proCateNameList = new ArrayList<CareerCategoryVO>(); 
		proCateNameList = programService.selectMatchCategoryNameMain(); 
		logger.info("프로그램별 해당 카테고리 이름 리스트  proCateNameList={}", proCateNameList);
	
		/* 모달부분 select option에 들어갈 카테고리 이름들*/
		List<CareerCategoryVO> ccgList = careerCategoryService.selectCareerCategoryAll();
		logger.info("카테고리 조회 결과 ccgList.size{}=", ccgList.size());

		model.addAttribute("ccgList", ccgList);
		model.addAttribute("proVoMainList", proVoMainList);
		model.addAttribute("proCateNameList", proCateNameList);
		
	}
	
	
	
	
	@RequestMapping("/subscription.do")
	public void subscription() {
		logger.info("subscription (구독신청) 페이지 보여주기");
	}	
	
}