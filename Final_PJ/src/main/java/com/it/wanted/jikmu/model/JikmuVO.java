package com.it.wanted.jikmu.model;

public class JikmuVO {
	private String jikmuCode;
	private String jikmuName;
	private String jikgunCode;
	
	public String getJikmuCode() {
		return jikmuCode;
	}
	public void setJikmuCode(String jikmuCode) {
		this.jikmuCode = jikmuCode;
	}
	public String getJikmuName() {
		return jikmuName;
	}
	public void setJikmuName(String jikmuName) {
		this.jikmuName = jikmuName;
	}
	public String getJikgunCode() {
		return jikgunCode;
	}
	public void setJikgunCode(String jikgunCode) {
		this.jikgunCode = jikgunCode;
	}
	
	@Override
	public String toString() {
		return "JikmuVO [jikmuCode=" + jikmuCode + ", jikmuName=" + jikmuName + ", jikgunCode=" + jikgunCode + "]";
	}
	
}
