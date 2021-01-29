package com.it.wanted.link.model;

public interface LinkDAO {
	public int insertLink(LinkVO linkVo);
	public LinkVO selectLink(int resumeNo);
	public int deleteLink(int linkNo);
	public int updateLink(LinkVO linkVo);
}
