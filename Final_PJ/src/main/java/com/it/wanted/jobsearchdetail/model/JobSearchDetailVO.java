package com.it.wanted.jobsearchdetail.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.position.model.PositionVO;

public class JobSearchDetailVO {

	private List<JobSearchAllVO> jsAllVoList;
	private JobSearchDetailsViewVO jsDetailsViewVo;
	private List<JobSearchDetailsViewVO> jsDetailsViewVoList;
	
	//jobsresearchdetailview 뷰 정보, 1:N 관계 - collection 엘리먼트 이용
	private List<Map<String, Object>> jobsresearchdetailsList;

	public List<JobSearchAllVO> getJsAllVoList() {
		return jsAllVoList;
	}

	public void setJsAllVoList(List<JobSearchAllVO> jsAllVoList) {
		this.jsAllVoList = jsAllVoList;
	}

	public JobSearchDetailsViewVO getJsDetailsViewVo() {
		return jsDetailsViewVo;
	}

	public void setJsDetailsViewVo(JobSearchDetailsViewVO jsDetailsViewVo) {
		this.jsDetailsViewVo = jsDetailsViewVo;
	}

	public List<JobSearchDetailsViewVO> getJsDetailsViewVoList() {
		return jsDetailsViewVoList;
	}

	public void setJsDetailsViewVoList(List<JobSearchDetailsViewVO> jsDetailsViewVoList) {
		this.jsDetailsViewVoList = jsDetailsViewVoList;
	}

	public List<Map<String, Object>> getJobsresearchdetailsList() {
		return jobsresearchdetailsList;
	}

	public void setJobsresearchdetailsList(List<Map<String, Object>> jobsresearchdetailsList) {
		this.jobsresearchdetailsList = jobsresearchdetailsList;
	}

	@Override
	public String toString() {
		return "JobSearchDetailVO [jsAllVoList=" + jsAllVoList + ", jsDetailsViewVo=" + jsDetailsViewVo
				+ ", jsDetailsViewVoList=" + jsDetailsViewVoList + ", jobsresearchdetailsList="
				+ jobsresearchdetailsList + "]";
	}
	
	
	
	
}
