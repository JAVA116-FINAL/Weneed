package com.it.wanted.mybookmark.model;

public interface MybookmarkService {
	public int isBookmark(MybookmarkVO mybookmarkVo);
	public int insertBookmark (MybookmarkVO mybookmarkVo);
	public int deleteBookmark (MybookmarkVO mybookmarkVo);
}
