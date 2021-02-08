package com.it.wanted.matchup.model;

import java.util.List;

import com.it.wanted.expertise.model.ExpertiseVO;
import com.it.wanted.matchupexcom.model.MatchupExComVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemJikmuVO;
import com.it.wanted.resume.model.ResumeVO;

public class MatchupAllVO {
	private ExpertiseVO expertVo;//전문분야
	private List<MatchupMemJikmuVO>mcujikmuList;//매치업직무
	private MatchupMemVO mcumemVo;//매치업 회원
	private ResumeVO resumeVo;//이력서 
	private MatchupExComVO mcuexVo;//매치업 제외기업
	
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
	public MatchupExComVO getMcuexVo() {
		return mcuexVo;
	}
	public void setMcuexVo(MatchupExComVO mcuexVo) {
		this.mcuexVo = mcuexVo;
	}
	
	@Override
	public String toString() {
		return "MatchupAllVO [expertVo=" + expertVo + ", mcujikmuList=" + mcujikmuList + ", mcumemVo=" + mcumemVo
				+ ", resumeVo=" + resumeVo + ", mcuexVo=" + mcuexVo + "]";
	}

}
