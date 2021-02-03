package com.it.wanted.matchup.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupMemDAOMybatis implements MatchupMemDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.matchupMem.";
	
	/* 자연 */
	@Override
	public int selectmcuResumeNo(int memNo) {
		int cnt=sqlSession.selectOne(namespace+"selectmcuResumeNo", memNo);
		return cnt;
	}

	@Override
	public int isMechupMem(int memNo) {
		return sqlSession.selectOne(namespace+"isMechupMem", memNo);
	}
	
	/* 현빈 */
	@Override
	public List<MatchupMemVO> selectOpen() {
		return sqlSession.selectList(namespace+"selectOpen");
	}
	
	@Override
	public List<Map<String, Object>> selectTenMem(int firstRecord) {
		return sqlSession.selectList(namespace+"selectTenMem", firstRecord);
	}

	@Override
	public int selectMcumemNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectMcumemNo", resumeNo);
	}
	
	

	

	
	
}
