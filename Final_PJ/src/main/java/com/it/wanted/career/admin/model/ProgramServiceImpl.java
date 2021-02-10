package com.it.wanted.career.admin.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
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
	public List<ProgramVO> selectAllprogram(SearchVO searchVo) { 
		  return programDao.selectAllprogram(searchVo); 
	}
	  
	@Override 
	public int selectListTotalRecord(SearchVO searchVo) { 
		return programDao.selectListTotalRecord(searchVo);
	}

	@Override
	@Transactional
	public int deleteProgramMulti(List<ProgramVO> proList) {
		int cnt=0;
		try {
			for(ProgramVO vo : proList) {
				int programNo=vo.getProgramNo();
				if(programNo!=0) {  //체크된 것만 삭제
					cnt=programDao.deleteProgram(programNo);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		
		return cnt;
	}

	@Override
	public List<ProgramVO2> insertProgram2(ProgramVO2 proVo) {
		return programDao.insertProgram2(proVo);
	}
	 
	/*
	 * @Override public List<ProgramVO> selectProductEvent(String eventName) {
	 * return programDao.selectProductEvent(eventName); }
	 */
}