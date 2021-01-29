package com.it.wanted.languagestest.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LanguagestestDAOMybatis implements LanguagestestDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.languagestest.";
	@Override
	public int insertLangtest(LanguagestestVO ltVo) {
		return sqlSession.insert(namespace+"insertLangtest",ltVo);
	}
	@Override
	public LanguagestestVO selectLangtest(int langNo) {
		return sqlSession.selectOne(namespace+"selectLangtest",langNo);
	}
	@Override
	public int deleteLangtest(int langtestNo) {
		return sqlSession.delete(namespace+"deleteLangtest",langtestNo);
	}
	@Override
	public int deleteLangtestbylangNo(int langNo) {
		return sqlSession.delete(namespace+"deleteLangtestbylangNo", langNo);
	}
	@Override
	public int updateLangtest(LanguagestestVO langtestVo) {
		return sqlSession.update(namespace+"updateLangtest",langtestVo);
	}

}
