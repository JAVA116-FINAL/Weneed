package com.it.wanted.career.cate.controller;

import java.util.List;

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
	public void career(){
		logger.info("career 화면 보여주기");
		
	}
	
	/*
	@RequestMapping("/programList.do")
	public void programList(Model model, SearchVO searchVo) {
		logger.info("pogramList를 careerMain페이지에 뿌려주기");

		logger.info("카테고리 전체조회하기");
		List<CareerCategoryVO> ccgList=careerCategoryService.selectCareerCategoryAll();
		logger.info("카테고리 조회 결과 ccgList.size{}=", ccgList.size());
		
		int totalRecord = programService.selectListTotalRecord(searchVo);
		logger.info("글 개수, totalRecord={}", totalRecord);
		
		List<ProgramVO> plist = programService.selectAllprogram(searchVo);
		logger.info("글목록 결과, plist.size={}", plist.size());

		String programCateName="";
		if(plist != null && !plist.isEmpty()) {
			for(ProgramVO proVo : plist) {
				proVo = programService.selectByProgramNo(proVo.getProgramNo());
				logger.info("프로그램별 해당 카테고리 이름 보여주기");
				programCateName=careerCategoryService.selectMatchCategoryName(proVo.getProCateNo());				
			}
		}
		
		// 3. 모델에 결과 저장
		model.addAttribute("ccgList", ccgList);
		model.addAttribute("plist", plist);
		model.addAttribute("totalRecord", totalRecord);
		model.addAttribute("programCateName", programCateName);

	}
	*/
	
	@RequestMapping("/programList.do")
	public void programList() {
		logger.info("pogramList를 careerMain페이지에 뿌려주기");

	}
	
	
	
	
	@RequestMapping("/subscription.do")
	public void subscription() {
		logger.info("subscription (구독신청) 페이지 보여주기");
	}	
	
}