package com.it.wanted.matchup.model;

import java.util.List;

public interface MatchupMemDAO {

	List<MatchupMemVO> selectOpen();
	/* 자연 */
	public int isMechupMem(int memNo);
	public int selectmcuResumeNo(int memNo);

}
