package com.it.wanted.salary.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalaryServiceImpl implements SalaryService{
	
	@Autowired SalaryDAO salaryDao;

}
