package com.it.wanted.career.cate.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareerCategoryServiceImpl implements CareerCategoryService{

	@Autowired
	private CareerCategoryDAO careerCategoryDao;

	@Override
	public List<CareerCategoryVO> selectCareerCategoryAll() {
		return null;
	}
}
