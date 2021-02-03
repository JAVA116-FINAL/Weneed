package com.it.wanted.matchupCom.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchupComServiceImpl implements MatchupComService{
	
	@Autowired MatchupComDAO matchupComDao;

	@Override
	public int addZzim(MatchupZzimVO zzimVo) {
		return matchupComDao.addZzim(zzimVo);
	}

	@Override
	public int isZzimed(MatchupZzimVO zzimVo) {
		return matchupComDao.isZzimed(zzimVo);
	}

	@Override
	public int delZzim(MatchupZzimVO zzimVo) {
		return matchupComDao.delZzim(zzimVo);
	}
}
