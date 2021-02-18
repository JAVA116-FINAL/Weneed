package com.it.wanted.main.search.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.position.model.PosNewVO;

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
	public List<MainSearchVO> getSearchKeyword(String keyword) {
		return sqlSession.selectList(namespace+"getSearchKeyword", keyword);
	}

	@Override
	public List<MainSearchVO> getNewRecruit() {
		return sqlSession.selectList(namespace+"selectNewRecruitList");
	}

	@Override
	public List<ProgramVO> getMainCareerList() {
		return sqlSession.selectList(namespace+"selectMainCareerList");
	}

	@Override
	public List<PosNewVO> getMainPosList() {
		return sqlSession.selectList(namespace +"selectMainNewPosition");
	}
}
