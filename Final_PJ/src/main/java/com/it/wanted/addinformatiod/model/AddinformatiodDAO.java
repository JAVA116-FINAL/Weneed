package com.it.wanted.addinformatiod.model;

import java.util.List;

public interface AddinformatiodDAO {

	public int insertAdd(AddinformatiodVO aVo);
	public AddinformatiodVO selectAdd(int resumeNo);
	public int deleteAdd(int addNo);
	public int updateAdd(AddinformatiodVO aVo);
	public List<AddinformatiodVO>selectAddByResumeNo(int resumeNo);
}
