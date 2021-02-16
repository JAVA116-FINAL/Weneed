package com.it.wanted.position.model;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.SearchVO;

@Repository
public class PositionDAOMy implements PositionDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.position.";
	
	@Override
	public int insertPosition(PositionVO posVo) {
		return sqlSession.insert(namespace+"insertPosition", posVo);
	}

	@Override
	public int selectPosNo(PositionVO posVo) {
		return sqlSession.selectOne(namespace+"selectPosNo", posVo);
	}

	@Override
	public int insertPosJikmu(PosJikmuVO vo) {
		return sqlSession.insert(namespace+"insertPosJikmu", vo);
	}

	@Override
	public List<Map<String, Object>> selectJobsearchList() {
		return sqlSession.selectList(namespace+"selectJobsearchList");
	}

	@Override
	public List<PositionVO> selectPositionByComcode(String comCode) {
		return sqlSession.selectList(namespace+"selectPositionByComcode", comCode);
	}


@Override
	public List<Map<String, Object>> selectPositionAllbyAdmin(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectPositionAllbyAdmin",searchVo);
	}

	@Override
	public int selectTotalRecordbyAdmin(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordbyAdmin",searchVo);
	}
	
}
