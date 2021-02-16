package com.it.wanted.jobsearchdetail.model;

import java.util.List;

import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.position.model.PositionVO;

public class JobSearchAllVO {
	private PositionVO posVo;
	private ComInfoVO cominfoVo;
	private ComImgInfoVO comimgVo;
	private List<PositionVO> posVoList;
	
	
	public PositionVO getPosVo() {
		return posVo;
	}
	public void setPosVo(PositionVO posVo) {
		this.posVo = posVo;
	}
	public ComInfoVO getCominfoVo() {
		return cominfoVo;
	}
	public void setCominfoVo(ComInfoVO cominfoVo) {
		this.cominfoVo = cominfoVo;
	}
	public ComImgInfoVO getComimgVo() {
		return comimgVo;
	}
	public void setComimgVo(ComImgInfoVO comimgVo) {
		this.comimgVo = comimgVo;
	}
	public List<PositionVO> getPosVoList() {
		return posVoList;
	}
	public void setPosVoList(List<PositionVO> posVoList) {
		this.posVoList = posVoList;
	}
	@Override
	public String toString() {
		return "JobSearchAllVO [posVo=" + posVo + ", cominfoVo=" + cominfoVo + ", comimgVo=" + comimgVo + ", posVoList="
				+ posVoList + "]";
	}

	
	
	
	
	
	
	
}
