package com.it.wanted.cominfo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComInfoServiceImpl implements ComInfoService {
	@Autowired ComInfoDAO comInfoDao;

	@Override
	public ComInfoVO selectCompany(int comMemNo) {
		return comInfoDao.selectCompany(comMemNo);
	}

	@Override
	public List<IndustryVO> selectIndustryList() {
		return comInfoDao.selectIndustryList();
	}

	@Override
	public List<NationVO> selectNationList() {
		return comInfoDao.selectNationList();
	}

	@Override
	public List<RegionVO> selectRegionList(String nationCode) {
		return comInfoDao.selectRegionList(nationCode);
	}

	@Override
	public List<ComSizeInfoVO> selectComSizeList() {
		return comInfoDao.selectComSizeList();
	}

	@Override
	public int insertComInfo(ComInfoVO comInfoVo) {
		//comCode 처리를 서비스에서 해줍시다..가 아니고 mapper에서 해줘보자
		return comInfoDao.insertComInfo(comInfoVo);
	}
	
}
