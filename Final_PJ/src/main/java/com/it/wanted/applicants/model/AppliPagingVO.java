package com.it.wanted.applicants.model;

import com.it.wanted.common.SearchVO;

public class AppliPagingVO extends SearchVO{
	private int applyNo;
	private int statusFlag;
	private String comCode;
	private int posNo;
	
	
	
	public int getPosNo() {
		return posNo;
	}

	public void setPosNo(int posNo) {
		this.posNo = posNo;
	}

	public String getComCode() {
		return comCode;
	}

	public void setComCode(String comCode) {
		this.comCode = comCode;
	}

	public int getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(int applyNo) {
		this.applyNo = applyNo;
	}

	public int getStatusFlag() {
		return statusFlag;
	}

	public void setStatusFlag(int statusFlag) {
		this.statusFlag = statusFlag;
	}

	@Override
	public String toString() {
		return "AppliPagingVO [applyNo=" + applyNo + ", statusFlag=" + statusFlag + ", comCode=" + comCode + ", posNo="
				+ posNo + "]";
	}
	
	
}
