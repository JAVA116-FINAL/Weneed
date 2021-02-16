package com.it.wanted.common;

import java.util.List;

import com.it.wanted.comimginfo.model.ComImgInfoVO;

public class PaginationInfoJsonImgVO {
	private PaginationInfo pagingInfo;
	private List<ComImgInfoVO> comImgList;
	public PaginationInfo getPagingInfo() {
		return pagingInfo;
	}
	public void setPagingInfo(PaginationInfo pagingInfo) {
		this.pagingInfo = pagingInfo;
	}
	public List<ComImgInfoVO> getComImgList() {
		return comImgList;
	}
	public void setComImgList(List<ComImgInfoVO> comImgList) {
		this.comImgList = comImgList;
	}
	@Override
	public String toString() {
		return "PaginationInfoJsonImgVO [pagingInfo=" + pagingInfo + ", comImgList=" + comImgList + "]";
	}

}
