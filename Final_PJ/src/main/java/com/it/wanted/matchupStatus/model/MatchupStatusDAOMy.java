package com.it.wanted.matchupStatus.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupStatusDAOMy implements MatchupStatusDAO{
	
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.matchupStatus.";
	
	@Override
	public int checkStatusCount(MatchupStatusVO statusVo) {
		return sqlSession.selectOne(namespace+"checkStatusCount", statusVo);
	}

	@Override
	public int insertStatus(MatchupStatusVO statusVo) {
		return sqlSession.insert(namespace+"insertStatus", statusVo);
	}

	@Override
	public void updateProposalDate(MatchupStatusVO statusVo) {
		sqlSession.update(namespace+"updateProposalDate", statusVo);
	}

	@Override
	public void insertProposal(MatchupStatusVO statusVo) {
		sqlSession.insert(namespace+"insertProposal", statusVo);
	}
	
}
