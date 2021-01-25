package com.it.wanted.cominfo.model;

import java.sql.Timestamp;

public class ComInfoVO {
	private String comCode;
	private String nation;
	private String region;
	private String comName;
	private String comAddress;
	private String comRegNo;
	private String industry;
	private String profit;
	private String comSize;
	private String comIntro;
	private String comYear;
	private String comEmails;
	private String comPhone;
	private String comWebsite;
	private String comKeywords;
	private String comRecom;
	private String comMemAgree;
	private Timestamp comRegdate;
	private String comInfoPassed;
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
	public String getComAddress() {
		return comAddress;
	}
	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}
	public String getComRegNo() {
		return comRegNo;
	}
	public void setComRegNo(String comRegNo) {
		this.comRegNo = comRegNo;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getProfit() {
		return profit;
	}
	public void setProfit(String profit) {
		this.profit = profit;
	}
	public String getComSize() {
		return comSize;
	}
	public void setComSize(String comSize) {
		this.comSize = comSize;
	}
	public String getComIntro() {
		return comIntro;
	}
	public void setComIntro(String comIntro) {
		this.comIntro = comIntro;
	}
	public String getComYear() {
		return comYear;
	}
	public void setComYear(String comYear) {
		this.comYear = comYear;
	}
	public String getComEmails() {
		return comEmails;
	}
	public void setComEmails(String comEmails) {
		this.comEmails = comEmails;
	}
	public String getComPhone() {
		return comPhone;
	}
	public void setComPhone(String comPhone) {
		this.comPhone = comPhone;
	}
	public String getComWebsite() {
		return comWebsite;
	}
	public void setComWebsite(String comWebsite) {
		this.comWebsite = comWebsite;
	}
	public String getComKeywords() {
		return comKeywords;
	}
	public void setComKeywords(String comKeywords) {
		this.comKeywords = comKeywords;
	}
	public String getComRecom() {
		return comRecom;
	}
	public void setComRecom(String comRecom) {
		this.comRecom = comRecom;
	}
	public String getComMemAgree() {
		return comMemAgree;
	}
	public void setComMemAgree(String comMemAgree) {
		this.comMemAgree = comMemAgree;
	}
	public Timestamp getComRegdate() {
		return comRegdate;
	}
	public void setComRegdate(Timestamp comRegdate) {
		this.comRegdate = comRegdate;
	}
	public String getComInfoPassed() {
		return comInfoPassed;
	}
	public void setComInfoPassed(String comInfoPassed) {
		this.comInfoPassed = comInfoPassed;
	}
	@Override
	public String toString() {
		return "ComInfoVO [comCode=" + comCode + ", nation=" + nation + ", region=" + region + ", comName=" + comName
				+ ", comAddress=" + comAddress + ", comRegNo=" + comRegNo + ", industry=" + industry + ", profit="
				+ profit + ", comSize=" + comSize + ", comIntro=" + comIntro + ", comYear=" + comYear + ", comEmails="
				+ comEmails + ", comPhone=" + comPhone + ", comWebsite=" + comWebsite + ", comKeywords=" + comKeywords
				+ ", comRecom=" + comRecom + ", comMemAgree=" + comMemAgree + ", comRegdate=" + comRegdate
				+ ", comInfoPassed=" + comInfoPassed + "]";
	}
	
}
