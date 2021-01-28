package com.it.wanted.career.cate.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.career.cate.model.CareerCategoryService;
import com.it.wanted.career.cate.model.CareerCategoryVO;

@Controller
@RequestMapping("/career/category")
public class CareerCategoryController {

	private static final Logger logger = LoggerFactory.getLogger(CareerCategoryController.class);
	
	@Autowired private CareerCategoryService careerCategoryService;
	
	@RequestMapping("/careerMain.do")
	public String listCareerCategory(Model model) {
		logger.info("카테고리 전체조회하기");
		
		List<CareerCategoryVO> ccgList=careerCategoryService.selectCareerCategoryAll();
		
		logger.debug("카테고리 조회 결과 ccgList.size{}=", ccgList.size());
		
		model.addAttribute("ccgList", ccgList);
		
		return "/categoryList.do";
	}
	
	@RequestMapping("/categoryList.do")
	public String listCategory(Model model){
		logger.debug("카테고리 전체 조회하기");
		
		List<CareerCategoryVO> ccgList
			= careerCategoryService.selectCareerCategoryAll();
		logger.debug("카테고리 조회 결과, ccgList.size={}", ccgList.size());
		
		model.addAttribute("ccgList", ccgList);
		
		return "career/category/categoryList";
	}
	
	
}