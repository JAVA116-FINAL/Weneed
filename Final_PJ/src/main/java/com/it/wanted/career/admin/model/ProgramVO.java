package com.it.wanted.career.admin.model;

import java.sql.Timestamp;
import java.util.List;

public class ProgramVO {
	private int programNo; 		/* 프로그램 번호 */
	private int adminNo; 		/* ★관리자 번호 FK */
	private List<String> proCateNo; 		/* 카테고리 번호 */
	private String proName; 	/* 프로그램 이름 */
	private String proSponsor; 	/* 주최자 */
	private int proPrice; 		/* 가격 */
	private Timestamp proStartDate; /* 프로그램 시작일 */
	private Timestamp regdate; 	/* 등록일 */
	private int proType; 	/* 프로그램 타입 */
	private String imageUrl; 	/* 썸네일 이미지 url */
	private Timestamp regiEndDate; /* 신청마감일 */
	
	
	public int getProgramNo() {
		return programNo;
	}
	
	public void setProgramNo(int programNo) {
		this.programNo = programNo;
	}
	
	public int getAdminNo() {
		return adminNo;
	}
	
	public void setAdminNo(int adminNo) {
		this.adminNo = adminNo;
	}
	
	public List<String> getProCateNo() {
		return proCateNo;
	}
	
	public void setProCateNo(List<String> valueArr) {
		this.proCateNo = valueArr;
	}
	
	public String getProName() {
		return proName;
	}
	
	public void setProName(String proName) {
		this.proName = proName;
	}
	
	public String getProSponsor() {
		return proSponsor;
	}
	
	public void setProSponsor(String proSponsor) {
		this.proSponsor = proSponsor;
	}
	
	public int getProPrice() {
		return proPrice;
	}
	
	public void setProPrice(int proPrice) {
		this.proPrice = proPrice;
	}
	
	public Timestamp getProStartDate() {
		return proStartDate;
	}
	
	public void setProStartDate(Timestamp proStartDate) {
		this.proStartDate = proStartDate;
	}
	
	public Timestamp getRegdate() {
		return regdate;
	}
	
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	public int getProType() {
		return proType;
	}
	
	public void setProType(int proType) {
		this.proType = proType;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}
	
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
	public Timestamp getRegiEndDate() {
		return regiEndDate;
	}
	
	public void setRegiEndDate(Timestamp regiEndDate) {
		this.regiEndDate = regiEndDate;
	}

	@Override
	public String toString() {
		return "ProgramVO [programNo=" + programNo + ", adminNo=" + adminNo + ", proCateNo=" + proCateNo + ", proName="
				+ proName + ", proSponsor=" + proSponsor + ", proPrice=" + proPrice + ", proStartDate=" + proStartDate
				+ ", regdate=" + regdate + ", proType=" + proType + ", imageUrl=" + imageUrl + ", regiEndDate="
				+ regiEndDate + "]";
	}


	
}
