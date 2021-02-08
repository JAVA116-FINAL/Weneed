package com.it.wanted.matchupCom.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupComDAOMy implements MatchupComDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.matchupCom.";
	
	@Override
	public int addZzim(MatchupZzimVO zzimVo) {
		return sqlSession.insert(namespace+"addZzim", zzimVo);
	}

	@Override
	public int isZzimed(MatchupZzimVO zzimVo) {
		return sqlSession.selectOne(namespace+"isZzimed", zzimVo);
	}

	@Override
	public int delZzim(MatchupZzimVO zzimVo) {
		return sqlSession.delete(namespace+"delZzim", zzimVo);
	}

	@Override
	public int checkListedMatchup(String comCode) {
		return sqlSession.selectOne(namespace+"checkListedMatchup", comCode);
	}

	@Override
	public Map<String, Float> isOverMatchup(String comCode) {
		return sqlSession.selectOne(namespace+"isOverMatchup", comCode);
	}
	
}
