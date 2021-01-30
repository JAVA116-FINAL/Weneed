package com.it.wanted.salary.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalaryDAOMybatis implements SalaryDAO {
	@Autowired SqlSessionTemplate sqlSession;
	
	private final static String namespace="config.mybatis.mapper.oracle.salary.";

	
}
