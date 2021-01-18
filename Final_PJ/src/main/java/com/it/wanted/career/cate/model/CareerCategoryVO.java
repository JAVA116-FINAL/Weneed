package com.it.wanted.career.cate.model;

public class CareerCategoryVO {
	private int proCateNo;
	private String proCateName;
	
	public int getProCateNo() {
		return proCateNo;
	}
	public void setProCateNo(int proCateNo) {
		this.proCateNo = proCateNo;
	}
	public String getProCateName() {
		return proCateName;
	}
	public void setProCateName(String proCateName) {
		this.proCateName = proCateName;
	}
	@Override
	public String toString() {
		return "CareerCategoryVO [proCateNo=" + proCateNo + ", proCateName=" + proCateName + "]";
	}
	
	
}
