package com.it.wanted.comimginfo.model;

import java.util.List;

public interface ComImgInfoDAO {

	int selectRegedImgCnt(String comCode);
	List<ComImgInfoVO> selectAllImg(String comCode);
	int insertImg(ComImgInfoVO imgVo);
	int deleteImg(String imgFileName);
	List<ComImgInfoVO> selectAllImage();
	int changeStatustoPass(int imgNo);

}
