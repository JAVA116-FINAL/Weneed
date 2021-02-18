package com.it.wanted.matchupStatus.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface MatchupStatusService {
	public final static int RESUMECNT_OVER=10;
	public final static int RESUMECNT_REDUCED=20;
	public final static int RESUMECNT_READ=30;
	
	int updateStatus(int resumeNo, String comCode);
	
	/* 0207 자연 */
	public List<Map<String, Object>> selectMatchupStatusbyAdmin(SearchVO searchVo); 
	public int selectTotalRecordbyAdmin(SearchVO searchVo);
	public int openResumeCountbyMemNo(int memNo);
	
}
