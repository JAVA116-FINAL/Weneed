package com.it.wanted.matchupCom.model;

import java.util.Map;

public interface MatchupComDAO {

	int addZzim(MatchupZzimVO zzimVo);
	int isZzimed(MatchupZzimVO zzimVo);
	int delZzim(MatchupZzimVO zzimVo);
	int checkListedMatchup(String comCode);
	Map<String, Float> isOverMatchup(String comCode);

}
