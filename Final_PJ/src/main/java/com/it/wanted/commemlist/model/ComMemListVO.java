package com.it.wanted.commemlist.model;

public class ComMemListVO {
	private int comMemNo;
	private String comCode;
	
	public int getComMemNo() {
		return comMemNo;
	}
	public void setComMemNo(int comMemNo) {
		this.comMemNo = comMemNo;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	
	@Override
	public String toString() {
		return "ComMemListVO [comMemNo=" + comMemNo + ", comCode=" + comCode + "]";
	}
	
}
