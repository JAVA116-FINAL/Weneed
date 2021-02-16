package com.it.wanted.comimginfo.model;

import java.util.List;

import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.common.SearchVO;

public interface ComImgInfoService {

	List<ComImgInfoVO> selectAllImg(String comCode);
	int insertImg(ComImgInfoVO imgVo);
	int deleteImg(String imgFileName);
	List<ComImgInfoVO> selectAllImage();
	int changeStatustoPass(int imgNo);
	List<ComImgInfoVO> selectAllYetImg(SearchVO searchVo);
	int selectYetTotalRecord(SearchVO searchVo);
	List<ComImgInfoVO> selectAllPassedImg(SearchVO searchVo2);
	int selectPassedTotalRecord(SearchVO searchVo2);
}
