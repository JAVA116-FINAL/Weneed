package com.it.wanted.matchup.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class matchupMemDAOMybatis implements matchupMemDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.matchupMem.";
}
