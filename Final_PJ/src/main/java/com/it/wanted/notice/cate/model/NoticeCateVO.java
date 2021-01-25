package com.it.wanted.notice.cate.model;

public class NoticeCateVO {
	private int notice_dept1;
	private String notice_dept1_info;
	private int notice_dept2;
	private String notice_dept2_info;
	public int getNotice_dept1() {
		return notice_dept1;
	}
	public void setNotice_dept1(int notice_dept1) {
		this.notice_dept1 = notice_dept1;
	}
	public String getNotice_dept1_info() {
		return notice_dept1_info;
	}
	public void setNotice_dept1_info(String notice_dept1_info) {
		this.notice_dept1_info = notice_dept1_info;
	}
	public int getNotice_dept2() {
		return notice_dept2;
	}
	public void setNotice_dept2(int notice_dept2) {
		this.notice_dept2 = notice_dept2;
	}
	public String getNotice_dept2_info() {
		return notice_dept2_info;
	}
	public void setNotice_dept2_info(String notice_dept2_info) {
		this.notice_dept2_info = notice_dept2_info;
	}
	
	@Override
	public String toString() {
		return "NoticeCateVO [notice_dept1=" + notice_dept1 + ", notice_dept1_info=" + notice_dept1_info
				+ ", notice_dept2=" + notice_dept2 + ", notice_dept2_info=" + notice_dept2_info + "]";
	}
	
}
