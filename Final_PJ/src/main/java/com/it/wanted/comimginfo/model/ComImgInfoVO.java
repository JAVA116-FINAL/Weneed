package com.it.wanted.comimginfo.model;

public class ComImgInfoVO {
	private int comImgNo;
	private String comCode;
	private String comImgUrl;
	private String comImgPassed; // N 또는 Y 
	
	public int getComImgNo() {
		return comImgNo;
	}
	public void setComImgNo(int comImgNo) {
		this.comImgNo = comImgNo;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public String getComImgUrl() {
		return comImgUrl;
	}
	public void setComImgUrl(String comImgUrl) {
		this.comImgUrl = comImgUrl;
	}
	public String getComImgPassed() {
		return comImgPassed;
	}
	public void setComImgPassed(String comImgPassed) {
		this.comImgPassed = comImgPassed;
	}
	@Override
	public String toString() {
		return "ComImgInfoVO [comImgNo=" + comImgNo + ", comCode=" + comCode + ", comImgUrl=" + comImgUrl
				+ ", comImgPassed=" + comImgPassed + "]";
	}
}
