package com.it.wanted.main.search.model;

import java.util.List;
import java.util.Map;

public interface MainSearchService {

	List<MainSearchVO> searchComInfo(String keyword);

	List<MainSearchVO> searchPosition(String keyword);

	List<MainSearchVO> getSearchKeyword(String keyword);

}
