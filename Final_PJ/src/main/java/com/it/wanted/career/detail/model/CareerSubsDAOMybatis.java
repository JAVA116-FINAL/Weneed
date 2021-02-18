package com.it.wanted.career.detail.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.member.model.MemberVO;


@Repository
public class CareerSubsDAOMybatis implements CareerSubsDAO{

	@Autowired
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.mybatis.mapper.oracle.subscription.";

	public int insertSubs(CareerSubsVO subsVo) {
		return sqlSession.insert(namespace + "insertSubs", subsVo);
	}

	@Override
	public MemberVO selectMemberNameSub(String email) {
		return sqlSession.selectOne(namespace+"selectMemberNameSub", email);
	}


}
