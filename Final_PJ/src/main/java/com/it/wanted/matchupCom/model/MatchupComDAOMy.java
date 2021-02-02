package com.it.wanted.matchupCom.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupComDAOMy implements MatchupComDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.matchupCom.";
	
}
