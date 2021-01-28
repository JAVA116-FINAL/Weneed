package com.it.wanted.matchup.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.matchup.model.MatchupMemService;

@Controller
@RequestMapping("/matchupMem")
public class MatchupMemController {
	private static final Logger logger=LoggerFactory.getLogger(MatchupMemController.class);
	@Autowired
	private MatchupMemService matchupService;
	
	@RequestMapping("/matchupMemList.do")
	public String machupList() {
		logger.info("machupList 화면 보여주기");
		return "matchupMem/matchupMemList";
	}
	
	@RequestMapping("/matchupMemRegister.do")
	public String machupEdit() {
		logger.info("machupRegister 화면 보여주기");
		return "matchupMem/matchupMemRegister";
	}
	
	@RequestMapping("/matchupMemIntro.do")
	public String matchupIntro() {
		logger.info("matchupIntr 화면 보여주기");
		return "matchupMem/matchupMemIntro";
	}
	
	
}
