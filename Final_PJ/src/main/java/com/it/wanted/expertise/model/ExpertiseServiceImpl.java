package com.it.wanted.expertise.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ExpertiseServiceImpl implements ExpertiseService{

	@Autowired ExpertiseDAO expertDao;

	public ExpertiseVO selectExpertise(int expertiseNo) {
		return expertDao.selectExpertise(expertiseNo);
	}
	
}
