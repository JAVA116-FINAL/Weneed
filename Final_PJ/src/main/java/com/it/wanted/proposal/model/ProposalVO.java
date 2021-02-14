package com.it.wanted.proposal.model;

import java.sql.Timestamp;

public class ProposalVO {
	private int proposalNo;
	private int memNo;
	private String proposalMessage;
	private String jobTitle;
	private String region;
	private String minSalary;
	private String maxSalary;
	private String stockOption;
	private String proposalCkFlag;
	private Timestamp proposalDate;
	private String comCode;
	private int comMemNo;
	private int posNo;
	
	public int getProposalNo() {
		return proposalNo;
	}
	public void setProposalNo(int proposalNo) {
		this.proposalNo = proposalNo;
	}
	public int getMemNo() {
		return memNo;
	}
	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}
	public String getProposalMessage() {
		return proposalMessage;
	}
	public void setProposalMessage(String proposalMessage) {
		this.proposalMessage = proposalMessage;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getMinSalary() {
		return minSalary;
	}
	public void setMinSalary(String minSalary) {
		this.minSalary = minSalary;
	}
	public String getMaxSalary() {
		return maxSalary;
	}
	public void setMaxSalary(String maxSalary) {
		this.maxSalary = maxSalary;
	}
	public String getStockOption() {
		return stockOption;
	}
	public void setStockOption(String stockOption) {
		this.stockOption = stockOption;
	}
	public String getProposalCkFlag() {
		return proposalCkFlag;
	}
	public void setProposalCkFlag(String proposalCkFlag) {
		this.proposalCkFlag = proposalCkFlag;
	}
	public Timestamp getProposalDate() {
		return proposalDate;
	}
	public void setProposalDate(Timestamp proposalDate) {
		this.proposalDate = proposalDate;
	}
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public int getComMemNo() {
		return comMemNo;
	}
	public void setComMemNo(int comMemNo) {
		this.comMemNo = comMemNo;
	}
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	
	@Override
	public String toString() {
		return "ProposalVO [proposalNo=" + proposalNo + ", memNo=" + memNo + ", proposalMessage=" + proposalMessage
				+ ", jobTitle=" + jobTitle + ", region=" + region + ", minSalary=" + minSalary + ", maxSalary="
				+ maxSalary + ", stockOption=" + stockOption + ", proposalCkFlag=" + proposalCkFlag + ", proposalDate="
				+ proposalDate + ", comCode=" + comCode + ", comMemNo=" + comMemNo + ", posNo=" + posNo + "]";
	}
	
}
