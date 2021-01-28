package com.it.wanted.resume.model;

import java.util.List;

import com.it.wanted.achievement.model.AchievementVO;
import com.it.wanted.career.model.CareerVO;

public class ResumeAllVO {
	private ResumeVO resumeVo;
	private List<CareerVO> crrList;
	private List<AchievementVO>achList;
	
	public ResumeVO getResumeVo() {
		return resumeVo;
	}
	public void setResumeVo(ResumeVO resumeVo) {
		this.resumeVo = resumeVo;
	}
	public List<CareerVO> getCrrList() {
		return crrList;
	}
	public void setCrrList(List<CareerVO> crrList) {
		this.crrList = crrList;
	}
	public List<AchievementVO> getAchList() {
		return achList;
	}
	public void setAchList(List<AchievementVO> achList) {
		this.achList = achList;
	}
	@Override
	public String toString() {
		return "ResumeAllVO [resumeVo=" + resumeVo + ", crrList=" + crrList + ", achList=" + achList + "]";
	}
	
}
