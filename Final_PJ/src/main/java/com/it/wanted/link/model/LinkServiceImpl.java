package com.it.wanted.link.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LinkServiceImpl implements LinkService{

	@Autowired
	private LinkDAO linkDao;
	
	@Override
	public int insertLink(LinkVO linkVo) {
		return linkDao.insertLink(linkVo);
	}

	@Override
	public LinkVO selectLink(int resumeNo) {
		return linkDao.selectLink(resumeNo);
	}

	@Override
	public int deleteLink(int linkNo) {
		return linkDao.deleteLink(linkNo);
	}

}
