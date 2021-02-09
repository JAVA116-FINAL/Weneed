package com.it.wanted.main.search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonArray;
import com.it.wanted.common.SearchVO;
import com.it.wanted.main.search.model.MainSearchService;
import com.it.wanted.main.search.model.MainSearchVO;

@Controller
@RequestMapping("/mainSearch")
public class MainSearchController {
	private static final Logger logger
		= LoggerFactory.getLogger(MainSearchController.class);
	
	@Autowired private MainSearchService mainSearchService;
	
	@RequestMapping("/search.do")
	public String searchKeyword(@RequestParam String keyword,HttpServletRequest request, Model model) {
		logger.info("검색페이지, 파라미터 keyword={}", keyword);
		
		List<MainSearchVO> list1 = mainSearchService.searchComInfo(keyword);
		List<MainSearchVO> list2 = mainSearchService.searchPosition(keyword);
		logger.info("회사로 검색 , 결과 list1.size={}", list1.size());
		logger.info("포지션으로 검색 , 결과 list2.size={}", list2.size());
		
		model.addAttribute("searchCom", list1);
		model.addAttribute("searchPos", list2);
		
		return "mainSearch/search";
	}
	
	@ResponseBody
	@RequestMapping("/autocomplete.do")
	public List<Map<String, Object>> AutoTest(@RequestParam(value="keyword") String keyword, Locale locale, HttpServletRequest request, 
			HttpServletResponse response, MainSearchVO vo){
		logger.info("keyword={}", keyword);
		
		List<Map<String, Object>> list3 = mainSearchService.getSearchKeyword(keyword);
		logger.info("list3={}", list3);
		logger.info("keyword가 포함된 결과 list3.size={}", list3.size());
		
		return list3;
	}
}
