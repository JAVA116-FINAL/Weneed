package com.it.wanted.matchupmemjikmu.model;

import java.util.List;
import java.util.Map;

public interface MatchupMemjikmuService {
	
	public List<MatchupMemJikmuVO> selectMcuMemjikmubyexpertiseNo(int expertiseNo);
	public List<Map<String, Object>> selectMjikmuView(int expertiseNo);
	
	
}
