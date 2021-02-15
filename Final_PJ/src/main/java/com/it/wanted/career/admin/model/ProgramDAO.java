package com.it.wanted.career.admin.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface ProgramDAO {
	public int insertProgram(ProgramVO proVo);
	public ProgramVO selectByProgramNo(int programNo);
	public List<ProgramVO> selectAllprogram(SearchVO searchVo);
	public int selectListTotalRecord(SearchVO searchVo);
	public int deleteProgram(int programNo);
	public int insertProgram2(ProgramVO2 proVo2);
	public int updateProgramEdit1(ProgramVO proVo);
	public int insertIntoProgramContents(ProgramVO2 proVo2Con);
	public ProgramVO selectProgramView(int programNo);
	public List<ProgramVO2> selectProgramContentsView(int programNo);
	public int updateProgramEditTotal(ProgramVO2 proVo2Con);
	public int deleteOneProgram(ProgramVO proVo);


}
