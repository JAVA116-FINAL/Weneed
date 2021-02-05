package com.it.wanted.matchupCom.model;

public interface MatchupComService {

	int addZzim(MatchupZzimVO zzimVo);
	int isZzimed(MatchupZzimVO zzimVo);
	int delZzim(MatchupZzimVO zzimVo);
	boolean hasMatchup(String comCode);

}
