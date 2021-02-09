package com.it.wanted.main.search.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MainSearchDAOMybatis implements MainSearchDAO {

	@Autowired SqlSessionTemplate sqlSession;
	
	private final static String namespace="config.mybatis.mapper.oracle.mainSearch.";

	@Override
	public List<MainSearchVO> searchComInfo(String keyword) {
		return sqlSession.selectList(namespace+"searchComInfo", keyword);
	}

	@Override
	public List<MainSearchVO> searchPosition(String keyword) {
		return sqlSession.selectList(namespace+"searchPosition", keyword);
	}

	@Override
	public List<Map<String, Object>> getSearchKeyword(String keyword) {
		return sqlSession.selectList(namespace+"getSearchKeyword", keyword);
	}
}
