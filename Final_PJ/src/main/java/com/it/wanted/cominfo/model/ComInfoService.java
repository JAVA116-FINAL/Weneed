package com.it.wanted.cominfo.model;

import java.util.List;

import com.it.wanted.common.SearchVO;

public interface ComInfoService {

	ComInfoVO selectCompany(int comMemNo);
	List<IndustryVO> selectIndustryList();
	List<NationVO> selectNationList();
	List<RegionVO> selectRegionList(String nationCode);
	List<ComSizeInfoVO> selectComSizeList();
	int insertComInfo(ComInfoVO comInfoVo);
	List<ComInfoVO> selectAllCompany(SearchVO searchVo);
	List<ComInfoVO> changeStatustoPass(List<String> comCodeArr, List<String> comMemNoArr);
	int selectTotalRecord(SearchVO searchVo);
	List<ComInfoVO> selectAllYetCompany(SearchVO searchVo);
	int selectYetTotalRecord(SearchVO searchVo);
	List<ComInfoVO> selectAllPassedCompany(SearchVO searchVo2);
	int selectPassedTotalRecord(SearchVO searchVo2);

}
