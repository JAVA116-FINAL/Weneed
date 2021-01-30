package com.it.wanted.addinformatiod.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AddinformatiodServiceImpl implements AddinformatiodService{
	@Autowired
	private AddinformatiodDAO addinformatiodDao;

	@Override
	public int insertAdd(AddinformatiodVO aVo) {
		return addinformatiodDao.insertAdd(aVo);
	}

	@Override
	public AddinformatiodVO selectAdd(int resumeNo) {
		return addinformatiodDao.selectAdd(resumeNo);
	}

	@Override
	public int deleteAdd(int addNo) {
		return addinformatiodDao.deleteAdd(addNo);
	}
	
	

}
