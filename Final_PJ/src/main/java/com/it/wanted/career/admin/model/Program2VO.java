package com.it.wanted.career.admin.model;

public class Program2VO {
	private int proConNo;  		/* 프로그램내용번호 */
	private int programNo;  	/* 프로그램 번호 */
	private String proTitle; 	/* 제목 */
	private String proContents; 		/* 내용 */
	
	
	public int getProConNo() {
		return proConNo;
	}
	
	public void setProConNo(int proConNo) {
		this.proConNo = proConNo;
	}
	
	public int getProgramNo() {
		return programNo;
	}
	
	public void setProgramNo(int programNo) {
		this.programNo = programNo;
	}
	
	public String getProTitle() {
		return proTitle;
	}
	
	public void setProTitle(String proTitle) {
		this.proTitle = proTitle;
	}
	
	public String getProContents() {
		return proContents;
	}
	
	public void setProContents(String proContents) {
		this.proContents = proContents;
	}
	
	@Override
	public String toString() {
		return "Program2VO [proConNo=" + proConNo + ", programNo=" + programNo + ", proTitle=" + proTitle
				+ ", proContents=" + proContents + "]";
	}
	
	
}
