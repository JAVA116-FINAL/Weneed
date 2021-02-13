package com.it.wanted.matchupexcom.model;

import java.util.List;
import java.util.Map;

public interface MatchupExComService {
	public int insertMatchupExCom(MatchupExComVO matchupexcomVo);
	public int deleteMatchuoExcom(MatchupExComVO matchupexcomVo);
	public Map<String, Object> selectExcomView(MatchupExComVO matchupexcomVo);
	
}
