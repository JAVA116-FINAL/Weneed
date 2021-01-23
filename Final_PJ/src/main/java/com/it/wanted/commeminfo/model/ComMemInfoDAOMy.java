package com.it.wanted.commeminfo.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComMemInfoDAOMy implements ComMemInfoDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.comMemInfo.";
	
	@Override
	public int checkId(String comMemId) {
		return sqlSession.selectOne(namespace+"checkId", comMemId);
	}

	@Override
	public String selectPwd(String comMemId) {
		return sqlSession.selectOne(namespace+"selectPwd", comMemId);
	}

	@Override
	public int selectMemNo(String comMemId) {
		return sqlSession.selectOne(namespace+"selectMemNo", comMemId);
	}

	@Override
	public int joinComMem(ComMemInfoVO vo) {
		return sqlSession.insert(namespace+"joinComMem", vo);
	}

	@Override
	public ComMemInfoVO selectComMem(String comMemLoginId) {
		return sqlSession.selectOne(namespace+"selectComMem", comMemLoginId);
	}
	
	
}
