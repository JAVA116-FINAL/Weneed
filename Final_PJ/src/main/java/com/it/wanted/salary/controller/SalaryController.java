package com.it.wanted.salary.controller;

import java.text.DecimalFormat;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.salary.model.SalaryService;
import com.it.wanted.salary.model.SalaryVO;

@Controller
@RequestMapping("/jobsalary")
public class SalaryController {
	private static final Logger logger
		= LoggerFactory.getLogger(SalaryController.class);
	
	@Autowired private SalaryService salaryService;
	
	@ResponseBody
	@RequestMapping("/salaryChartData.do")
	public List<Map<String, Object>> selectSalary(@ModelAttribute SalaryVO vo) {
		vo.getJikgunCode();
		vo.getJikmuCode();
		
		logger.info("jikgunCode={}", vo.getJikgunCode());
		logger.info("jikmuCode={}", vo.getJikmuCode());
		
		List<Map<String, Object>> list = salaryService.selectSalary(vo);
		logger.info("list={}", list);
		logger.info("listlength={}", list.get(0).size());
		
		return list;
	}
	
	@ResponseBody
	@RequestMapping("/getSalary.do")
	private String getSalary(@ModelAttribute SalaryVO vo) {
		vo.getCareer();
		vo.getJikmuCode();
		logger.info("career={}", vo.getCareer());
		
		int cnt = salaryService.getSalary(vo);
		logger.info("연봉조회 결과, cnt={}", cnt);
		
		DecimalFormat formatter = new DecimalFormat("###,###.##");
		return formatter.format(cnt);
	}
	
}