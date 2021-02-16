package com.it.wanted.resume.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.common.SearchVO;

public interface ResumeService {
	public int insertResume(ResumeVO vo);
	public ResumeVO selectResume(int memNo);
	public int updateResume(ResumeAllVO resumeAllVo);
	public List<ResumeVO> selectResumeAll(int memNo);
	public int insertResumeFile(ResumeVO rVo);
	public int deleteResume(ResumeVO rVo);
	public ResumeVO selectResumeOne(ResumeVO rVo);
	public ResumeAllVO selectResumeDetail(ResumeVO rVo);
	public ResumeVO selectResumeOnebyResumeNo(int resumeNo);
	public List<Map<String, Object>> selectResumeAllbyAdmin(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	
	
	/* 현빈 */
	public ResumeAllVO selectResumeByResumeNo(int resumeNo);
	
}
