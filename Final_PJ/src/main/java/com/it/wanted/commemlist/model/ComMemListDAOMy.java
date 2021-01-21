package com.it.wanted.commemlist.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComMemListDAOMy implements ComMemListDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.comMemList.";
	
	@Override
	public int checkComReged(int memNo) {
		return sqlSession.selectOne(namespace+"checkComReged", memNo);
	}

	@Override
	public String selectComCode(int memNo) {
		return sqlSession.selectOne(namespace+"selectComCode", memNo);
	}
	
}
