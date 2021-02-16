package com.it.wanted.cominfo.model;

import java.util.List;

import com.it.wanted.common.SearchVO;

public interface ComInfoDAO {

	ComInfoVO selectCompany(int comMemNo);
	List<IndustryVO> selectIndustryList();
	List<NationVO> selectNationList();
	List<RegionVO> selectRegionList(String nationCode);
	List<ComSizeInfoVO> selectComSizeList();
	int insertComInfo(ComInfoVO comInfoVo);
	List<ComInfoVO> selectAllCompany(SearchVO searchVo);
	int changeStatusYettoPass(String comCode);
	int selectTotalRecord(SearchVO searchVo);
	List<ComInfoVO> selectAllYetCompany(SearchVO searchVo);
	int selectYetTotalRecord(SearchVO searchVo);
	List<ComInfoVO> selectAllPassedCompany(SearchVO searchVo2);
	int selectPassedTotalRecord(SearchVO searchVo2);
}
