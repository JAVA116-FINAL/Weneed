package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface ApplicantsService {
	public List<ApplicantsVO> selectAllPositions();

	public int selectTotalRecord(SearchVO searchVo);

	public ApplicantsVO selectByNo(int no);

	public List<Map<String, Object>> selectApplicants(int statusFlag);
//	public List<Map<String, Object>> selectApplicants(String comCode);

	public List<Map<String, Object>> selectApplicants2();

//	public List<Map<String, Object>> selectApplicants(ApplicantsVO appliVo);

//	public int updatePeriod(ApplicantsVO appliVo);
	
	/* 자연 */
	public int insertApply(ApplicantsVO applyVo);
}
