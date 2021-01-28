package com.it.wanted.matchup.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupMemDAOMybatis implements MatchupMemDAO{
	
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.matchupMem.";
	
	@Override
	public List<MatchupMemVO> selectOpen() {
		return sqlSession.selectList(namespace+"selectOpen");
	}
	
	
}
