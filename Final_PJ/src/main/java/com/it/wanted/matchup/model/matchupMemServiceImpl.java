package com.it.wanted.matchup.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class matchupMemServiceImpl implements matchupMemService{
	@Autowired
	private matchupMemDAO matchupMemDao;
	
}
