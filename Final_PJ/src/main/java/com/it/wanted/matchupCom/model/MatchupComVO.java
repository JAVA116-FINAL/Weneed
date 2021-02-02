package com.it.wanted.matchupCom.model;

import java.sql.Timestamp;

public class MatchupComVO {
	private int mcucomNo;
	private String comCode;
	private int emcpdNo;
	private Timestamp mcupdBuydate;
	private Timestamp mcupdExdate;
	private int resumeReadCount;
	private int maxResumeCount;
	
	public int getMcucomNo() {
		return mcucomNo;
	}
	public void setMcucomNo(int mcucomNo) {
		this.mcucomNo = mcucomNo;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public int getEmcpdNo() {
		return emcpdNo;
	}
	public void setEmcpdNo(int emcpdNo) {
		this.emcpdNo = emcpdNo;
	}
	public Timestamp getMcupdBuydate() {
		return mcupdBuydate;
	}
	public void setMcupdBuydate(Timestamp mcupdBuydate) {
		this.mcupdBuydate = mcupdBuydate;
	}
	public Timestamp getMcupdExdate() {
		return mcupdExdate;
	}
	public void setMcupdExdate(Timestamp mcupdExdate) {
		this.mcupdExdate = mcupdExdate;
	}
	public int getResumeReadCount() {
		return resumeReadCount;
	}
	public void setResumeReadCount(int resumeReadCount) {
		this.resumeReadCount = resumeReadCount;
	}
	public int getMaxResumeCount() {
		return maxResumeCount;
	}
	public void setMaxResumeCount(int maxResumeCount) {
		this.maxResumeCount = maxResumeCount;
	}
	@Override
	public String toString() {
		return "MatchupComVO [mcucomNo=" + mcucomNo + ", comCode=" + comCode + ", emcpdNo=" + emcpdNo
				+ ", mcupdBuydate=" + mcupdBuydate + ", mcupdExdate=" + mcupdExdate + ", resumeReadCount="
				+ resumeReadCount + ", maxResumeCount=" + maxResumeCount + "]";
	}
	
}
