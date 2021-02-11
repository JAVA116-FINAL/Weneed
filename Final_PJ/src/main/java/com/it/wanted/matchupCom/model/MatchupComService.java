package com.it.wanted.matchupCom.model;

import java.util.Map;

public interface MatchupComService {

	int addZzim(MatchupZzimVO zzimVo);
	int isZzimed(MatchupZzimVO zzimVo);
	int delZzim(MatchupZzimVO zzimVo);
	Map<String, Object> hasMatchup(String comCode);

}
