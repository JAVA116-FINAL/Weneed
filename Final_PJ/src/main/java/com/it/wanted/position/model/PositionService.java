package com.it.wanted.position.model;

import java.util.List;
import java.util.Map;

public interface PositionService {

	int insertPosition(PositionVO posVo, List<String> jikmus);
	
	/* 현빈 0214 */
	List<Map<String, Object>> selectJobsearchList();

}
