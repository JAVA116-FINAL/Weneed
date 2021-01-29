package com.it.wanted.link.model;

public interface LinkService {

	public int insertLink(LinkVO linkVo);
	public LinkVO selectLink(int resumeNo);
	public int deleteLink(int linkNo);
}
