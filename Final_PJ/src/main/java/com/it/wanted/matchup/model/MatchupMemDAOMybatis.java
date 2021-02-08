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
	public int isMatchupMem(int memNo) {
		return sqlSession.selectOne(namespace+"isMatchupMem", memNo);
	}
	
	@Override
	public int hasMcuResumeNo(int memNo) {
		return sqlSession.selectOne(namespace+"hasMcuResumeNo",memNo);
	}
	
	@Override
	public int insertMcuMem(MatchupMemVO mcuVo) {
		return sqlSession.insert(namespace+"insertMcuMem", mcuVo);
	}
	
	@Override
	public MatchupMemVO selectMcuMem(int mcuNo) {
		return sqlSession.selectOne(namespace+"selectMcuMem", mcuNo);
	}
	
	@Override
	public int updateMCUResume(MatchupMemVO mcuVo) {
		return sqlSession.update(namespace+"updateMCUResume",mcuVo);
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

	@Override
	public List<Map<String, Object>> selectMcumemSearchList(MatchupMemSearchVO mcuMemSearchVo) {
		return sqlSession.selectList(namespace+"selectMcumemSearchList", mcuMemSearchVo);
	}


	@Override
	public List<Map<String, Object>> selectZzimedList(List<Map<String, Object>> mcumemSearchResultList) {
		return sqlSession.selectList(namespace+"selectZzimedList", mcumemSearchResultList);
	}

	

	
}
