package com.it.wanted.career.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CareerDAOMybatis implements CareerDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="com.mybatis.mapper.oracle.career.";
	
	@Override
	public int insertCareer(CareerVO careerVo) {
		return sqlSession.insert(namespace+"insertCareer", careerVo);
	}
	
	
	@Override
	public CareerVO selectCareer(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectCareer",resumeNo);
	}


	@Override
	public int updateCareer(CareerVO careerVo) {
		return sqlSession.update(namespace+"updateCareer",careerVo);
	}


	@Override
	public int deleteCareer(int careerNo) {
		return sqlSession.delete(namespace+"deleteCareer", careerNo);
	}

	@Override
	public List<CareerVO> selectCareerbyResumeNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectCareerbyResumeNo",resumeNo);
	}

	
	
	/* 현빈 */
	@Override
	public List<Integer> selectMcumemNo(String keyword) {
		return sqlSession.selectList(namespace+"selectMcumemNo", keyword);
	}

}
