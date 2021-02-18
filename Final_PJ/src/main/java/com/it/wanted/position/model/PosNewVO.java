package com.it.wanted.position.model;

public class PosNewVO {
	private int posNo;
	private String comName;
	private String nation;
	private String region;
	private String posName;
	private String comImgUrl;
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
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
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public String getComImgUrl() {
		return comImgUrl;
	}
	public void setComImgUrl(String comImgUrl) {
		this.comImgUrl = comImgUrl;
	}
	@Override
	public String toString() {
		return "PosNewVO [posNo=" + posNo + ", comName=" + comName + ", nation=" + nation + ", region=" + region
				+ ", posName=" + posName + ", comImgUrl=" + comImgUrl + "]";
	}
	
	
}
