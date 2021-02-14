package com.it.wanted.education.model;


public interface EducationService {
	public int insertEdu(EducationVO educationVo);
	public EducationVO selectEdu(int resumeNo);
	public int deleteEdu(int eduNo);
	public EducationVO selectEduOne(int eduNo);

}

