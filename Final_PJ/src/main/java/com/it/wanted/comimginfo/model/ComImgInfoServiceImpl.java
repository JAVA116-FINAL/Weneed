package com.it.wanted.comimginfo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.common.SearchVO;

@Service
public class ComImgInfoServiceImpl implements ComImgInfoService{
	@Autowired ComImgInfoDAO comImgInfoDao;

	@Override
	public List<ComImgInfoVO> selectAllImg(String comCode) {
		return comImgInfoDao.selectAllImg(comCode);
	}

	@Override
	public int insertImg(ComImgInfoVO imgVo) {
		return comImgInfoDao.insertImg(imgVo);
	}

	@Override
	public int deleteImg(String imgFileName) {
		return comImgInfoDao.deleteImg(imgFileName);
	}

	@Override
	public List<ComImgInfoVO> selectAllImage() {
		return comImgInfoDao.selectAllImage();
	}

	@Override
	public int changeStatustoPass(int imgNo) {
		return comImgInfoDao.changeStatustoPass(imgNo);
	}

	@Override
	public List<ComImgInfoVO> selectAllYetImg(SearchVO searchVo) {
		return comImgInfoDao.selectAllYetImg(searchVo);
	}

	@Override
	public int selectYetTotalRecord(SearchVO searchVo) {
		return comImgInfoDao.selectYetTotalRecord(searchVo);
	}

	@Override
	public List<ComImgInfoVO> selectAllPassedImg(SearchVO searchVo2) {
		return comImgInfoDao.selectAllPassedImg(searchVo2);
	}

	@Override
	public int selectPassedTotalRecord(SearchVO searchVo2) {
		return comImgInfoDao.selectPassedTotalRecord(searchVo2);
	}

	@Override
	public int selectPassedCntByComCode(String comCode) {
		return comImgInfoDao.selectPassedCntByComCode(comCode);
	}
	
}
