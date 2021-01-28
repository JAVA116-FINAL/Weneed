package com.it.wanted.career.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.common.SearchVO;

@Service
public class ProgramServiceImpl implements ProgramService{

	@Autowired private ProgramDAO programDao;
	
	public int insertProgram(ProgramVO proVo) {
		return programDao.insertProgram(proVo);
	}

	@Override
	public ProgramVO selectByProgramNo(int programNo) {
		return programDao.selectByProgramNo(programNo);
	}

	@Override
	public List<ProgramVO> selectAll(SearchVO searchVo) {
		return programDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return programDao.selectTotalRecord(searchVo);

	}
}