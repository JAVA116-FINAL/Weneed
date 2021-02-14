package com.it.wanted.matchup.model;

import java.util.List;
import java.util.Map;

public class MatchupDetailAllVO {
	private	MatchupDetailsViewVO MMDetailsVo;
	private List<Map<String, Object>>mcuexList;//5매치업 제외기업
	
	public MatchupDetailsViewVO getMMDetailsVo() {
		return MMDetailsVo;
	}
	public void setMMDetailsVo(MatchupDetailsViewVO mMDetailsVo) {
		MMDetailsVo = mMDetailsVo;
	}
	public List<Map<String, Object>> getMcuexList() {
		return mcuexList;
	}
	public void setMcuexList(List<Map<String, Object>> mcuexList) {
		this.mcuexList = mcuexList;
	}
	@Override
	public String toString() {
		return "MatchupDetailAllVO [MMDetailsVo=" + MMDetailsVo + ", mcuexList=" + mcuexList + "]";
	}
	
	
}
