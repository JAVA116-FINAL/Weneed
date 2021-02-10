package com.it.wanted.notice.utility;


public class KeywordVO extends NoticeSearchVO{

	private String searchKeyword;

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	@Override
	public String toString() {
		return "KeywordVO [searchKeyword=" + searchKeyword + ", toString()=" + super.toString() +"]";
	}
	
	
}
