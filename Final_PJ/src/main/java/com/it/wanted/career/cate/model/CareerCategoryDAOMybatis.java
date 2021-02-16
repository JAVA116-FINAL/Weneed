package com.it.wanted.career.cate.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CareerCategoryDAOMybatis implements CareerCategoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.oracle.careerCategory.";
	
	public List<CareerCategoryVO> selectCareerCategoryAll(){
		List<CareerCategoryVO> list=sqlSession.selectList(namespace+"selectCareerCategoryAll");
		
		return list;
	}

	@Override
	public String selectMatchCategoryName(int proCateNo) {
		return sqlSession.selectOne(namespace + "selectMatchCategoryName", proCateNo);
	} 
}
