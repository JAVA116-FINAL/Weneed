package com.it.wanted.cominfo.model;

public class RegionVO {
	private String regionCode;
	private String regionNameKr;
	private String regionNameEn;
	private String nationCode;
	public String getRegionCode() {
		return regionCode;
	}
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}
	public String getRegionNameKr() {
		return regionNameKr;
	}
	public void setRegionNameKr(String regionNameKr) {
		this.regionNameKr = regionNameKr;
	}
	public String getRegionNameEn() {
		return regionNameEn;
	}
	public void setRegionNameEn(String regionNameEn) {
		this.regionNameEn = regionNameEn;
	}
	public String getNationCode() {
		return nationCode;
	}
	public void setNationCode(String nationCode) {
		this.nationCode = nationCode;
	}
	@Override
	public String toString() {
		return "RegionVO [regionCode=" + regionCode + ", regionNameKr=" + regionNameKr + ", regionNameEn="
				+ regionNameEn + ", nationCode=" + nationCode + "]";
	}
	
}
