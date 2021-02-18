package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;


public interface ApplicantsService {
	public List<ApplicantsVO> selectAllPositions(String comCode);

	public int selectTotalRecord(AppliPagingVO appliPagingVo);

	public ApplicantsVO selectByNo(int no);

	public List<Map<String, Object>> selectApplicants(AppliPagingVO appliPagingVo);
//	public List<Map<String, Object>> selectApplicants(int statusFlag);

	public int updateByNo(int no);

	//public List<Map<String, Object>> selectAll();

	public int updateStatus(ApplicantsVO applicantsVo);

	public List<Map<String, Object>> selectAll();

	public int countBunmo(AppliPagingVO appliPagingVo);

	public int countBunja(AppliPagingVO appliPagingVo);

	int insertApply(ApplicantsVO applyVo);

	int selectApplyComplete(int memNo);

	int selectDocumentPass(int memNo);

	int selectFinalAccept(int memNo);

	int selectFinalFail(int memNo);

	int selectTotalRecordbyAdmin(SearchVO searchVo);

	List<Map<String, Object>> selectApplyAllbyAdmin(SearchVO searchVo);

	int selectApplyTotal(int memNo);

	List<Map<String, Object>> selectApplyList(int memNo);


//	public List<Map<String, Object>> selectApplicants(ApplicantsVO appliVo);

//	public int updatePeriod(ApplicantsVO appliVo);
}
