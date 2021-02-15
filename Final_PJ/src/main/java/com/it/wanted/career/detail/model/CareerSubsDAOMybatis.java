package com.it.wanted.career.detail.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CareerSubsDAOMybatis implements CareerSubsDAO{

	@Autowired
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.mybatis.mapper.oracle.subscription.";

	public int insertSubs(CareerSubsVO subsVo) {
		return sqlSession.insert(namespace + "insertSubs", subsVo);
	}


}
