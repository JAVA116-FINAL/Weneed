package com.it.wanted.career.admin.model;

import java.util.List;
import java.util.Map;

public class ProgramAllVO {
	//program 테이블 정보, 1:1관계 - association엘리먼트 이용
	//private ProgramVO programVo;
	//private ProgramVO programVo;
	private List<ProgramVO2> proVo2List;
	//programDetailsView 뷰정보, 1:N관계 - collection 엘리먼트 이용
	//private List<Map<String, Object>> programVO2;
	//private List<Map<String, Object>> programDetailsList;

	public List<ProgramVO2> getProVo2List() {
		return proVo2List;
	}
	public void setProVo2List(List<ProgramVO2> proVo2List) {
		this.proVo2List = proVo2List;
	}

	@Override
	public String toString() {
		return "ProgramAllVO [proVo2List=" + proVo2List + "]";
	}
	
	
	
}
