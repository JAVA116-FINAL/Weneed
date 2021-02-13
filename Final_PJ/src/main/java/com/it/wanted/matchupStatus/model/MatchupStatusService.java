package com.it.wanted.matchupStatus.model;

public interface MatchupStatusService {
	public final static int RESUMECNT_OVER=10;
	public final static int RESUMECNT_REDUCED=20;
	public final static int RESUMECNT_READ=30;
	
	int updateStatus(int resumeNo, String comCode);

	
}
