package com.it.wanted.resume.model;

import java.sql.Timestamp;

public class ResumeVO {

		private int resumeNo; // NUMBER PRIMARY KEY, /* 이력서 번호 */
		private int memNo; //NUMBER REFERENCES MEMBERINFO(MEM_NO) ON DELETE CASCADE, /* 회원번호 */
		private String resumeTitle; //VARCHAR2(255) NOT NULL, /* 이력서 제목 */
		private String resumeName; //VARCHAR2(50) NOT NULL, /* 이름 */
		private String resumeEmail; //VARCHAR2(255) NOT NULL, /* 메일 */
		private String resumeHp; //VARCHAR2(255) NOT NULL, /* 연락처 */
		private String resumeIntroduce; //CLOB, /* 소개글 */
		private String tempFlag; //VARCHAR2(10) DEFAULT 'N', /* 임시저장 */
		private String resumeFile; //VARCHAR2(255), /* 파일명 */
		private String resumeUpfileflag; //VARCHAR2(10) DEFAULT 'N', /* 첨부파일 여부 */
		private Timestamp resumeRegdate; //DATE DEFAULT SYSDATE /* 이력서 등록일 */
		private String langFlag; //VARCHAR2(10) DEFAULT 'KR' /* 언어 한국어:KR, 영어:EN 중국어:CH 일본어:JP   */
		private int resumeLength;
		
		public int getResumeNo() {
			return resumeNo;
		}
		public void setResumeNo(int resumeNo) {
			this.resumeNo = resumeNo;
		}
		public int getMemNo() {
			return memNo;
		}
		public void setMemNo(int memNo) {
			this.memNo = memNo;
		}
		public String getResumeTitle() {
			return resumeTitle;
		}
		public void setResumeTitle(String resumeTitle) {
			this.resumeTitle = resumeTitle;
		}
		public String getResumeName() {
			return resumeName;
		}
		public void setResumeName(String resumeName) {
			this.resumeName = resumeName;
		}
		public String getResumeEmail() {
			return resumeEmail;
		}
		public void setResumeEmail(String resumeEmail) {
			this.resumeEmail = resumeEmail;
		}
		public String getResumeHp() {
			return resumeHp;
		}
		public void setResumeHp(String resumeHp) {
			this.resumeHp = resumeHp;
		}
		public String getResumeIntroduce() {
			return resumeIntroduce;
		}
		public void setResumeIntroduce(String resumeIntroduce) {
			this.resumeIntroduce = resumeIntroduce;
		}
		public String getTempFlag() {
			return tempFlag;
		}
		public void setTempFlag(String tempFlag) {
			this.tempFlag = tempFlag;
		}
		public String getResumeFile() {
			return resumeFile;
		}
		public void setResumeFile(String resumeFile) {
			this.resumeFile = resumeFile;
		}
		public String getResumeUpfileflag() {
			return resumeUpfileflag;
		}
		public void setResumeUpfileflag(String resumeUpfileflag) {
			this.resumeUpfileflag = resumeUpfileflag;
		}
		public Timestamp getResumeRegdate() {
			return resumeRegdate;
		}
		public void setResumeRegdate(Timestamp resumeRegdate) {
			this.resumeRegdate = resumeRegdate;
		}
		
		public String getLangFlag() {
			return langFlag;
		}
		public void setLangFlag(String langFlag) {
			this.langFlag = langFlag;
		}
		
		
		public int getResumeLength() {
			return resumeLength;
		}
		public void setResumeLength(int resumeLength) {
			this.resumeLength = resumeLength;
		}
		@Override
		public String toString() {
			return "ResumeVO [resumeNo=" + resumeNo + ", memNo=" + memNo + ", resumeTitle=" + resumeTitle
					+ ", resumeName=" + resumeName + ", resumeEmail=" + resumeEmail + ", resumeHp=" + resumeHp
					+ ", resumeIntroduce=" + resumeIntroduce + ", tempFlag=" + tempFlag + ", resumeFile=" + resumeFile
					+ ", resumeUpfileflag=" + resumeUpfileflag + ", resumeRegdate=" + resumeRegdate + ", langFlag="
					+ langFlag + ", resumeLength=" + resumeLength + "]";
		}
		
		
}
