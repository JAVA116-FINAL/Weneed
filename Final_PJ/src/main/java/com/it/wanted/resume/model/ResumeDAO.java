package com.it.wanted.resume.model;

public interface ResumeDAO {
	
	public int insertResume(ResumeVO vo);
	public ResumeVO selectResume(int memNo);
	public int updateResume(ResumeVO vo);
	
}
