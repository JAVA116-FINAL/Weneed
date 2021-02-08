package com.it.wanted.matchupexcom.model;

public class MatchupExComVO {
	
	private int mcumemNo;//MCUMEM_NO NUMBER PRIMARY KEY, /* 매치업일반번호 */
	private int mcucomNo;//MCUCOM_NO NUMBER REFERENCES MATCHUPCOM(MCUCOM_NO)ON DELETE CASCADE/* 매치업기업번호 */
	
	public int getMcumemNo() {
		return mcumemNo;
	}
	public void setMcumemNo(int mcumemNo) {
		this.mcumemNo = mcumemNo;
	}
	public int getMcucomNo() {
		return mcucomNo;
	}
	public void setMcucomNo(int mcucomNo) {
		this.mcucomNo = mcucomNo;
	}
	
	@Override
	public String toString() {
		return "MatchupExComVO [mcumemNo=" + mcumemNo + ", mcucomNo=" + mcucomNo + "]";
	}
	

}
