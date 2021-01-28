package com.it.wanted.achievement.model;

public class AchievementVO {
	private int achNo;		// NUMBER PRIMARY KEY , /* 성과번호 */
	private int careerNo; 	//NUMBER REFERENCES CAREER(CAREER_NO)ON DELETE CASCADE, /* 경력번호 */
	private String achName; 	//VARCHAR2(255) NOT NULL, /* 주요성과 */
	private String startYear;// VARCHAR2(255)  NULL, /* 시작년도 */
	private String startMonth;// VARCHAR2(255) NULL, /* 시작월 */
	private String endYear; //VARCHAR2(255) NULL, /* 마감년도*/
	private String endMonth; //VARCHAR2(255) NULL, /* 마감월*/
	private String achDetails; //CLOB /* 성과 및 상세 업무 내용 */
	public int getAchNo() {
		return achNo;
	}
	public void setAchNo(int achNo) {
		this.achNo = achNo;
	}
	public int getCareerNo() {
		return careerNo;
	}
	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
	}
	public String getAchName() {
		return achName;
	}
	public void setAchName(String achName) {
		this.achName = achName;
	}
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public String getStartMonth() {
		return startMonth;
	}
	public void setStartMonth(String startMonth) {
		this.startMonth = startMonth;
	}
	public String getEndYear() {
		return endYear;
	}
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	public String getEndMonth() {
		return endMonth;
	}
	public void setEndMonth(String endMonth) {
		this.endMonth = endMonth;
	}
	public String getAchDetails() {
		return achDetails;
	}
	public void setAchDetails(String achDetails) {
		this.achDetails = achDetails;
	}
	@Override
	public String toString() {
		return "AchievementVO [achNo=" + achNo + ", careerNo=" + careerNo + ", achName=" + achName + ", startYear="
				+ startYear + ", startMonth=" + startMonth + ", endYear=" + endYear + ", endMonth=" + endMonth
				+ ", achDetails=" + achDetails + "]";
	}
	

}
