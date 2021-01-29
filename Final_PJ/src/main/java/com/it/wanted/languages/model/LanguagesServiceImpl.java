package com.it.wanted.languages.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.wanted.languagestest.model.LanguagestestDAO;

@Service
public class LanguagesServiceImpl implements LanguagesService{
	@Autowired
	private LanguagesDAO languagesDao;
	private LanguagestestDAO languagestestDao;

	@Override
	public int insertLang(LanguagesVO lVo) {
		return languagesDao.insertLang(lVo);
	}

	@Override
	public LanguagesVO selectLang(int resumeNo) {
		return languagesDao.selectLang(resumeNo);
	}
	
	@Override
	@Transactional
	public int deleteLang(int langNo) {
		int cnt=0;
		//1
		//cnt=languagestestDao.deleteLangtestbylangNo(langNo); 온딜리트캐스케이드라 알아서 지워짐
		//2
		cnt=languagesDao.deleteLang(langNo);
		return cnt;
	}
	
	
}
