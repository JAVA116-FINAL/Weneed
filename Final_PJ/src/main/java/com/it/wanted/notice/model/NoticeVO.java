package com.it.wanted.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int notice_no; /* 안내번호 */
	private int admin_no; /* ★관리자 번호 FK */
	private String notice_title; /* 글 제목 */
	private String notice_content; /* 글 내용 */
	private String notice_image; /* 이미지 */
	private int notice_dept1; /* 대분류 */
	private int notice_dept2; /* 소분류 */
	private String notice_dept1_info; /* 대분류 상세 */
	private String notice_dept2_info; /* 소분류 상세 */
	private Timestamp notice_regdate; /* 등록일 */
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getNotice_title() {
		return notice_title;
	}
	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public String getNotice_image() {
		return notice_image;
	}
	public void setNotice_image(String notice_image) {
		this.notice_image = notice_image;
	}
	public int getNotice_dept1() {
		return notice_dept1;
	}
	public void setNotice_dept1(int notice_dept1) {
		this.notice_dept1 = notice_dept1;
	}
	public int getNotice_dept2() {
		return notice_dept2;
	}
	public void setNotice_dept2(int notice_dept2) {
		this.notice_dept2 = notice_dept2;
	}
	public String getNotice_dept1_info() {
		return notice_dept1_info;
	}
	public void setNotice_dept1_info(String notice_dept1_info) {
		this.notice_dept1_info = notice_dept1_info;
	}
	public String getNotice_dept2_info() {
		return notice_dept2_info;
	}
	public void setNotice_dept2_info(String notice_dept2_info) {
		this.notice_dept2_info = notice_dept2_info;
	}
	public Timestamp getNotice_regdate() {
		return notice_regdate;
	}
	public void setNotice_regdate(Timestamp notice_regdate) {
		this.notice_regdate = notice_regdate;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [notice_no=" + notice_no + ", admin_no=" + admin_no + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_image=" + notice_image + ", notice_dept1="
				+ notice_dept1 + ", notice_dept2=" + notice_dept2 + ", notice_dept1_info=" + notice_dept1_info
				+ ", notice_dept2_info=" + notice_dept2_info + ", notice_regdate=" + notice_regdate + "]";
	}
	
	
}
