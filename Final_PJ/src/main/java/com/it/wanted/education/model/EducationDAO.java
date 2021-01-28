package com.it.wanted.education.model;

public interface EducationDAO {
	public int insertEdu(EducationVO educationVo);
	public EducationVO selectEdu(int resumeNo);
}
