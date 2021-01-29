package com.it.wanted.salary.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.salary.model.SalaryService;
import com.it.wanted.salary.model.SalaryVO;

@Controller
public class SalaryController {
	private static final Logger logger
		= LoggerFactory.getLogger(SalaryController.class);
	
	@Autowired private SalaryService salaryService;
	
	@ResponseBody
	@RequestMapping("/salaryChartData.do")
	public void selectSalary(@ModelAttribute SalaryVO vo, @RequestParam String jikgunCode,
			@RequestParam String jikmuCode, Model model) {
		logger.info("jikgunCode={}", jikgunCode);
		logger.info("jikmuCode={}", jikmuCode);
		
		List<Map<String, Object>> list = salaryService.selectSalary(vo);
		logger.info("연봉 목록 조회 결과, list.size={}", list.size());
		model.addAttribute("list", list);
		logger.info("연봉정보={}", list);
	}
	
}