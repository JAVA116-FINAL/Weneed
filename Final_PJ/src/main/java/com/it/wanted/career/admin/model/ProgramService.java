package com.it.wanted.career.admin.model;

import java.util.List;

import com.it.wanted.common.NoticeSearchVO;

public interface ProgramService {
	public int insertProgram(ProgramVO proVo);
	public ProgramVO selectByProgramNo(int programNo);
	public List<ProgramVO> selectAllprogram(NoticeSearchVO searchVo);  
	public int selectListTotalRecord(NoticeSearchVO searchVo);
	public int deleteProgramMulti(List<ProgramVO> proList);
	public List<ProgramVO2> insertProgram2(ProgramVO2 proVo);
	 	 

}
