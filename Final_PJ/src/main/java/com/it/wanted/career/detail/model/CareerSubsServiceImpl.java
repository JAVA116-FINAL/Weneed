package com.it.wanted.career.detail.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareerSubsServiceImpl implements CareerSubsService{

	@Autowired
	private CareerSubsDAO subsDao;
	
	@Override
	public int insertSubs(CareerSubsVO subsVo) {
		return subsDao.insertSubs(subsVo);
	}

	
	
	
}
