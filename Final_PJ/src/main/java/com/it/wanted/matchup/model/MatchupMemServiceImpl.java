package com.it.wanted.matchup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchupMemServiceImpl implements MatchupMemService{
	
	@Autowired MatchupMemDAO matchupMemDao;
	
	@Override
	public List<MatchupMemVO> selectOpen() {
		return matchupMemDao.selectOpen();
	}
	
	
}
