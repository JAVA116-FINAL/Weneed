package com.it.wanted.main.search.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Map<String, Object>> getSearchKeyword(String keyword) {
		return mainSearchDao.getSearchKeyword(keyword);
	}
	
}
