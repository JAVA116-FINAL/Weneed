package com.it.wanted.comimginfo.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComImgInfoDAOMy implements ComImgInfoDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.comImgInfo.";
	
	@Override
	public int selectRegedImgCnt(String comCode) {
		return sqlSession.selectOne(namespace+"selectRegedImgCnt", comCode);
	}
	
	
}
