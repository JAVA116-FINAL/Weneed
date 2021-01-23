package com.it.wanted.cominfo.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComInfoServiceImpl implements ComInfoService {
	@Autowired ComInfoDAO comInfoDao;

	@Override
	public ComInfoVO selectCompany(int comMemNo) {
		return comInfoDao.selectCompany(comMemNo);
	}
	
}
