package com.it.wanted.languagestest.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LanguagestestServiceImpl implements LanguagestestService{
	@Autowired
	private LanguagestestDAO languagestestDao;

	@Override
	public int insertLangtest(LanguagestestVO ltVo) {
		return languagestestDao.insertLangtest(ltVo);
	}

	@Override
	public LanguagestestVO selectLangtest(int langNo) {
		return languagestestDao.selectLangtest(langNo);
	}

	@Override
	public int deleteLangtest(int langtestNo) {
		return languagestestDao.deleteLangtest(langtestNo);
	}
	
	

}
