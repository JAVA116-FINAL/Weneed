package com.it.wanted.mybookmark.model;

public class MybookmarkVO {
	private int bookmarkNo;
	private int memNo;
	private int posNo;
	
	public int getBookmarkNo() {
		return bookmarkNo;
	}
	public void setBookmarkNo(int bookmarkNo) {
		this.bookmarkNo = bookmarkNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	@Override
	public String toString() {
		return "MybookmarkVO [bookmarkNo=" + bookmarkNo + ", memNo=" + memNo + ", posNo=" + posNo + "]";
	}
	
	
}
