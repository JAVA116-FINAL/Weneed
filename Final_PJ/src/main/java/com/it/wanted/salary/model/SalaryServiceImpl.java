package com.it.wanted.salary.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SalaryServiceImpl implements SalaryService{
	
	@Autowired SalaryDAO salaryDao;

	@Override
	public List<Map<String, Object>> selectSalary(SalaryVO vo) {
		return salaryDao.selectSalary(vo);
	}

	@Override
	public int getSalary(SalaryVO vo) {
		return salaryDao.getSalary(vo);
	}

}
