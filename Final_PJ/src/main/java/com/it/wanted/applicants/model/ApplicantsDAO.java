package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

public interface ApplicantsDAO {

	public List<ApplicantsVO> selectAllPositions();

	public int selectTotalRecord(AppliPagingVO appliPagingVo);

	public ApplicantsVO selectByNo(int no);

	//public List<Map<String, Object>> selectApplicants(int statusFlag);

	public List<Map<String, Object>> selectApplicants(AppliPagingVO appliPagingVo);

}
