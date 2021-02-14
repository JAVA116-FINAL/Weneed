package com.it.wanted.position.model;

import java.util.List;
import java.util.Map;

public interface PositionDAO {

	int insertPosition(PositionVO posVo);
	int selectPosNo(PositionVO posVo);
	int insertPosJikmu(PosJikmuVO vo);
	List<Map<String, Object>> selectJobsearchList();

}
