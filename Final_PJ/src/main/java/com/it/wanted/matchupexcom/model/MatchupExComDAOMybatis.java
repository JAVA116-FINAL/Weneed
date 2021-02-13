package com.it.wanted.matchupexcom.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupExComDAOMybatis implements MatchupExComDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.matchupexcom.";

	@Override
	public int selecMahuprgisterCheckCount(MatchupExComVO matchupexcomVo) {
		return sqlSession.selectOne(namespace+"selecMahuprgisterCheckCount",matchupexcomVo);
	}

	@Override
	public int insertMatchupExCom(MatchupExComVO matchupexcomVo) {
		return sqlSession.insert(namespace+"insertMatchupExCom",matchupexcomVo);
	}

	@Override
	public int deleteMatchuoExcom(MatchupExComVO matchupexcomVo) {
		return sqlSession.delete(namespace+"deleteMatchuoExcom",matchupexcomVo);
	}
	
	@Override
	public Map<String, Object> selectExcomView(MatchupExComVO matchupexcomVo) {
		return sqlSession.selectOne(namespace+"selectExcomView",matchupexcomVo);
	}	
	
}
