package com.it.wanted.jobsearchdetail.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.position.model.PositionVO;


@Repository
public class JobsearchdetailDAOMybatis implements JobsearchdetailDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.oracle.jobsearchdetail.";
	
	/* 지원 0215 */
	@Override
	public PositionVO selectPositionInfoJobSearch(int posNo) {
		return sqlSession.selectOne(namespace + "selectPositionInfoJobSearch", posNo);
	}

	@Override
	public ComInfoVO selectComNameByComNo(int posNo) {
		return sqlSession.selectOne(namespace+"selectComNameByComNo", posNo);
	}

	@Override
	public String selectComImage(int posNo) {
		return sqlSession.selectOne(namespace+"selectComImage", posNo);
	}

	@Override
	public List<Map<String, Object>> selectAllRecruites(int posNo) {
		return sqlSession.selectList(namespace + "selectAllRecruites", posNo);
	}

	@Override
	public String selectMemberName(String email) {
		return sqlSession.selectOne(namespace+"selectMemberName", email);
	}

	@Override
	public Map<String, Object> selectComNameByComNo_2(int posNo) {
		return sqlSession.selectOne(namespace+"selectComNameByComNo_2", posNo);
	}	
	
}
