package com.it.wanted.main.search.model;

public class MainSearchVO {
	private String comCode;
	private String nation;
	private String region;
	private String comName;
	private String industry;
	private String comImgUrl;
	private String posName;
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getComImgUrl() {
		return comImgUrl;
	}
	public void setComImgUrl(String comImgUrl) {
		this.comImgUrl = comImgUrl;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	@Override
	public String toString() {
		return "MainSearchVO [comCode=" + comCode + ", nation=" + nation + ", region=" + region + ", comName=" + comName
				+ ", industry=" + industry + ", comImgUrl=" + comImgUrl + ", posName=" + posName + "]";
	}
	
	
	
	
	
}
