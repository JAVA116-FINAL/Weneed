package com.it.wanted.resume.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOMybatis implements ResumeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final static String namespace ="com.mybatis.mapper.oracle.resume.";
	
	@Override
	public int insertResume(ResumeVO vo) {
		return sqlSession.update(namespace+"insertResume",vo);
	}

	@Override
	public ResumeVO selectResume(int memNo) {
		return sqlSession.selectOne(namespace+"selectResume",memNo);
	}

	@Override
	public int updateResume(ResumeVO vo) {
		return sqlSession.update(namespace+"updateResume",vo);
	}
	
	
	
}
