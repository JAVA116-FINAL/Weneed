package com.it.wanted.notice.model;

import java.sql.Timestamp;

public class QnaReplyVO {
	private int qna_no;
	private int admin_no;
	private String qna_email;
	private String qna_r_title;
	private String qna_r_content;
	private String qna_r_image;
	private Timestamp qna_r_regdate;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	public String getQna_email() {
		return qna_email;
	}
	public void setQna_email(String qna_email) {
		this.qna_email = qna_email;
	}
	public String getQna_r_title() {
		return qna_r_title;
	}
	public void setQna_r_title(String qna_r_title) {
		this.qna_r_title = qna_r_title;
	}
	public String getQna_r_content() {
		return qna_r_content;
	}
	public void setQna_r_content(String qna_r_content) {
		this.qna_r_content = qna_r_content;
	}
	public String getQna_r_image() {
		return qna_r_image;
	}
	public void setQna_r_image(String qna_r_image) {
		this.qna_r_image = qna_r_image;
	}
	public Timestamp getQna_r_regdate() {
		return qna_r_regdate;
	}
	public void setQna_r_regdate(Timestamp qna_r_regdate) {
		this.qna_r_regdate = qna_r_regdate;
	}
	
	@Override
	public String toString() {
		return "QnaReplyVO [qna_no=" + qna_no + ", admin_no=" + admin_no + ", qna_email=" + qna_email + ", qna_r_title="
				+ qna_r_title + ", qna_r_content=" + qna_r_content + ", qna_r_image=" + qna_r_image + ", qna_r_regdate="
				+ qna_r_regdate + "]";
	}
}
