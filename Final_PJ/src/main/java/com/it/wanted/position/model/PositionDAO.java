package com.it.wanted.position.model;

public interface PositionDAO {

	int insertPosition(PositionVO posVo);
	int selectPosNo(PositionVO posVo);
	int insertPosJikmu(PosJikmuVO vo);

}
