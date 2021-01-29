package com.it.wanted.link.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LinkDAOMybatis implements LinkDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.link.";
	
	@Override
	public int insertLink(LinkVO linkVo) {
		return sqlSession.insert(namespace+"insertLink",linkVo);
	}
	@Override
	public LinkVO selectLink(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectLink",resumeNo);
	}
	@Override
	public int deleteLink(int linkNo) {
		return sqlSession.delete(namespace+"deleteLink",linkNo);
	}
	@Override
	public int updateLink(LinkVO linkVo) {
		return sqlSession.update(namespace+"updateLink",linkVo);
	}
	
}
