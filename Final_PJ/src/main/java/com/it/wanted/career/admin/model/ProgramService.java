package com.it.wanted.career.admin.model;

import java.util.List;

import com.it.wanted.common.SearchVO;

public interface ProgramService {
	public int insertProgram(ProgramVO proVo);
	public ProgramVO selectByProgramNo(int programNo);
	public List<ProgramVO> selectAllprogram(SearchVO searchVo);  
	public int selectListTotalRecord(SearchVO searchVo);
	public int deleteProgramMulti(List<ProgramVO> proList);
	public List<ProgramVO2> insertProgram2(ProgramVO2 proVo);
	 	 

}
