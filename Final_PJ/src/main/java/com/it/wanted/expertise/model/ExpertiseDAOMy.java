package com.it.wanted.expertise.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ExpertiseDAOMy implements ExpertiseDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.oracle.expertise.";
	
	/* 현빈 */
	@Override
	public List<Integer> selectMcumemNo(String keyword) {
		return sqlSession.selectList(namespace+"selectMcumemNo", keyword);
	}

	/* 자연 */
	@Override
	public int insertExpertise(ExpertiseVO eVo) {
		return sqlSession.insert(namespace+"insertExpertise",eVo); 
	}

	@Override
	public int selectUptodateExpertNo() {
		return sqlSession.selectOne(namespace+"selectUptodateExpertNo");
	}

	@Override
	public ExpertiseVO selectExpertise(int expertiseNo) {
		return sqlSession.selectOne(namespace+"selectExpertise", expertiseNo);
	}

	@Override
	public int updateMatchupExpertise(ExpertiseVO expertiseVo) {
		return sqlSession.update(namespace+"updateMatchupExpertise", expertiseVo);
	}

	@Override
	public int deleteExpertise(int expertiseNo) {
		return sqlSession.delete(namespace+"deleteExpertise",expertiseNo);
	}
	
}
