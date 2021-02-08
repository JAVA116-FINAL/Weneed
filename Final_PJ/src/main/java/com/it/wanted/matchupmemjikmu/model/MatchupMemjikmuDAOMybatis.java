package com.it.wanted.matchupmemjikmu.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupMemjikmuDAOMybatis implements MatchupMemjikmuDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.matchupmemjikmu.";
	
	@Override
	public int insertMatchupMemJikmu(MatchupMemJikmuVO mmjikmuVo) {
		return sqlSession.insert(namespace+"insertMatchupMemJikmu",mmjikmuVo);
	}
	
	
	
}
