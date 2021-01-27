package com.it.wanted.career.admin.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProgramDAOMybatis implements ProgramDAO{

	@Autowired 
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.mybatis.mapper.program.";
	
	public int insertProgram(ProgramVO proVo) {
		int cnt = sqlSession.insert(namespace+"insertProgram", proVo);
		return cnt;
	}
	
	
}
