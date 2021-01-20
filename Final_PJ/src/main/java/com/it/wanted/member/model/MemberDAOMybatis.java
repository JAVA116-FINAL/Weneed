package com.it.wanted.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.member.";

	@Override
	public int insertMember(MemberVO vo) {
		int cnt = sqlSession.insert(namespace+"insertMember", vo);
		return cnt;
	}

}
