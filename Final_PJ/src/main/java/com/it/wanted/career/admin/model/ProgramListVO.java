package com.it.wanted.career.admin.model;

import java.util.List;
public class ProgramListVO {
	private List<ProgramVO> proItems;

	public List<ProgramVO> getProItems() {
		return proItems;
	}

	public void setProItems(List<ProgramVO> proItems) {
		this.proItems = proItems;
	}

	@Override
	public String toString() {
		return "ProgramListVO [proItems=" + proItems + "]";
	}
	
}



