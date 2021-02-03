package com.it.wanted.languages.model;

import java.util.List;

public interface LanguagesDAO {
	public int insertLang(LanguagesVO lVo);
	public LanguagesVO selectLang(int resumeNo);
	public int deleteLang(int langNo);
	public int updateLang(LanguagesVO lVo);
	public List<LanguagesVO> selectLangbyResumeNo(int resumeNo);
	
}
