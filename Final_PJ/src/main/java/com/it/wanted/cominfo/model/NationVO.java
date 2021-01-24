package com.it.wanted.cominfo.model;

public class NationVO {
	private String nationCode;
	private String nationNameKr;
	private String nationNameEn;
	
	public String getNationCode() {
		return nationCode;
	}
	public void setNationCode(String nationCode) {
		this.nationCode = nationCode;
	}
	public String getNationNameKr() {
		return nationNameKr;
	}
	public void setNationNameKr(String nationNameKr) {
		this.nationNameKr = nationNameKr;
	}
	public String getNationNameEn() {
		return nationNameEn;
	}
	public void setNationNameEn(String nationNameEn) {
		this.nationNameEn = nationNameEn;
	}
	@Override
	public String toString() {
		return "NationVO [nationCode=" + nationCode + ", nationNameKr=" + nationNameKr + ", nationNameEn="
				+ nationNameEn + "]";
	}
	
}
