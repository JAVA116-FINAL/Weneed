package com.it.wanted.notice.cate.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeCateDAOMyBatis implements NoticeCateDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.noticeCategory.";
	
	@Override
	public String selectCate1(int notice_dept1) {
		return sqlSession.selectOne(namespace+"selectCate1", notice_dept1);
	}

	@Override
	public String selectCate2(int notice_dept2) {
		return sqlSession.selectOne(namespace+"selectCate2", notice_dept2);
	}
	
	@Override
	public List<Map<String, Object>> selectDept2Count(int notice_dept1) {
		return sqlSession.selectList(namespace+"selectDept2Count", notice_dept1);
	}



	
}
