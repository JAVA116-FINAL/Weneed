package com.it.wanted.addinformatiod.model;

public interface AddinformatiodDAO {

	public int insertAdd(AddinformatiodVO aVo);
	public AddinformatiodVO selectAdd(int resumeNo);
	public int deleteAdd(int addNo);
	public int updateAdd(AddinformatiodVO aVo);
}
