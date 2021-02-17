package com.it.wanted.mybookmark.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MybookmarkServiceImpl implements MybookmarkService{

	@Autowired MybookmarkDAO mybookmarkDao;

	@Override
	public int isBookmark(MybookmarkVO mybookmarkVo) {
		return mybookmarkDao.isBookmark(mybookmarkVo);
	}

	@Override
	public int insertBookmark(MybookmarkVO mybookmarkVo) {
		return mybookmarkDao.insertBookmark(mybookmarkVo);
	}

	@Override
	public int deleteBookmark(MybookmarkVO mybookmarkVo) {
		return mybookmarkDao.deleteBookmark(mybookmarkVo);
	}
	
}
