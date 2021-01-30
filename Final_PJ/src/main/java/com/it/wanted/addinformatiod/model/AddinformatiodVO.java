package com.it.wanted.addinformatiod.model;

public class AddinformatiodVO {
	private int addNo;//ADD_NO NUMBER PRIMARY KEY, /* 활동번호 */
	private int resumeNo;//RESUME_NO NUMBER REFERENCES RESUME(RESUME_NO)ON DELETE CASCADE, /* 이력서 번호 */
	private String addName;//ADD_NAME VARCHAR2(255) NULL, /* 활동명 */
	private String getYear;//GET_YEAR VARCHAR2(255)  NULL, /* 활동년도 */
	private String getMonth;//GET_MONTH VARCHAR2(255) NULL, /* 활동월 */
	private String addDetails;//ADD_DETAILS CLOB /* 활동 세부 내용 */
	
	public int getAddNo() {
		return addNo;
	}
	public void setAddNo(int addNo) {
		this.addNo = addNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getAddName() {
		return addName;
	}
	public void setAddName(String addName) {
		this.addName = addName;
	}
	public String getGetYear() {
		return getYear;
	}
	public void setGetYear(String getYear) {
		this.getYear = getYear;
	}
	public String getGetMonth() {
		return getMonth;
	}
	public void setGetMonth(String getMonth) {
		this.getMonth = getMonth;
	}
	public String getAddDetails() {
		return addDetails;
	}
	public void setAddDetails(String addDetails) {
		this.addDetails = addDetails;
	}
	
	@Override
	public String toString() {
		return "AddinformatiodVO [addNo=" + addNo + ", resumeNo=" + resumeNo + ", addName=" + addName + ", getYear="
				+ getYear + ", getMonth=" + getMonth + ", addDetails=" + addDetails + "]";
	}
	
}
