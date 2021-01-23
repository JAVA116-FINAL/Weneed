package com.it.wanted.cominfo.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComInfoDAOMy implements ComInfoDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.comInfo.";
	
	@Override
	public ComInfoVO selectCompany(int comMemNo) {
		return sqlSession.selectOne(namespace+"selectCompany", comMemNo);
	}
	
	
}
