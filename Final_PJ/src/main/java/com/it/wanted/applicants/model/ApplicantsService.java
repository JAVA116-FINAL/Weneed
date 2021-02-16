package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;


public interface ApplicantsService {
	public List<ApplicantsVO> selectAllPositions();

	public int selectTotalRecord(AppliPagingVO appliPagingVo);

	public ApplicantsVO selectByNo(int no);

	public List<Map<String, Object>> selectApplicants(AppliPagingVO appliPagingVo);
//	public List<Map<String, Object>> selectApplicants(int statusFlag);


//	public List<Map<String, Object>> selectApplicants(ApplicantsVO appliVo);

//	public int updatePeriod(ApplicantsVO appliVo);
}
