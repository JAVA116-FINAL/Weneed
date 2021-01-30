package com.it.wanted.languages.model;

public class LanguagesVO {
	private int langNo;//LANG_NO NUMBER PRIMARY KEY, /* 외국어 번호 */
	private int resumeNo;//RESUME_NO NUMBER REFERENCES RESUME(RESUME_NO)ON DELETE CASCADE, /* 이력서 번호 */
	private String langName;//LANG_NAME VARCHAR2(255) NULL, /* 외국어명 */
	private int langLevel;//LANG_LEVEL NUMBER NULL /* 수준  1=‘유창함’, 2=‘비즈니스수준’ 3=‘일상회화’*/
	
	public int getLangNo() {
		return langNo;
	}
	public void setLangNo(int langNo) {
		this.langNo = langNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getLangName() {
		return langName;
	}
	public void setLangName(String langName) {
		this.langName = langName;
	}
	public int getLangLevel() {
		return langLevel;
	}
	public void setLangLevel(int langLevel) {
		this.langLevel = langLevel;
	}
	
	@Override
	public String toString() {
		return "LanguagesVO [langNo=" + langNo + ", resumeNo=" + resumeNo + ", langName=" + langName + ", langLevel="
				+ langLevel + "]";
	}
	
	
}
