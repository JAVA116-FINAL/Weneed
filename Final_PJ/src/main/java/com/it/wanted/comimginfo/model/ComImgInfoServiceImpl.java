package com.it.wanted.comimginfo.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComImgInfoServiceImpl implements ComImgInfoService{
	@Autowired ComImgInfoDAO comImgInfoDao;
	
}
