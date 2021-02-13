package com.it.wanted.matchupStatus.model;

import java.sql.Timestamp;

public class MatchupStatusVO {
	private int mcustatusNo;
	private int mcucomNo;
	private int mcumemNo;
	private Timestamp matchDate;
	private Timestamp proposalDate;
	private Timestamp proposalCheckDate;
	private Timestamp proposalOkDate;
	private Timestamp expireDate;
	private int matchupFlag;
	public int getMcustatusNo() {
		return mcustatusNo;
	}
	public void setMcustatusNo(int mcustatusNo) {
		this.mcustatusNo = mcustatusNo;
	}
	public int getMcucomNo() {
		return mcucomNo;
	}
	public void setMcucomNo(int mcucomNo) {
		this.mcucomNo = mcucomNo;
	}
	public int getMcumemNo() {
		return mcumemNo;
	}
	public void setMcumemNo(int mcumemNo) {
		this.mcumemNo = mcumemNo;
	}
	public Timestamp getMatchDate() {
		return matchDate;
	}
	public void setMatchDate(Timestamp matchDate) {
		this.matchDate = matchDate;
	}
	public Timestamp getProposalDate() {
		return proposalDate;
	}
	public void setProposalDate(Timestamp proposalDate) {
		this.proposalDate = proposalDate;
	}
	public Timestamp getProposalCheckDate() {
		return proposalCheckDate;
	}
	public void setProposalCheckDate(Timestamp proposalCheckDate) {
		this.proposalCheckDate = proposalCheckDate;
	}
	public Timestamp getProposalOkDate() {
		return proposalOkDate;
	}
	public void setProposalOkDate(Timestamp proposalOkDate) {
		this.proposalOkDate = proposalOkDate;
	}
	public Timestamp getExpireDate() {
		return expireDate;
	}
	public void setExpireDate(Timestamp expireDate) {
		this.expireDate = expireDate;
	}
	public int getMatchupFlag() {
		return matchupFlag;
	}
	public void setMatchupFlag(int matchupFlag) {
		this.matchupFlag = matchupFlag;
	}
	
	@Override
	public String toString() {
		return "MatchupStatusVO [mcustatusNo=" + mcustatusNo + ", mcucomNo=" + mcucomNo + ", mcumemNo=" + mcumemNo
				+ ", matchDate=" + matchDate + ", proposalDate=" + proposalDate + ", proposalCheckDate="
				+ proposalCheckDate + ", proposalOkDate=" + proposalOkDate + ", expireDate=" + expireDate
				+ ", matchupFlag=" + matchupFlag + "]";
	}
	
}
