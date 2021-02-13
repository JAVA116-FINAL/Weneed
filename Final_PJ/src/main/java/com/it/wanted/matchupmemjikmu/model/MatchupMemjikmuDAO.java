package com.it.wanted.matchupmemjikmu.model;

import java.util.List;
import java.util.Map;

public interface MatchupMemjikmuDAO {
	public int insertMatchupMemJikmu(MatchupMemJikmuVO mmjikmuVo);
	public List<MatchupMemJikmuVO> selectMcuMemjikmubyexpertiseNo(int expertiseNo);
	public List<Map<String, Object>> selectMjikmuView(int expertiseNo);
	public int deleteMatchupJikmu(int expertiseNo);
}
