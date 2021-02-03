package com.it.wanted.education.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EducationServiceImpl implements EducationService{
	@Autowired
	private EducationDAO educationDao;

	@Override
	public int insertEdu(EducationVO educationVo) {
		return educationDao.insertEdu(educationVo);
	}

	@Override
	public EducationVO selectEdu(int resumeNo) {
		return educationDao.selectEdu(resumeNo);
	}

	@Override
	public int deleteEdu(int eduNo) {
		return educationDao.deleteEdu(eduNo);
	}
		

	
	
}
