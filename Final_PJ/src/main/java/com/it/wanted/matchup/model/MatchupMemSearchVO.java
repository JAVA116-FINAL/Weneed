package com.it.wanted.matchup.model;

import java.util.List;

public class MatchupMemSearchVO {
	private List<Integer> mcumemNoList;
	private int viewMoreSize;
	private String searchKeyword;
	private String searchMinCareer;
	private String searchMaxCareer;
	private String searchJikmu;
	private String searchJikgun;
	
	public String getSearchJikgun() {
		return searchJikgun;
	}
	public void setSearchJikgun(String searchJikgun) {
		this.searchJikgun = searchJikgun;
	}
	public List<Integer> getMcumemNoList() {
		return mcumemNoList;
	}
	public void setMcumemNoList(List<Integer> mcumemNoList) {
		this.mcumemNoList = mcumemNoList;
	}
	public int getViewMoreSize() {
		return viewMoreSize;
	}
	public void setViewMoreSize(int viewMoreSize) {
		this.viewMoreSize = viewMoreSize;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getSearchMinCareer() {
		return searchMinCareer;
	}
	public void setSearchMinCareer(String searchMinCareer) {
		this.searchMinCareer = searchMinCareer;
	}
	public String getSearchMaxCareer() {
		return searchMaxCareer;
	}
	public void setSearchMaxCareer(String searchMaxCareer) {
		this.searchMaxCareer = searchMaxCareer;
	}
	public String getSearchJikmu() {
		return searchJikmu;
	}
	public void setSearchJikmu(String searchJikmu) {
		this.searchJikmu = searchJikmu;
	}
	
	@Override
	public String toString() {
		return "MatchupMemSearchVO [mcumemNoList=" + mcumemNoList + ", viewMoreSize=" + viewMoreSize
				+ ", searchKeyword=" + searchKeyword + ", searchMinCareer=" + searchMinCareer + ", searchMaxCareer="
				+ searchMaxCareer + ", searchJikmu=" + searchJikmu + ", searchJikgun=" + searchJikgun + "]";
	}
	
}
