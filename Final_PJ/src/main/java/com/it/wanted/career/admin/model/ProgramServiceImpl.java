package com.it.wanted.career.admin.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProgramServiceImpl implements ProgramService{

	@Autowired private ProgramDAO programDao;
	
	public int insertProgram(ProgramVO proVo) {
		return programDao.insertProgram(proVo);
	}
}
