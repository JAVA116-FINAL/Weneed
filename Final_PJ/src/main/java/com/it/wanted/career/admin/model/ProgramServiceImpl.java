package com.it.wanted.career.admin.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.wanted.career.cate.model.CareerCategoryVO;
import com.it.wanted.common.SearchVO;

@Service
public class ProgramServiceImpl implements ProgramService {
	private static final Logger logger = LoggerFactory.getLogger(ProgramServiceImpl.class);

	@Autowired
	private ProgramDAO programDao;

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
		int cnt = 0;
		try {
			for (ProgramVO vo : proList) {
				int programNo = vo.getProgramNo();
				if (programNo != 0) { // 체크된 것만 삭제
					cnt = programDao.deleteProgram(programNo);
				}
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt = -1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

		return cnt;
	}

	@Override
	public int insertProgram2(ProgramVO2 proVo) {
		return programDao.insertProgram2(proVo);
	}

	@Override
	public int updateProgramEdit1(ProgramVO proVo) {
		return programDao.updateProgramEdit1(proVo);
	}

	/*
	 * @Override public List<Map<String, Object>>
	 * selectProgramDetailsView(ProgramVO2 proVo2) { return
	 * programDao.selectProgramDetailsView(proVo2); }
	 */

	
	@Override
	public int insertIntoProgramContents(ProgramVO2 proVo2Con) {
		return programDao.insertIntoProgramContents(proVo2Con);
	}

	@Override
	public List<ProgramVO2> selectProgramContentsView(int programNo) {
		return programDao.selectProgramContentsView(programNo);
	}
	@Override
	public ProgramVO selectProgramView(int programNo) {
		return programDao.selectProgramView(programNo);
	}

	@Override
	public int updateProgramEditTotal(ProgramVO2 proVo2Con) {
		return programDao.updateProgramEditTotal(proVo2Con);
	}

		
	@Override
	@Transactional
	public int deleteOneProgram(ProgramVO proVo) {
			return programDao.deleteOneProgram(proVo);
	}

	@Override
	public String selectMembersName(String email) {
		return programDao.selectMembersName(email);
	}

	@Override
	public List<ProgramVO> selectSimilarProgram() {
		return programDao.selectSimilarProgram();
	}

	@Override
	public List<ProgramVO> selectAllProgramsForMain() {
		return programDao.selectAllProgramsForMain();
	}

	@Override
	public List<CareerCategoryVO> selectMatchCategoryNameMain() {
		return programDao.selectMatchCategoryNameMain();
	}

	
	/*
	 * @Override public int insertIntoProgramContents(ProgramVO2 proVo2) {
	 * 
	 * List<ProgramVO2> proVo2List = proVoAll.getProVo2List();
	 * List<ProgramVO2> proVo2List = new ArrayList<ProgramVO2>(); int cnt=0;
 
	 * 
	 * int cnt=0; if(proVoConList != null && !proVoConList.isEmpty()) {
	 * 
	 * for(ProgramVO2 proVo2Con : proVoConList) {
	 * cnt=programDao.insertIntoProgramContents(proVo2Con);
	 * logger.info("프로그램 내용 등록 결과, cnt={}", cnt); } }
	 * 
	 * 
	 * int cnt=programDao.insertIntoProgramContents(proVo2);
	 * logger.info("프로그램 내용 등록 결과, cnt={}", cnt);
	 * 
	 * return cnt; }
	 */

}