package com.it.wanted.matchup.model;

import java.util.List;

public class MatchupMemSearchVO {
	private List<Integer> mcumemNoList;
	private int viewMoreSize;
	private String keyword;
	
	public List<Integer> getMcumemList() {
		return mcumemNoList;
	}
	public void setMcumemList(List<Integer> mcumemNoList) {
		this.mcumemNoList = mcumemNoList;
	}
	public int getViewMoreSize() {
		return viewMoreSize;
	}
	public void setViewMoreSize(int viewMoreSize) {
		this.viewMoreSize = viewMoreSize;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	@Override
	public String toString() {
		return "MatchupMemSearchVO [mcumemNoList=" + mcumemNoList + ", viewMoreSize=" + viewMoreSize + ", keyword="
				+ keyword + "]";
	}
	
}
