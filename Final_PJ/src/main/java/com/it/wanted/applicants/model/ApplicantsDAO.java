package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface ApplicantsDAO {

	public List<ApplicantsVO> selectAllPositions(String comCode);

	public int selectTotalRecord(AppliPagingVO appliPagingVo);

	public ApplicantsVO selectByNo(int no);

	//public List<Map<String, Object>> selectApplicants(int statusFlag);
 
	public List<Map<String, Object>> selectApplicants(AppliPagingVO appliPagingVo);

	public int updateByNo(int no);

	public List<Map<String, Object>> selectAll();

	public int updateStatus(ApplicantsVO applicantsVo);

	public int countBunmo(AppliPagingVO appliPagingVo);
	public int countBunja(AppliPagingVO appliPagingVo);
	
	/* 자연 */
	public int insertApply(ApplicantsVO applyVo);
	public List<Map<String, Object>> selectApplyAllbyAdmin(SearchVO searchVo);
	public int selectTotalRecordbyAdmin(SearchVO searchVo);

	/* 가은 */
	public int selectApplyComplete(int memNo);

	public int selectDocumentPass(int memNo);

	public int selectFinalAccept(int memNo);

	public int selectFinalFail(int memNo);

	public int selectApplyTotal(int memNo);

	public List<Map<String, Object>> selectApplyList(int memNo);

	public int changeStatus1(int applyNo);
	public int changeStatus2(int applyNo);
	public int changeStatus3(int applyNo);

}
