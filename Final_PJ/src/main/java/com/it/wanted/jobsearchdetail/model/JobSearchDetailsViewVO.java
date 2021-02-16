package com.it.wanted.jobsearchdetail.model;

public class JobSearchDetailsViewVO {
	private String comImgUrl;
	private String posName;
	private int posNo;
	private String comCode;
	private String comName;
	private String region;
	private String nation;
	private String jikgunCode;
	
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
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getJikgunCode() {
		return jikgunCode;
	}
	public void setJikgunCode(String jikgunCode) {
		this.jikgunCode = jikgunCode;
	}
	@Override
	public String toString() {
		return "JobSearchDetailsViewVO [comImgUrl=" + comImgUrl + ", posName=" + posName + ", posNo=" + posNo
				+ ", comCode=" + comCode + ", comName=" + comName + ", region=" + region + ", nation=" + nation
				+ ", jikgunCode=" + jikgunCode + "]";
	}
	
	
	
}
