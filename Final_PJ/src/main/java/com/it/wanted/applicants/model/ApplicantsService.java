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


//	public List<Map<String, Object>> selectApplicants(ApplicantsVO appliVo);

//	public int updatePeriod(ApplicantsVO appliVo);
	
	/* 자연 */
	public int insertApply(ApplicantsVO applyVo);
	public List<Map<String, Object>> selectApplyAllbyAdmin(SearchVO searchVo);
	public int selectTotalRecordbyAdmin(SearchVO searchVo);
	
	/*가은*/
	public int selectApplyComplete(int memNo);
	public int selectDocumentPass(int memNo);
	public int selectFinalAccept(int memNo);
	public int selectFinalFail(int memNo);
	public int selectApplyTotal(int memNo);

	public List<Map<String, Object>> selectApplyList(int memNo);
}
