package com.it.wanted.common;

import java.util.List;
import java.util.Map;

import com.it.wanted.position.model.PositionVO;

public class PaginationInfoJsonPositionVO {
	private PaginationInfo pagingInfo;
	private List<Map<String, Object>> posList;
	public PaginationInfo getPagingInfo() {
		return pagingInfo;
	}
	public void setPagingInfo(PaginationInfo pagingInfo) {
		this.pagingInfo = pagingInfo;
	}
	public List<Map<String, Object>> getPosList() {
		return posList;
	}
	public void setPosList(List<Map<String, Object>> posList) {
		this.posList = posList;
	}
	@Override
	public String toString() {
		return "PaginationInfoJsonPositionVO [pagingInfo=" + pagingInfo + ", posList=" + posList + "]";
	}
	
}
