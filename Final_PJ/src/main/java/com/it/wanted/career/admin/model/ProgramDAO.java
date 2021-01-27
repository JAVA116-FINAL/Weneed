package com.it.wanted.career.admin.model;

public interface ProgramDAO {
	public int insertProgram(ProgramVO proVo);

	public ProgramVO selectByProgramNo(int programNo);

}
