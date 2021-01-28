package com.it.wanted.jikgun.model;

public class JikgunVO {
	private String jikgunCode;
	private String jikgunName;
	
	public String getJikgunCode() {
		return jikgunCode;
	}
	public void setJikgunCode(String jikgunCode) {
		this.jikgunCode = jikgunCode;
	}
	public String getJikgunName() {
		return jikgunName;
	}
	public void setJikgunName(String jikgunName) {
		this.jikgunName = jikgunName;
	}
	@Override
	public String toString() {
		return "JikgunVO [jikgunCode=" + jikgunCode + ", jikgunName=" + jikgunName + "]";
	}

}
