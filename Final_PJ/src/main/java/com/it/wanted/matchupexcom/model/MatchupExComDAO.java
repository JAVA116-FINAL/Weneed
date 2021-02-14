package com.it.wanted.matchupexcom.model;

import java.util.Map;

public interface MatchupExComDAO {
	public int selecMahuprgisterCheckCount(MatchupExComVO matchupexcomVo);
	public int insertMatchupExCom(MatchupExComVO matchupexcomVo);
	public Map<String, Object> selectExcomView(MatchupExComVO matchupexcomVo);
	public int deleteMatchuoExcom(MatchupExComVO matchupexcomVo);
	
}
