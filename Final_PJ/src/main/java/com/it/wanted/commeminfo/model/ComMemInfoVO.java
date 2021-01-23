package com.it.wanted.commeminfo.model;

import java.sql.Timestamp;

public class ComMemInfoVO {
	private int comMemNo;
	private String comMemId;
	private String comMemPwd;
	private String comMemName;
	private String comTeam;
	private String comMobile;
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
	public String getComTeam() {
		return comTeam;
	}
	public void setComTeam(String comTeam) {
		this.comTeam = comTeam;
	}
	public String getComMobile() {
		return comMobile;
	}
	public void setComMobile(String comMobile) {
		this.comMobile = comMobile;
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
				+ ", comMemName=" + comMemName + ", comTeam=" + comTeam + ", comMobile=" + comMobile
				+ ", comMemRegdate=" + comMemRegdate + "]";
	}
	
}
