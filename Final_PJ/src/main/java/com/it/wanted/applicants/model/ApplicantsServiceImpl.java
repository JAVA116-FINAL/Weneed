package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ApplicantsServiceImpl implements ApplicantsService{
	@Autowired
	private ApplicantsDAO applicantsDao;
	

//	@Override
//	public List<Map<String, Object>> selectApplicants(int statusFlag) {
//		return applicantsDao.selectApplicants(statusFlag);
//	}


	@Override
	public List<ApplicantsVO> selectAllPositions() {
		return applicantsDao.selectAllPositions();
	}

	@Override
	public int selectTotalRecord(AppliPagingVO appliPagingVo) {
		return applicantsDao.selectTotalRecord(appliPagingVo);
	}

	@Override
	public ApplicantsVO selectByNo(int no) {
		return applicantsDao.selectByNo(no);
	}


	@Override
	public List<Map<String, Object>> selectApplicants(AppliPagingVO appliPagingVo) {
		return applicantsDao.selectApplicants(appliPagingVo);
	}


//	@Override
//	public int updatePeriod(ApplicantsVO appliVo) {
//		// TODO Auto-generated method stub
//		return applicantsDao.updatePeriod(appliVo);
//	}



}
