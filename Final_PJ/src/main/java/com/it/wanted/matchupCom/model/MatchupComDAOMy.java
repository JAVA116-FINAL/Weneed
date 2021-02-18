package com.it.wanted.matchupCom.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.SearchVO;

@Repository
public class MatchupComDAOMy implements MatchupComDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.matchupCom.";
	
	@Override
	public int addZzim(MatchupZzimVO zzimVo) {
		return sqlSession.insert(namespace+"addZzim", zzimVo);
	}

	@Override
	public int isZzimed(MatchupZzimVO zzimVo) {
		return sqlSession.selectOne(namespace+"isZzimed", zzimVo);
	}

	@Override
	public int delZzim(MatchupZzimVO zzimVo) {
		return sqlSession.delete(namespace+"delZzim", zzimVo);
	}

	@Override
	public int checkListedMatchup(String comCode) {
		return sqlSession.selectOne(namespace+"checkListedMatchup", comCode);
	}

	@Override
	public Map<String, Object> isOverMatchup(String comCode) {
		return sqlSession.selectOne(namespace+"isOverMatchup", comCode);
	}

	@Override
	public MatchupComVO selectMatchupCom(String comCode) {
		return sqlSession.selectOne(namespace+"selectMatchupCom", comCode);
	}

	@Override
	public int updateResumeReadCount(int mcucomNo) {
		return sqlSession.update(namespace+"updateResumeReadCount", mcucomNo);
	}

	@Override
	public int checkResumeReadCount(int mcucomNo) {
		return sqlSession.selectOne(namespace+"checkResumeReadCount", mcucomNo);
	}
	
	/* 0212 자연 */
	@Override
	public List<Map<String, Object>> selectSearchmatchupCombyComName(String comName) {
		return sqlSession.selectList(namespace+"selectSearchmatchupCombyComName",comName);
	}

	@Override
	public List<Map<String, Object>> selectMatchupComAllbyAdmin(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectMatchupComAllbyAdmin",searchVo);
	}

	@Override
	public int selectTotalRordbyAdmin(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRordbyAdmin",searchVo);
	}
	
}
