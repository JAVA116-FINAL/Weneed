package com.it.wanted.education.model;

public class EducationVO {
	private int eduNo;//EDU_NO NUMBER PRIMARY KEY, /* 학력번호 */
	private int resumeNo;//RESUME_NO NUMBER REFERENCES RESUME(RESUME_NO)ON DELETE CASCADE, /* 이력서 번호 */
	private String startYear;//START_YEAR VARCHAR2(255)  NULL, /* 시작년도 */
	private String startMonth;//START_MONTH VARCHAR2(255) NULL, /* 시작월 */
	private String endYear;//END_YEAR VARCHAR2(255) NULL, /* 마감년도*/
	private String endMonth;//END_MONTH VARCHAR2(255) NULL, /* 마감월*/
	private String curEnrolled;//CUR_ENROLLED VARCHAR2(10) DEFAULT 'N', /* 현재 재학중 */
	private String eduName;//EDU_NAME VARCHAR2(255) NULL, /* 학교명 */
	private String eduMajor;//EDU_MAJOR VARCHAR2(255), /* 전공 및 학위 */
	private String eduDetails;//EDU_DETAILS CLOB /* 이수과목/연구내용 */
	public int getEduNo() {
		return eduNo;
	}
	public void setEduNo(int eduNo) {
		this.eduNo = eduNo;
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
	public String getCurEnrolled() {
		return curEnrolled;
	}
	public void setCurEnrolled(String curEnrolled) {
		this.curEnrolled = curEnrolled;
	}
	public String getEduName() {
		return eduName;
	}
	public void setEduName(String eduName) {
		this.eduName = eduName;
	}
	public String getEduMajor() {
		return eduMajor;
	}
	public void setEduMajor(String eduMajor) {
		this.eduMajor = eduMajor;
	}
	public String getEduDetails() {
		return eduDetails;
	}
	public void setEduDetails(String eduDetails) {
		this.eduDetails = eduDetails;
	}
	
	@Override
	public String toString() {
		return "EducationVO [eduNo=" + eduNo + ", resumeNo=" + resumeNo + ", startYear=" + startYear + ", startMonth="
				+ startMonth + ", endYear=" + endYear + ", endMonth=" + endMonth + ", curEnrolled=" + curEnrolled
				+ ", eduName=" + eduName + ", eduMajor=" + eduMajor + ", eduDetails=" + eduDetails + "]";
	}
	
}
