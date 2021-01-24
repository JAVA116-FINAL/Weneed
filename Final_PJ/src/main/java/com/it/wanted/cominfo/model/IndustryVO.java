package com.it.wanted.cominfo.model;

public class IndustryVO {
	private int industryNo;
	private String industryName;
	public int getIndustryNo() {
		return industryNo;
	}
	public void setIndustryNo(int industryNo) {
		this.industryNo = industryNo;
	}
	public String getIndustryName() {
		return industryName;
	}
	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}
	@Override
	public String toString() {
		return "IndustryVO [industryNo=" + industryNo + ", industryName=" + industryName + "]";
	}
	
	
}
