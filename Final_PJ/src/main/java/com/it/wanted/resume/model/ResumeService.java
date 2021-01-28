package com.it.wanted.resume.model;

public interface ResumeService {
	public int insertResume(ResumeVO vo);
	public ResumeVO selectResume(int memNo);
	//public int updateResume(ResumeVO vo);
	public int updateResume(ResumeAllVO resumeAllVo);
}
