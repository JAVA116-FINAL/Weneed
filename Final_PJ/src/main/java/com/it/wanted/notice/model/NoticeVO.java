package com.it.wanted.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int NOTICE_NO; /* 안내번호 */
	private int ADMIN_NO; /* ★관리자 번호 FK */
	private String NOTICE_TITLE; /* 글 제목 */
	private String NOTICE_CONTENT; /* 글 내용 */
	private String NOTICE_IMAGE; /* 이미지 */
	private int NOTICE_DEPT1; /* 대분류 */
	private int NOTICE_DEPT2; /* 소분류 */
	private Timestamp NOTICE_REGDATE; /* 등록일 */
	
	public int getNOTICE_NO() {
		return NOTICE_NO;
	}
	public void setNOTICE_NO(int nOTICE_NO) {
		NOTICE_NO = nOTICE_NO;
	}
	public int getADMIN_NO() {
		return ADMIN_NO;
	}
	public void setADMIN_NO(int aDMIN_NO) {
		ADMIN_NO = aDMIN_NO;
	}
	public String getNOTICE_TITLE() {
		return NOTICE_TITLE;
	}
	public void setNOTICE_TITLE(String nOTICE_TITLE) {
		NOTICE_TITLE = nOTICE_TITLE;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public String getNOTICE_IMAGE() {
		return NOTICE_IMAGE;
	}
	public void setNOTICE_IMAGE(String nOTICE_IMAGE) {
		NOTICE_IMAGE = nOTICE_IMAGE;
	}
	public int getNOTICE_DEPT1() {
		return NOTICE_DEPT1;
	}
	public void setNOTICE_DEPT1(int nOTICE_DEPT1) {
		NOTICE_DEPT1 = nOTICE_DEPT1;
	}
	public int getNOTICE_DEPT2() {
		return NOTICE_DEPT2;
	}
	public void setNOTICE_DEPT2(int nOTICE_DEPT2) {
		NOTICE_DEPT2 = nOTICE_DEPT2;
	}
	public Timestamp getNOTICE_REGDATE() {
		return NOTICE_REGDATE;
	}
	public void setNOTICE_REGDATE(Timestamp nOTICE_REGDATE) {
		NOTICE_REGDATE = nOTICE_REGDATE;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [NOTICE_NO=" + NOTICE_NO + ", ADMIN_NO=" + ADMIN_NO + ", NOTICE_TITLE=" + NOTICE_TITLE
				+ ", NOTICE_CONTENT=" + NOTICE_CONTENT + ", NOTICE_IMAGE=" + NOTICE_IMAGE + ", NOTICE_DEPT1="
				+ NOTICE_DEPT1 + ", NOTICE_DEPT2=" + NOTICE_DEPT2 + ", NOTICE_REGDATE=" + NOTICE_REGDATE + "]";
	}
	
}
