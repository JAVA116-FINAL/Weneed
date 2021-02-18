package com.it.wanted.main.search.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.position.model.PosNewVO;

@Service
public class MainSearchServiceImpl implements MainSearchService {

	@Autowired MainSearchDAO mainSearchDao;

	@Override
	public List<MainSearchVO> searchComInfo(String keyword) {
		return mainSearchDao.searchComInfo(keyword);
	}

	@Override
	public List<MainSearchVO> searchPosition(String keyword) {
		return mainSearchDao.searchPosition(keyword);
	}

	@Override
	public List<MainSearchVO> getSearchKeyword(String keyword) {
		return mainSearchDao.getSearchKeyword(keyword);
	}

	@Override
	public List<MainSearchVO> selectNewRecruit() {
		return mainSearchDao.getNewRecruit();
	}

	@Override
	public List<ProgramVO> selectMainCareerList() {
		return mainSearchDao.getMainCareerList();
	}

	@Override
	public List<PosNewVO> selectMainNewPos() {
		return mainSearchDao.getMainPosList();
	}
	
}
