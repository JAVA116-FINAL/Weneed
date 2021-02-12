package com.it.wanted.resume.model;

import java.util.List;

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
	
}
