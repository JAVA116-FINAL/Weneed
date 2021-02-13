package com.it.wanted.resume.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOMybatis implements ResumeDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final static String namespace ="com.mybatis.mapper.oracle.resume.";
	
	@Override
	public int insertResume(ResumeVO vo) {
		return sqlSession.update(namespace+"insertResume",vo);
	}

	@Override
	public ResumeVO selectResume(int memNo) {
		return sqlSession.selectOne(namespace+"selectResume",memNo);
	}

	@Override
	public int updateResume(ResumeVO vo) {
		return sqlSession.update(namespace+"updateResume",vo);
	}

	@Override
	public List<ResumeVO> selectResumeAll(int memNo) {
		return sqlSession.selectList(namespace+"selectResumeAll",memNo);
	}

	@Override
	public int insertResumeFile(ResumeVO rVo) {
		return sqlSession.update(namespace+"insertResumeFile",rVo);
	}

	@Override
	public int deleteResume(ResumeVO rVo) {
		return sqlSession.delete(namespace+"deleteResume", rVo);
	}

	@Override
	public ResumeVO selectResumeOne(ResumeVO rVo) {
		return sqlSession.selectOne(namespace+"selectResumeOne", rVo);
	}

	
	/* 현빈 */
	@Override
	public ResumeVO selectResumeByResumeNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectResumeByResumeNo", resumeNo);
	}
	
	@Override
	public int insertMcuResume(ResumeVO rVo) {
		return sqlSession.update(namespace+"insertMcuResume",rVo);
	}

	@Override
	public ResumeVO selectResumeOnebyResumeNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectResumeOnebyResumeNo",resumeNo);
	}

	@Override
	public int updateResumeIntroduce(ResumeVO rVo) {
		return sqlSession.update(namespace+"updateResumeIntroduce",rVo);
	}
	
	
}
