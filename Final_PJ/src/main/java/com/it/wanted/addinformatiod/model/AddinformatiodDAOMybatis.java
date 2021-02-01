package com.it.wanted.addinformatiod.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddinformatiodDAOMybatis implements AddinformatiodDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.addinformatiod.";
	
	@Override
	public int insertAdd(AddinformatiodVO aVo) {
		return sqlSession.insert(namespace+"insertAdd", aVo);
	}
	@Override
	public AddinformatiodVO selectAdd(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectAdd",resumeNo);
	}
	@Override
	public int deleteAdd(int addNo) {
		return sqlSession.delete(namespace+"deleteAdd",addNo);
	}
	@Override
	public int updateAdd(AddinformatiodVO aVo) {
		return sqlSession.update(namespace+"updateAdd",aVo);
	}
	
	

}
