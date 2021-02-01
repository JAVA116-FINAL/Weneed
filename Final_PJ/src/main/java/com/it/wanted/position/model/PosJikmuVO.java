package com.it.wanted.position.model;

public class PosJikmuVO {
	private int posNo;
	private String JikmuCode;
	public int getPosNo() {
		return posNo;
	}
	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}
	public String getJikmuCode() {
		return JikmuCode;
	}
	public void setJikmuCode(String jikmuCode) {
		JikmuCode = jikmuCode;
	}
	
	@Override
	public String toString() {
		return "PosJikmuVO [posNo=" + posNo + ", JikmuCode=" + JikmuCode + "]";
	}
	
}
