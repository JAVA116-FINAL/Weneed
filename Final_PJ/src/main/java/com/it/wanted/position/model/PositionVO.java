package com.it.wanted.position.model;

import java.security.Timestamp;

public class PositionVO {
	private int posNo;
	private String comCode;
	private String jikgunCode;
	private String comEmails;
	private String minYear;
	private String maxYear;
	private String posMinSal;
	private String posMaxSal;
	private String endDate;
	private String posName;
	private String posContext;
	private String posCareer;
	private String qualification;
	private String preferentialTreatment;
	private String welfareBenefits;
	private String overseas;
	private String nationNameKr;
	private String region;
	private String posStatus;
	private Timestamp posRegdate;
	/* 채용포지션 상태 1 임시저장, 2 승인요청, 3 승인됨, 4 종료 */
	
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
	public String getJikgunCode() {
		return jikgunCode;
	}
	public void setJikgunCode(String jikgunCode) {
		this.jikgunCode = jikgunCode;
	}
	public String getComEmails() {
		return comEmails;
	}
	public void setComEmails(String comEmails) {
		this.comEmails = comEmails;
	}
	public String getMinYear() {
		return minYear;
	}
	public void setMinYear(String minYear) {
		this.minYear = minYear;
	}
	public String getMaxYear() {
		return maxYear;
	}
	public void setMaxYear(String maxYear) {
		this.maxYear = maxYear;
	}
	public String getPosMinSal() {
		return posMinSal;
	}
	public void setPosMinSal(String posMinSal) {
		this.posMinSal = posMinSal;
	}
	public String getPosMaxSal() {
		return posMaxSal;
	}
	public void setPosMaxSal(String posMaxSal) {
		this.posMaxSal = posMaxSal;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getPosName() {
		return posName;
	}
	public void setPosName(String posName) {
		this.posName = posName;
	}
	public String getPosContext() {
		return posContext;
	}
	public void setPosContext(String posContext) {
		this.posContext = posContext;
	}
	public String getPosCareer() {
		return posCareer;
	}
	public void setPosCareer(String posCareer) {
		this.posCareer = posCareer;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getPreferentialTreatment() {
		return preferentialTreatment;
	}
	public void setPreferentialTreatment(String preferentialTreatment) {
		this.preferentialTreatment = preferentialTreatment;
	}
	public String getWelfareBenefits() {
		return welfareBenefits;
	}
	public void setWelfareBenefits(String welfareBenefits) {
		this.welfareBenefits = welfareBenefits;
	}
	public String getOverseas() {
		return overseas;
	}
	public void setOverseas(String overseas) {
		this.overseas = overseas;
	}
	public String getNationNameKr() {
		return nationNameKr;
	}
	public void setNationNameKr(String nationNameKr) {
		this.nationNameKr = nationNameKr;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getPosStatus() {
		return posStatus;
	}
	public void setPosStatus(String posStatus) {
		this.posStatus = posStatus;
	}
	public Timestamp getPosRegdate() {
		return posRegdate;
	}
	public void setPosRegdate(Timestamp posRegdate) {
		this.posRegdate = posRegdate;
	}
	
	@Override
	public String toString() {
		return "PositionVO [posNo=" + posNo + ", comCode=" + comCode + ", jikgunCode=" + jikgunCode + ", comEmails="
				+ comEmails + ", minYear=" + minYear + ", maxYear=" + maxYear + ", posMinSal=" + posMinSal
				+ ", posMaxSal=" + posMaxSal + ", endDate=" + endDate + ", posName=" + posName + ", posContext="
				+ posContext + ", posCareer=" + posCareer + ", qualification=" + qualification
				+ ", preferentialTreatment=" + preferentialTreatment + ", welfareBenefits=" + welfareBenefits
				+ ", overseas=" + overseas + ", nationNameKr=" + nationNameKr + ", region=" + region + ", posStatus=" + posStatus
				+ ", posRegdate=" + posRegdate + "]";
	}
	
}
