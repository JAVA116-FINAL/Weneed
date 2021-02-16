package com.it.wanted.applicants.model;

import com.it.wanted.common.SearchVO;

public class AppliPagingVO extends SearchVO{
	private int applyNo;
	private int statusFlag;

	
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
		return "ApplicantsSearchVO [statusFlag=" + statusFlag + "]";
	}
	
	
}
