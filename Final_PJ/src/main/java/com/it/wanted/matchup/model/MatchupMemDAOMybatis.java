package com.it.wanted.matchup.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.matchupCom.model.MatchupZzimVO;

@Repository
public class MatchupMemDAOMybatis implements MatchupMemDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.matchupMem.";
	private static final Logger logger=LoggerFactory.getLogger(MatchupMemDAOMybatis.class);
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
	public MatchupMemVO selectMcuMem(int memNo) {
		return sqlSession.selectOne(namespace+"selectMcuMem", memNo);
	}
	
	@Override
	public int updateMCUResume(MatchupMemVO mcuVo) {
		return sqlSession.update(namespace+"updateMCUResume",mcuVo);
	}
	/*0209*/
	@Override
	public List<MatchupDetailAllVO> selectMatchupDetails(int mcumemNo) {
		List<MatchupDetailAllVO>list= sqlSession.selectList(namespace+"selectMatchupDetails",mcumemNo);
		logger.info("mcumemNo={}",mcumemNo);
		logger.info("list={}",list);
		MatchupDetailAllVO mAllVo=list.get(0);
		logger.info("mAllVo",mAllVo);
		MatchupDetailsViewVO dVo = mAllVo.getMMDetailsVo();
		logger.info("dVO={}",dVo);
		
		
		return list;
	}
	
	@Override
	public List<Map<String, Object>> selectMcuExListView(int mcumemNo) {
		return sqlSession.selectList(namespace+"selectMcuExListView",mcumemNo);
	}
	
	/* 0210 */
	@Override
	public int updateMatchupResume(MatchupMemVO mcuVo) {
		return sqlSession.update(namespace+"updateMatchupResume",mcuVo);
	}
	
	@Override
	public MatchupDetailsViewVO selectMatchupDetailsView(int memNo) {
		return sqlSession.selectOne(namespace+"selectMatchupDetailsView", memNo);
	}
	
	@Override
	public int updateMatchupRefName(MatchupMemVO mcumemVo) {
		return sqlSession.update(namespace+"updateMatchupRefName",mcumemVo);
	}

	@Override
	public MatchupMemVO selectOnebymatchupMemNo(int mcumemNo) {
		return sqlSession.selectOne(namespace+"selectOnebymatchupMemNo",mcumemNo);
	}

	@Override
	public int updateMatchupjobFlag(MatchupMemVO mcuVo) {
		return sqlSession.update(namespace+"updateMatchupjobFlag",mcuVo);
	}
	
	@Override
	public int deleteMatchupmembyResumeNo(int resumeNo) {
		return sqlSession.delete(namespace+"deleteMatchupmembyResumeNo",resumeNo);
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
	public List<Map<String, Object>> selectZzimedList(MatchupMemSearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectZzimedList", searchVo);
	}


	@Override
	public int isZzimed(MatchupZzimVO zzimVo) {
		return sqlSession.selectOne(namespace+"isZzimed", zzimVo);
	}
  
}
