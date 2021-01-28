package com.it.wanted.career.admin.model;

import java.util.List;

import com.it.wanted.common.SearchVO;

public interface ProgramDAO {
	public int insertProgram(ProgramVO proVo);

	public ProgramVO selectByProgramNo(int programNo);

	public List<ProgramVO> selectAll(SearchVO searchVo);

	public int selectTotalRecord(SearchVO searchVo);

}
