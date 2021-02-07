package com.it.wanted.matchupmemjikmu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchupMemjikmuServiceImpl implements MatchupMemjikmuService{

	@Autowired private MatchupMemjikmuDAO mmjikmuDao;
}
