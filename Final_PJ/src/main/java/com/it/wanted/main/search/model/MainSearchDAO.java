package com.it.wanted.main.search.model;

import java.util.List;
import java.util.Map;

public interface MainSearchDAO {

	List<MainSearchVO> searchComInfo(String keyword);

	List<MainSearchVO> searchPosition(String keyword);

	List<Map<String, Object>> getSearchKeyword(String keyword);

}
