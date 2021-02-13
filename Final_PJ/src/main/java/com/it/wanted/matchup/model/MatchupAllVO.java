package com.it.wanted.matchup.model;

import java.util.List;

import com.it.wanted.career.model.CareerVO;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.expertise.model.ExpertiseVO;
import com.it.wanted.matchupexcom.model.MatchupExComVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemJikmuVO;
import com.it.wanted.resume.model.ResumeVO;

public class MatchupAllVO {
	private MatchupMemVO mcumemVo;//매치업 회원1
	private ResumeVO resumeVo;//이력서 2
	private EducationVO eduVo;
	private CareerVO careerVo;
	//private ResumeAllVO rAllVo;//이력서뭉치 2
	private ExpertiseVO expertVo;//3전문분야
	private List<MatchupMemJikmuVO>mcujikmuList;//4매치업직무
	private List<MatchupExComVO>mcuexList;//5매치업 제외기업
	
	public MatchupMemVO getMcumemVo() {
		return mcumemVo;
	}
	public void setMcumemVo(MatchupMemVO mcumemVo) {
		this.mcumemVo = mcumemVo;
	}

	public ResumeVO getResumeVo() {
		return resumeVo;
	}
	public void setResumeVo(ResumeVO resumeVo) {
		this.resumeVo = resumeVo;
	}
	public EducationVO getEduVo() {
		return eduVo;
	}
	public void setEduVo(EducationVO eduVo) {
		this.eduVo = eduVo;
	}
	public CareerVO getCareerVo() {
		return careerVo;
	}
	public void setCareerVo(CareerVO careerVo) {
		this.careerVo = careerVo;
	}
	public ExpertiseVO getExpertVo() {
		return expertVo;
	}
	public void setExpertVo(ExpertiseVO expertVo) {
		this.expertVo = expertVo;
	}
	public List<MatchupMemJikmuVO> getMcujikmuList() {
		return mcujikmuList;
	}
	public void setMcujikmuList(List<MatchupMemJikmuVO> mcujikmuList) {
		this.mcujikmuList = mcujikmuList;
	}
	
	public List<MatchupExComVO> getMcuexList() {
		return mcuexList;
	}
	public void setMcuexList(List<MatchupExComVO> mcuexList) {
		this.mcuexList = mcuexList;
	}
	@Override
	public String toString() {
		return "MatchupAllVO [mcumemVo=" + mcumemVo + ", resumeVo=" + resumeVo + ", eduVo=" + eduVo + ", careerVo="
				+ careerVo + ", expertVo=" + expertVo + ", mcujikmuList=" + mcujikmuList + ", mcuexList=" + mcuexList
				+ "]";
	}
}
