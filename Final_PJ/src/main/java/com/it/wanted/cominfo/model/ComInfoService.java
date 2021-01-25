package com.it.wanted.cominfo.model;

import java.util.List;

public interface ComInfoService {

	ComInfoVO selectCompany(int comMemNo);
	List<IndustryVO> selectIndustryList();
	List<NationVO> selectNationList();
	List<RegionVO> selectRegionList(String nationCode);
	List<ComSizeInfoVO> selectComSizeList();
	int insertComInfo(ComInfoVO comInfoVo);

}
