package com.it.wanted.proposal.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProposalDAOMy implements ProposalDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="";
	
}
