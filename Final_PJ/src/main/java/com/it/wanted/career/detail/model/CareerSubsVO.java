package com.it.wanted.career.detail.model;

import java.security.Timestamp;

public class CareerSubsVO {
	private int subNo;
	private int payNo;	
	private String subEmail;
	private String subName;
	private String subPhone;
	private String subType;
	private Timestamp subStartDate;
	private Timestamp subEndDate;
	
	
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	public int getPayNo() {
		return payNo;
	}
	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public String getSubPhone() {
		return subPhone;
	}
	public void setSubPhone(String subPhone) {
		this.subPhone = subPhone;
	}
	public String getSubEmail() {
		return subEmail;
	}
	public void setSubEmail(String subEmail) {
		this.subEmail = subEmail;
	}
	public String getSubType() {
		return subType;
	}
	public void setSubType(String subType) {
		this.subType = subType;
	}
	public Timestamp getSubStartDate() {
		return subStartDate;
	}
	public void setSubStartDate(Timestamp subStartDate) {
		this.subStartDate = subStartDate;
	}
	public Timestamp getSubEndDate() {
		return subEndDate;
	}
	public void setSubEndDate(Timestamp subEndDate) {
		this.subEndDate = subEndDate;
	}
	@Override
	public String toString() {
		return "CareerSubsVO [subNo=" + subNo + ", payNo=" + payNo + ", subEmail=" + subEmail + ", subName=" + subName
				+ ", subPhone=" + subPhone + ", subType=" + subType + ", subStartDate=" + subStartDate + ", subEndDate="
				+ subEndDate + "]";
	}
	


}
