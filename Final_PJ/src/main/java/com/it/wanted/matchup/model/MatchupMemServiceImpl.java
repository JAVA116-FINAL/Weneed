package com.it.wanted.matchup.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchupMemServiceImpl implements MatchupMemService{
	
	@Autowired 
	private MatchupMemDAO matchupMemDao;
	
	@Override
	public List<MatchupMemVO> selectOpen() {
		return matchupMemDao.selectOpen();
	}

	/* 자연 */
	@Override
	public int selectmcuResumeNo(int memNo) {
		return matchupMemDao.selectmcuResumeNo(memNo);
	}

	
}
