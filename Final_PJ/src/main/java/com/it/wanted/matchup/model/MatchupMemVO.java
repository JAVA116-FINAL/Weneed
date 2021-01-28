package com.it.wanted.matchup.model;

public class MatchupMemVO {
	private int mcumemNo;// NUMBER PRIMARY KEY, /* 매치업일반번호 */
	private int memNo; //NUMBER REFERENCES MEMBERINFO(MEM_NO) ON DELETE CASCADE, /* 회원번호 */
	private int resumeNo;// NUMBER REFERENCES RESUME(RESUME_NO) ON DELETE CASCADE, /* 이력서 번호 */
	private int expertiseNo;// NUMBER REFERENCES EXPERTISE(EXPERTISE_NO) ON DELETE CASCADE, /* 전문분야 번호 */
	private String jobsearchFlag; // VARCHAR2(10) DEFAULT 'N', /* 구직여부 */
	private String resumeopenFlag;// VARCHAR2(10) DEFAULT 'N', /* 이력서 공개여부 */
	private String refName;// VARCHAR2(255) /* ★추천인 FK */
	
	public int getMcumemNo() {
		return mcumemNo;
	}
	public void setMcumemNo(int mcumemNo) {
		this.mcumemNo = mcumemNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public int getExpertiseNo() {
		return expertiseNo;
	}
	public void setExpertiseNo(int expertiseNo) {
		this.expertiseNo = expertiseNo;
	}
	public String getJobsearchFlag() {
		return jobsearchFlag;
	}
	public void setJobsearchFlag(String jobsearchFlag) {
		this.jobsearchFlag = jobsearchFlag;
	}
	public String getResumeopenFlag() {
		return resumeopenFlag;
	}
	public void setResumeopenFlag(String resumeopenFlag) {
		this.resumeopenFlag = resumeopenFlag;
	}
	public String getRefName() {
		return refName;
	}
	public void setRefName(String refName) {
		this.refName = refName;
	}
	@Override
	public String toString() {
		return "MatchupMemVO [mcumemNo=" + mcumemNo + ", memNo=" + memNo + ", resumeNo=" + resumeNo + ", expertiseNo="
				+ expertiseNo + ", jobsearchFlag=" + jobsearchFlag + ", resumeopenFlag=" + resumeopenFlag + ", refName="
				+ refName + "]";
	}

	
	
	
	
}
