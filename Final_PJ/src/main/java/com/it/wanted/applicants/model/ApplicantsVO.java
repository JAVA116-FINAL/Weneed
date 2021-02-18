package com.it.wanted.applicants.model;

import java.sql.Timestamp;

public class ApplicantsVO {
	private int applyNo;	//지원번호
	private int memNo;	//회원번호
	private int posNo;	//포지션번호
	private String applyName;	//지원자이름
	private String applyHp;
	private String refName;	//추천인
	private int resumeNo;	//이력서번호
	private Timestamp applyRegdate;
	private String posName;	//포지션 이름 
	private int statusFlag;	
	private int favoFlag;	
	private Timestamp docPassRegdate;	
	private Timestamp regectRegdate;	
	private Timestamp passRegdate;	
	private int applyPeriod;
 
	//이력서 파일명 필요한가
	private String resumeFile;
	private String resumeUpfileflag;
	private String resumeTitle;
	private Timestamp resumeRegdate;

	//기업코드
	private String comCode;
	//기업이름
	private String comName;
	public String getComName() {
		return comName;
	}

	public void setComName(String comName) {
		this.comName = comName;
	}

	public Timestamp getResumeRegdate() {
		return resumeRegdate;
	}

	public void setResumeRegdate(Timestamp resumeRegdate) {
		this.resumeRegdate = resumeRegdate;
	}

	public String getResumeTitle() {
		return resumeTitle;
	}

	public void setResumeTitle(String resumeTitle) {
		this.resumeTitle = resumeTitle;
	}

	public String getResumeUpfileflag() {
		return resumeUpfileflag;
	}

	public void setResumeUpfileflag(String resumeUpfileflag) {
		this.resumeUpfileflag = resumeUpfileflag;
	}

	public int getApplyPeriod() {
		return applyPeriod;
	}

	public void setApplyPeriod(int applyPeriod) {
		this.applyPeriod = applyPeriod;
	}

	public int getStatusFlag() {
		return statusFlag;
	}

	public void setStatusFlag(int statusFlag) {
		this.statusFlag = statusFlag;
	}

	public int getFavoFlag() {
		return favoFlag;
	}

	public void setFavoFlag(int favoFlag) {
		this.favoFlag = favoFlag;
	}

	public Timestamp getDocPassRegdate() {
		return docPassRegdate;
	}

	public void setDocPassRegdate(Timestamp docPassRegdate) {
		this.docPassRegdate = docPassRegdate;
	}

	public Timestamp getRegectRegdate() {
		return regectRegdate;
	}

	public void setRegectRegdate(Timestamp regectRegdate) {
		this.regectRegdate = regectRegdate;
	}

	public Timestamp getPassRegdate() {
		return passRegdate;
	}

	public void setPassRegdate(Timestamp passRegdate) {
		this.passRegdate = passRegdate;
	}

	public String getPosName() {
		return posName;
	}

	public void setPosName(String posName) {
		this.posName = posName;
	}

	public Timestamp getApplyRegdate() {
		return applyRegdate;
	}

	public void setApplyRegdate(Timestamp applyRegdate) {
		this.applyRegdate = applyRegdate;
	}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getPosNo() {
		return posNo;
	}

	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}

	public String getApplyName() {
		return applyName;
	}

	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}

	public String getApplyHp() {
		return applyHp;
	}

	public void setApplyHp(String applyHp) {
		this.applyHp = applyHp;
	}

	public String getRefName() {
		return refName;
	}

	public void setRefName(String refName) {
		this.refName = refName;
	}

	public int getResumeNo() {
		return resumeNo;
	}

	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}

	public String getResumeFile() {
		return resumeFile;
	}

	public void setResumeFile(String resumeFile) {
		this.resumeFile = resumeFile;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	@Override
	public String toString() {
		return "ApplicantsVO [applyNo=" + applyNo + ", memNo=" + memNo + ", posNo=" + posNo + ", applyName=" + applyName
				+ ", applyHp=" + applyHp + ", refName=" + refName + ", resumeNo=" + resumeNo + ", applyRegdate="
				+ applyRegdate + ", posName=" + posName + ", statusFlag=" + statusFlag + ", favoFlag=" + favoFlag
				+ ", docPassRegdate=" + docPassRegdate + ", regectRegdate=" + regectRegdate + ", passRegdate="
				+ passRegdate + ", applyPeriod=" + applyPeriod + ", resumeFile=" + resumeFile + ", resumeUpfileflag="
				+ resumeUpfileflag + ", resumeTitle=" + resumeTitle + ", resumeRegdate=" + resumeRegdate + ", comCode="
				+ comCode + "]";
	}





}
