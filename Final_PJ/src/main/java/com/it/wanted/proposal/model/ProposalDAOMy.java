package com.it.wanted.proposal.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProposalDAOMy implements ProposalDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.proposal.";
	
	@Override
	public int insertProposal(ProposalVO propoVo) {
		return sqlSession.insert(namespace+"insertProposal", propoVo);
	}
	
	@Override
	public int checkProposalCount(ProposalVO propoVo) {
		return sqlSession.selectOne(namespace+"checkProposalCount", propoVo);
	}
	
}
