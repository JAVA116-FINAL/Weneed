package com.it.wanted.career.model;

public class CareerVO {
	
	private int careerNo;	// NUMBER PRIMARY KEY, /* 경력번호 */
	private int resumeNo;	// NUMBER REFERENCES RESUME(RESUME_NO)ON DELETE CASCADE, /* 이력서 번호 */
	private String startYear;// VARCHAR2(255)  NULL, /* 시작년도 */
	private String startMonth;// VARCHAR2(255) NULL, /* 시작월 */
	private String endYear; //VARCHAR2(255) NULL, /* 마감년도*/
	private String endMonth; //VARCHAR2(255) NULL, /* 마감월*/
	private String curEmployed;	// VARCHAR2(10) DEFAULT 'N', /* 현재 재직 중*/
	private String careerName;	// VARCHAR2(255) NOT NULL, /* 회사명 */
	private String careerDep;	// VARCHAR2(255) NOT NULL /* 부서명 */
	public int getCareerNo() {
		return careerNo;
	}
	public void setCareerNo(int careerNo) {
		this.careerNo = careerNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
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
	public String getCurEmployed() {
		return curEmployed;
	}
	public void setCurEmployed(String curEmployed) {
		this.curEmployed = curEmployed;
	}
	public String getCareerName() {
		return careerName;
	}
	public void setCareerName(String careerName) {
		this.careerName = careerName;
	}
	public String getCareerDep() {
		return careerDep;
	}
	public void setCareerDep(String careerDep) {
		this.careerDep = careerDep;
	}
	@Override
	public String toString() {
		return "CareerVO [careerNo=" + careerNo + ", resumeNo=" + resumeNo + ", startYear=" + startYear
				+ ", startMonth=" + startMonth + ", endYear=" + endYear + ", endMonth=" + endMonth + ", curEmployed="
				+ curEmployed + ", careerName=" + careerName + ", careerDep=" + careerDep + "]";
	}
	
	
}
