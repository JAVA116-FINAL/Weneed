package com.it.wanted.commeminfo.model;

import java.sql.Timestamp;

public class ComMemInfoVO {
	private int comMemNo;
	private String comMemId;
	private String comMemPwd;
	private String comMemName;
	private String comMemTeam;
	private String comMemMobile;
	private Timestamp comMemRegdate;
	
	public int getComMemNo() {
		return comMemNo;
	}
	public void setComMemNo(int comMemNo) {
		this.comMemNo = comMemNo;
	}
	public String getComMemId() {
		return comMemId;
	}
	public void setComMemId(String comMemId) {
		this.comMemId = comMemId;
	}
	public String getComMemPwd() {
		return comMemPwd;
	}
	public void setComMemPwd(String comMemPwd) {
		this.comMemPwd = comMemPwd;
	}
	public String getComMemName() {
		return comMemName;
	}
	public void setComMemName(String comMemName) {
		this.comMemName = comMemName;
	}
	public String getComMemTeam() {
		return comMemTeam;
	}
	public void setComMemTeam(String comMemTeam) {
		this.comMemTeam = comMemTeam;
	}
	public String getComMemMobile() {
		return comMemMobile;
	}
	public void setComMemMobile(String comMemMobile) {
		this.comMemMobile = comMemMobile;
	}
	public Timestamp getComMemRegdate() {
		return comMemRegdate;
	}
	public void setComMemRegdate(Timestamp comMemRegdate) {
		this.comMemRegdate = comMemRegdate;
	}
	@Override
	public String toString() {
		return "ComMemInfoVO [comMemNo=" + comMemNo + ", comMemId=" + comMemId + ", comMemPwd=" + comMemPwd
				+ ", comMemName=" + comMemName + ", comMemTeam=" + comMemTeam + ", comMemMobile=" + comMemMobile
				+ ", comMemRegdate=" + comMemRegdate + "]";
	}
	
}
