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

	@Override
	public List<ApplicantsVO> selectAllPositions(String comCode) {
		return applicantsDao.selectAllPositions(comCode);
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

	@Override
	public int updateByNo(int no) {
		return applicantsDao.updateByNo(no);
	}



	@Override
	public int updateStatus(ApplicantsVO applicantsVo) {
		return applicantsDao.updateStatus(applicantsVo);
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return applicantsDao.selectAll();
	}

	@Override
	public int countBunmo(AppliPagingVO appliPagingVo) {
		return applicantsDao.countBunmo(appliPagingVo);
	}

	@Override
	public int countBunja(AppliPagingVO appliPagingVo) {
		return applicantsDao.countBunja(appliPagingVo);
	}

//	@Override
//	public int updatePeriod(ApplicantsVO appliVo) {
//		// TODO Auto-generated method stub
//		return applicantsDao.updatePeriod(appliVo);
//	}

	/* 자연 */
	@Override
	public int insertApply(ApplicantsVO applyVo) {
		return applicantsDao.insertApply(applyVo);
	}

	@Override
	public List<Map<String, Object>> selectApplyAllbyAdmin(SearchVO searchVo) {
		return applicantsDao.selectApplyAllbyAdmin(searchVo);
	}
 
	@Override
	public int selectTotalRecordbyAdmin(SearchVO searchVo) {
		return applicantsDao.selectTotalRecordbyAdmin(searchVo);
	}
	
	/* 가은 */
	@Override
	public int selectApplyComplete(int memNo) {
		return applicantsDao.selectApplyComplete(memNo);
	}

	@Override
	public int selectDocumentPass(int memNo) {
		return applicantsDao.selectDocumentPass(memNo);
	}

	@Override
	public int selectFinalAccept(int memNo) {
		return applicantsDao.selectFinalAccept(memNo);
	}

	@Override
	public int selectFinalFail(int memNo) {
		return applicantsDao.selectFinalFail(memNo);
	}

	@Override
	public int selectApplyTotal(int memNo) {
		return applicantsDao.selectApplyTotal(memNo);
	}

	@Override
	public List<Map<String, Object>> selectApplyList(int memNo) {
		return applicantsDao.selectApplyList(memNo);
	}

	@Override
	public int changeStatus1(int applyNo) {
		return applicantsDao.changeStatus1(applyNo);
	}

	@Override
	public int changeStatus2(int applyNo) {
		return applicantsDao.changeStatus2(applyNo);		
	}

	@Override
	public int changeStatus3(int applyNo) {
		return applicantsDao.changeStatus3(applyNo);		
	}

}
