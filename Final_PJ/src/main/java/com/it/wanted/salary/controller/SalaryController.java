package com.it.wanted.salary.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.salary.model.SalaryService;

@Controller
@RequestMapping("/jobsalary")
public class SalaryController {
	private static final Logger logger
		= LoggerFactory.getLogger(SalaryController.class);
	
	@Autowired private SalaryService salaryService;
	
	
	
	
}