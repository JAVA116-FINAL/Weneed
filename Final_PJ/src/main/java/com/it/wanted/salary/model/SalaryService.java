package com.it.wanted.salary.model;

import java.util.List;
import java.util.Map;

public interface SalaryService {
	public List<Map<String, Object>> selectSalary(SalaryVO vo);
}
