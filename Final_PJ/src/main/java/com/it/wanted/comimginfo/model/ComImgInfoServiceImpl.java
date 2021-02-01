package com.it.wanted.comimginfo.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
}
