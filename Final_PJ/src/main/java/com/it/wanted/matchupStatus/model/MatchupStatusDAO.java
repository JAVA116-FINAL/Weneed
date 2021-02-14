package com.it.wanted.matchupStatus.model;

public interface MatchupStatusDAO {

	int checkStatusCount(MatchupStatusVO statusVo);
	int insertStatus(MatchupStatusVO statusVo);

}
