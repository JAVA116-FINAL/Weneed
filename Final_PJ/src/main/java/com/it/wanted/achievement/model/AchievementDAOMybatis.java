package com.it.wanted.achievement.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AchievementDAOMybatis implements AchievementDAO{
	private static final String namespace="com.mybatis.mapper.achievement.";
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Override
	public int insertAch(AchievementVO aVo) {
		return sqlSession.insert(namespace+"insertAch",aVo);
	}
	@Override
	public AchievementVO selectAch(int careerNo) {
		return sqlSession.selectOne(namespace+"selectAch",careerNo);
	}
	@Override
	public int updateAch(AchievementVO aVo) {
		return sqlSession.update(namespace+"updateAch",aVo);
	}
	@Override
	public int deleteAch(int achNo) {
		return sqlSession.delete(namespace+"deleteAch",achNo);
	}
	@Override
	public int deleteAchbyCareerNo(int careerNo) {
		return sqlSession.delete(namespace+"deleteAchbyCareerNo", careerNo);
	}
	
	

}
