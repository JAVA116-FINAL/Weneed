package com.it.wanted.link.model;

public class LinkVO {
	private int linkNo;//LINK_NO NUMBER PRIMARY KEY, /* 링크번호 */
	private int resumeNo;//RESUME_NO NUMBER REFERENCES RESUME(RESUME_NO) ON DELETE CASCADE, /* 이력서 번호 */
	private String linkUrl;//LINK_URL VARCHAR2(255) NULL /* 링크주소 */
	public int getLinkNo() {
		return linkNo;
	}
	public void setLinkNo(int linkNo) {
		this.linkNo = linkNo;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public String getLinkUrl() {
		return linkUrl;
	}
	public void setLinkUrl(String linkUrl) {
		this.linkUrl = linkUrl;
	}
	@Override
	public String toString() {
		return "LinkVO [linkNo=" + linkNo + ", resumeNo=" + resumeNo + ", linkUrl=" + linkUrl + "]";
	}
	
	
}
