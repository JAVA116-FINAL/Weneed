package com.it.wanted.matchupCom.model;

public class MatchupZzimVO {
	private String comCode;
	private int mcumemNo;
	
	public String getComCode() {
		return comCode;
	}
	public void setComCode(String comCode) {
		this.comCode = comCode;
	}
	public int getMcumemNo() {
		return mcumemNo;
	}
	public void setMcumemNo(int mcumemNo) {
		this.mcumemNo = mcumemNo;
	}
	
	@Override
	public String toString() {
		return "MatchupZzimVO [comCode=" + comCode + ", mcumemNo=" + mcumemNo + "]";
	}
}
