package com.it.wanted.matchupStatus.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.SearchVO;

@Repository
public class MatchupStatusDAOMy implements MatchupStatusDAO{
	
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.matchupStatus.";
	
	@Override
	public int checkStatusCount(MatchupStatusVO statusVo) {
		return sqlSession.selectOne(namespace+"checkStatusCount", statusVo);
	}

	@Override
	public int insertStatus(MatchupStatusVO statusVo) {
		return sqlSession.insert(namespace+"insertStatus", statusVo);
	}

	@Override
	public List<Map<String, Object>> selectMatchupStatusbyAdmin(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectMatchupStatusbyAdmin",searchVo);
	}

	@Override
	public int selectTotalRecordbyAdmin(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordbyAdmin", searchVo);
	}
  /* 현빈 */
  @Override
	public void updateProposalDate(MatchupStatusVO statusVo) {
		sqlSession.update(namespace+"updateProposalDate", statusVo);
	}

	@Override
	public void insertProposal(MatchupStatusVO statusVo) {
		sqlSession.insert(namespace+"insertProposal", statusVo);
	}

	/* 0218자연 */
	@Override
	public int openResumeCountbyMemNo(int memNo) {
		return sqlSession.selectOne(namespace+"openResumeCountbyMemNo", memNo);
	}
	
}
