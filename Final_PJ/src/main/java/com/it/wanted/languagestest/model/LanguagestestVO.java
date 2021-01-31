package com.it.wanted.languagestest.model;

public class LanguagestestVO {
	private int langtestNo;//LANGTEST_NO NUMBER PRIMARY KEY, /* 어학시험번호 */
	private int langNo;//LANG_NO NUMBER REFERENCES LANGUAGES(LANG_NO)ON DELETE CASCADE, /* 외국어 번호 */
	private String langtestName;//LANGTEST_NAME VARCHAR2(255) NULL, /* 시험명 */
	private String langtestScore;//LANGTEST_SCORE VARCHAR2(50) NULL, /* 점수/급 */
	private String getYear;//GET_YEAR VARCHAR2(255)  NULL, /* 취득년도 */
	private String getMonth;//GET_MONTH VARCHAR2(255) NULL /* 취득월 */
	public int getLangtestNo() {
		return langtestNo;
	}
	public void setLangtestNo(int langtestNo) {
		this.langtestNo = langtestNo;
	}
	public int getLangNo() {
		return langNo;
	}
	public void setLangNo(int langNo) {
		this.langNo = langNo;
	}
	public String getLangtestName() {
		return langtestName;
	}
	public void setLangtestName(String langtestName) {
		this.langtestName = langtestName;
	}
	public String getLangtestScore() {
		return langtestScore;
	}
	public void setLangtestScore(String langtestScore) {
		this.langtestScore = langtestScore;
	}
	public String getGetYear() {
		return getYear;
	}
	public void setGetYear(String getYear) {
		this.getYear = getYear;
	}
	public String getGetMonth() {
		return getMonth;
	}
	public void setGetMonth(String getMonth) {
		this.getMonth = getMonth;
	}
	@Override
	public String toString() {
		return "LanguagesTestVO [langtestNo=" + langtestNo + ", langNo=" + langNo + ", langtestName=" + langtestName
				+ ", langtestScore=" + langtestScore + ", getYear=" + getYear + ", getMonth=" + getMonth + "]";
	}
	
	
}
