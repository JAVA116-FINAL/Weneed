package com.it.wanted.comimginfo.model;

import java.util.List;

public interface ComImgInfoDAO {

	int selectRegedImgCnt(String comCode);
	List<ComImgInfoVO> selectAllImg(String comCode);

}
