package com.it.wanted.comimginfo.model;

import java.util.List;

public interface ComImgInfoService {

	List<ComImgInfoVO> selectAllImg(String comCode);
	int insertImg(ComImgInfoVO imgVo);
	int deleteImg(String imgFileName);
	List<ComImgInfoVO> selectAllImage();
	int changeStatustoPass(int imgNo);
}
