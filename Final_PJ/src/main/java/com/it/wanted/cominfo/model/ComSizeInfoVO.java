package com.it.wanted.cominfo.model;

public class ComSizeInfoVO {
	private String comSizeCode;
	private String comSize;
	private String comSizeOrder;

	public String getComSizeCode() {
		return comSizeCode;
	}
	public void setComSizeCode(String comSizeCode) {
		this.comSizeCode = comSizeCode;
	}
	public String getComSize() {
		return comSize;
	}
	public void setComSize(String comSize) {
		this.comSize = comSize;
	}
	public String getComSizeOrder() {
		return comSizeOrder;
	}
	public void setComSizeOrder(String comSizeOrder) {
		this.comSizeOrder = comSizeOrder;
	}
	
	@Override
	public String toString() {
		return "ComSizeInfoVO [comSizeCode=" + comSizeCode + ", comSize=" + comSize + ", comSizeOrder=" + comSizeOrder
				+ "]";
	}
	
}
