package com.it.wanted.matchupStatus.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface MatchupStatusDAO {

	int checkStatusCount(MatchupStatusVO statusVo);
	int insertStatus(MatchupStatusVO statusVo);
	
  /* 0216 자연 */
	public List<Map<String, Object>> selectMatchupStatusbyAdmin(SearchVO searchVo);
	public int selectTotalRecordbyAdmin(SearchVO searchVo);
  
  /* 현빈 */
	void updateProposalDate(MatchupStatusVO statusVo);
	void insertProposal(MatchupStatusVO statusVo);

}
