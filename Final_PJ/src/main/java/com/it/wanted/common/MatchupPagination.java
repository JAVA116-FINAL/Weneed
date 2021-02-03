package com.it.wanted.common;

public class MatchupPagination {
	/* 계산 안하고 바로 입력받을 변수들 */
	
	//현재 페이지
	private int curPage=1;

	//페이지사이즈, 페이지별 레코드 개수 (10개로 할 것임)
	private int pageSize;

	//블럭사이즈, 한번에 출력되는 페이징 갯수 (5개로 할 것임)
	private int blockSize;
	
	//총 레코드 개수
	private int totalRecord;
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getBlockSize() {
		return blockSize;
	}

	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	
	
	
	
	/* 커런트페이지, 페이지사이즈, 블록사이즈, 토탈레코드를 이용하여 계산해야 하는 값들 */

	//페이지의 첫번째 레코드값
	//curPage를 이용해서 계산해줘야 할 것 같다. 
	private int firstRecordOfPage;
	
	public void setFirstRecordOfPage() {
		this.firstRecordOfPage=(getCurPage() - 1)*getPageSize();
	} //+1 해야하지 않나..? 왜 안해도 되는거지?
	
	public int getFirstRecordOfPage() {
		return firstRecordOfPage;
	}
	
	//페이지의 마지막 레코드값
	private int lastRecordOfPage;
	
	public void setLastRecordOfPage() {
		this.lastRecordOfPage=getCurPage() * getPageSize();
	}
	
	public int getLastRecordOfPage() {
		return lastRecordOfPage;
	}

	//표시될 첫번째 페이지
	private int firstPage;
	
	public int getFirstPage() {
		firstPage=getCurPage() - ((getCurPage()-1) % getBlockSize());
		return firstPage;
	}
	
	//표시될 마지막 페이지
	private int lastPage;
	
	public int getLastPage() {
		lastPage=firstPage+getBlockSize()-1;
		if(lastPage>=getTotalPage()) {
			lastPage=getTotalPage();
		}
		return lastPage;
	}
	
	//총 페이지 수
	private int totalPage;
	
	public int getTotalPage() {
		totalPage=(int)Math.ceil((float)getTotalRecord()/getPageSize());
		return totalPage;
	}
}
