package com.it.wanted.languages.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LanguagesDAOMybatis implements LanguagesDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.languages.";
	@Override
	public int insertLang(LanguagesVO lVo) {
		return sqlSession.insert(namespace+"insertLang",lVo);
	}
	@Override
	public LanguagesVO selectLang(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectLang",resumeNo);
	}
	@Override
	public int deleteLang(int langNo) {
		return sqlSession.delete(namespace+"deleteLang",langNo);
	}
	@Override
	public int updateLang(LanguagesVO lVo) {
		return sqlSession.update(namespace+"updateLang",lVo);
	}

	
	
}
