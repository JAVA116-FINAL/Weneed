package com.it.wanted.matchupmemjikmu.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchupMemjikmuServiceImpl implements MatchupMemjikmuService{

	@Autowired private MatchupMemjikmuDAO mmjikmuDao;

	@Override
	public List<MatchupMemJikmuVO> selectMcuMemjikmubyexpertiseNo(int expertiseNo) {
		return mmjikmuDao.selectMcuMemjikmubyexpertiseNo(expertiseNo);
	}
	@Override
	public List<Map<String, Object>> selectMjikmuView(int expertiseNo) {
		return mmjikmuDao.selectMjikmuView(expertiseNo);
	}

	
}
