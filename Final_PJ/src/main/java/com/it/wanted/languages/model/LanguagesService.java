package com.it.wanted.languages.model;

public interface LanguagesService {
	public int insertLang(LanguagesVO lVo);
	public LanguagesVO selectLang(int resumeNo);
	public int deleteLang(int langNo);
}
