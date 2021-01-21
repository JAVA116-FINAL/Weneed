package com.it.wanted.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.member.";

	public int insertMember(MemberVO vo) {
		int cnt = sqlSession.insert(namespace+"insertMember", vo);
		return cnt;
	}
	
	public int checkEmail(String email) {
		int cnt = sqlSession.selectOne(namespace+"emailCheck", email);
		return cnt;
	}

	public int checkHp(String hp) {
		int cnt = sqlSession.selectOne(namespace+"hpCheck", hp);
		return cnt;
	}

}
