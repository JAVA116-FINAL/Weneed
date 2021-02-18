package com.it.wanted.notice.utility;

public class NoticeSearchVO {
	/**현재 페이지*/
	private int currentPage = 1;

	/**블럭당 보여질 페이지 수,  페이지 사이즈 */
	private int blockSize; // properties에서 설정

	/** 시작 인덱스 */
	private int firstRecordIndex = 1;

	/** 끝 인덱스 */
	private int lastRecordIndex = 1;

	/**페이지 별 레코드 갯수 (pageSize) */
	private int recordCountPerPage; 
	
	/** 검색키워드 */
	private String searchKeyword = "";
	
	private int noticeDept1;
	private int noticeDept2;

	public void setSearchVO(NoticeSearchVO bean){
    	this.currentPage = bean.currentPage;
    	this.searchKeyword = bean.getSearchKeyword();
    	this.noticeDept1 = bean.getNoticeDept1();
    	this.noticeDept2 = bean.getNoticeDept1();
    	this.blockSize = bean.blockSize;
    	this.firstRecordIndex = bean.firstRecordIndex;
    	this.lastRecordIndex = bean.lastRecordIndex;
    	this.recordCountPerPage = bean.recordCountPerPage;
    } 

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}

	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}

	public int getLastRecordIndex() {
		return lastRecordIndex;
	}

	public void setLastRecordIndex(int lastRecordIndex) {
		this.lastRecordIndex = lastRecordIndex;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	public int getNoticeDept1() {
		return noticeDept1;
	}

	public void setNoticeDept1(int noticeDept1) {
		this.noticeDept1 = noticeDept1;
	}
	
	public int getNoticeDept2() {
		return noticeDept2;
	}

	public void setNoticeDept2(int noticeDept2) {
		this.noticeDept2 = noticeDept2;
	}

	@Override
	public String toString() {
		return "NoticeSearchVO [currentPage=" + currentPage + ", blockSize=" + blockSize + ", firstRecordIndex="
				+ firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex + ", recordCountPerPage="
				+ recordCountPerPage + ", searchKeyword=" + searchKeyword + ", noticeDept1=" + noticeDept1
				+ ", noticeDept2=" + noticeDept2 + "]";
	}
	
    

}