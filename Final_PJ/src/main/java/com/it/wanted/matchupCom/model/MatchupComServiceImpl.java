package com.it.wanted.matchupCom.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchupComServiceImpl implements MatchupComService{
	
	@Autowired MatchupComDAO matchupComDao;
}
