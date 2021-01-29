package com.it.wanted.languagestest.model;

public interface LanguagestestDAO {
	public int insertLangtest(LanguagestestVO ltVo);
	public LanguagestestVO selectLangtest(int langNo);
	public int deleteLangtest(int langtestNo);
	public int deleteLangtestbylangNo(int langNo) ;
	public int updateLangtest(LanguagestestVO langtestVo);
}
