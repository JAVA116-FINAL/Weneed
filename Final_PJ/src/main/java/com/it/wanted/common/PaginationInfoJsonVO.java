package com.it.wanted.common;

import java.util.List;

import com.it.wanted.cominfo.model.ComInfoVO;

public class PaginationInfoJsonVO {
	private PaginationInfo pagingInfo;
	private List<ComInfoVO> comList;
	
	public PaginationInfo getPagingInfo() {
		return pagingInfo;
	}
	public void setPagingInfo(PaginationInfo pagingInfo) {
		this.pagingInfo = pagingInfo;
	}
	public List<ComInfoVO> getComList() {
		return comList;
	}
	public void setComList(List<ComInfoVO> comList) {
		this.comList = comList;
	}
	
	@Override
	public String toString() {
		return "PaginationInfoJsonVO [pagingInfo=" + pagingInfo + ", comList=" + comList + "]";
	}
}
