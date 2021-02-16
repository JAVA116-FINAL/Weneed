package com.it.wanted.career.admin.model;

import java.util.List;
import java.util.Map;

public class ProgramSelectAllVO {
	//private List<Map<String, Object>> ProgramDetailsView;
	private ProgramVO programVo;
	private ProgramVO2 programVo2;
	private List<ProgramSelectAllVO> proSelectAllVo;
	
	public List<ProgramSelectAllVO> getProSelectAllVo() {
		return proSelectAllVo;
	}
	public void setProSelectAllVo(List<ProgramSelectAllVO> proSelectAllVo) {
		this.proSelectAllVo = proSelectAllVo;
	}
	public ProgramVO getProgramVo() {
		return programVo;
	}
	public void setProgramVo(ProgramVO programVo) {
		this.programVo = programVo;
	}
	public ProgramVO2 getProgramVo2() {
		return programVo2;
	}
	public void setProgramVo2(ProgramVO2 programVo2) {
		this.programVo2 = programVo2;
	}
	@Override
	public String toString() {
		return "ProgramSelectAllVO [programVo=" + programVo + ", programVo2=" + programVo2 + ", proSelectAllVo="
				+ proSelectAllVo + "]";
	}

	
	
	
	
	
}
