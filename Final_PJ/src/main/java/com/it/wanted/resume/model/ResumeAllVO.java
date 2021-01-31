package com.it.wanted.resume.model;

import java.util.List;

import com.it.wanted.achievement.model.AchievementVO;
import com.it.wanted.addinformatiod.model.AddinformatiodVO;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.languages.model.LanguagesVO;
import com.it.wanted.languagestest.model.LanguagestestVO;
import com.it.wanted.link.model.LinkVO;

public class ResumeAllVO {
	private ResumeVO resumeVo;
	private List<CareerVO> crrList;
	private List<AchievementVO>achList;
	private List<EducationVO>eduList;
	private List<AddinformatiodVO>addList;
	private List<LanguagesVO>langList;
	private List<LanguagestestVO>testList;
	private List<LinkVO>linkList;
	
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
	public List<EducationVO> getEduList() {
		return eduList;
	}
	public void setEduList(List<EducationVO> eduList) {
		this.eduList = eduList;
	}
	public List<AddinformatiodVO> getAddList() {
		return addList;
	}
	public void setAddList(List<AddinformatiodVO> addList) {
		this.addList = addList;
	}
	public List<LanguagesVO> getLangList() {
		return langList;
	}
	public void setLangList(List<LanguagesVO> langList) {
		this.langList = langList;
	}
	public List<LanguagestestVO> getTestList() {
		return testList;
	}
	public void setTestList(List<LanguagestestVO> testList) {
		this.testList = testList;
	}
	public List<LinkVO> getLinkList() {
		return linkList;
	}
	public void setLinkList(List<LinkVO> linkList) {
		this.linkList = linkList;
	}
	
	@Override
	public String toString() {
		return "ResumeAllVO [resumeVo=" + resumeVo + ", crrList=" + crrList + ", achList=" + achList + ", eduList="
				+ eduList + ", addList=" + addList + ", langList=" + langList + ", testList=" + testList + ", linkList="
				+ linkList + "]";
	}
	
}
