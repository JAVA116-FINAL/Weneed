package com.it.wanted.matchupCom.model;

import java.util.List;
import java.util.Map;

public interface MatchupComService {

	int addZzim(MatchupZzimVO zzimVo);
	int isZzimed(MatchupZzimVO zzimVo);
	int delZzim(MatchupZzimVO zzimVo);
	Map<String, Float> hasMatchup(String comCode);
	/* 0212 자연 */
	public List<Map<String, Object>> selectSearchmatchupCombyComName(String comName);
}
