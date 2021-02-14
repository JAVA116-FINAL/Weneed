package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.common.SearchVO;

@Service
public class ApplicantsServiceImpl implements ApplicantsService{
	@Autowired
	private ApplicantsDAO applicantsDao;
	
	private static final Logger logger= LoggerFactory.getLogger(ApplicantsServiceImpl.class);
	
//	@Override
//	public List<Map<String, Object>> selectApplicants(String comCode) {
//		return applicantsDao.selectApplicants(comCode);
//	}
//	@Override
//	public List<Map<String, Object>> selectApplicants(ApplicantsVO appliVo) {
//		return applicantsDao.selectApplicants(appliVo);
//	}
	@Override
	public List<Map<String, Object>> selectApplicants(int statusFlag) {
		return applicantsDao.selectApplicants(statusFlag);
	}

	@Override
	public List<ApplicantsVO> selectAllPositions() {
		return applicantsDao.selectAllPositions();
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return applicantsDao.selectTotalRecord(searchVo);
	}

	@Override
	public ApplicantsVO selectByNo(int no) {
		return applicantsDao.selectByNo(no);
	}

	@Override
	public List<Map<String, Object>> selectApplicants2() {
		return applicantsDao.selectApplicants2();
	}

//	@Override
//	public int updatePeriod(ApplicantsVO appliVo) {
//		// TODO Auto-generated method stub
//		return applicantsDao.updatePeriod(appliVo);
//	}



}
