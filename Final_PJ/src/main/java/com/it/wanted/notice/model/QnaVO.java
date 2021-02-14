package com.it.wanted.notice.model;

import java.sql.Timestamp;

public class QnaVO {
	private int qna_no;
	private String qna_email;
	private String qna_phone;
	private String qna_title;
	private String qna_content;
	private String qna_reply;
	private String qna_filename;
	private String qna_origin_filename;
	private long qna_filesize;
	private Timestamp qna_regdate;
	
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_email() {
		return qna_email;
	}
	public void setQna_email(String qna_email) {
		this.qna_email = qna_email;
	}
	public String getQna_phone() {
		return qna_phone;
	}
	public void setQna_phone(String qna_phone) {
		this.qna_phone = qna_phone;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	public String getQna_filename() {
		return qna_filename;
	}
	public void setQna_filename(String qna_filename) {
		this.qna_filename = qna_filename;
	}
	public String getQna_origin_filename() {
		return qna_origin_filename;
	}
	public void setQna_origin_filename(String qna_origin_filename) {
		this.qna_origin_filename = qna_origin_filename;
	}
	public long getQna_filesize() {
		return qna_filesize;
	}
	public void setQna_filesize(long qna_filesize) {
		this.qna_filesize = qna_filesize;
	}
	public Timestamp getQna_regdate() {
		return qna_regdate;
	}
	public void setQna_regdate(Timestamp qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	
	@Override
	public String toString() {
		return "QnaVO [qna_no=" + qna_no + ", qna_email=" + qna_email + ", qna_phone=" + qna_phone + ", qna_title="
				+ qna_title + ", qna_content=" + qna_content + ", qna_reply=" + qna_reply + ", qna_filename="
				+ qna_filename + ", qna_origin_filename=" + qna_origin_filename + ", qna_filesize=" + qna_filesize
				+ ", qna_regdate=" + qna_regdate + "]";
	}
	
}
