package com.it.wanted.mybookmark;

public interface MybookmarkDAO {

	public int isBookmark(MybookmarkVO mybookmarkVo);
	public int insertBookmark (MybookmarkVO mybookmarkVo);
	public int deleteBookmark (MybookmarkVO mybookmarkVo);
}
