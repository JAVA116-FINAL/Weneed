package com.it.wanted.languages.model;

public interface LanguagesDAO {
	public int insertLang(LanguagesVO lVo);
	public LanguagesVO selectLang(int resumeNo);
	public int deleteLang(int langNo);
	public int updateLang(LanguagesVO lVo);
	
}
