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

	@Override
	public boolean hasMatchup(String comCode) {
		//이 메소드가 해야 할 일
		//[1] 매치업 기업에 있는지 확인한다
		//[2] 매치업 기업에 있으면 날짜가 지났는지 확인한다. 어떻게? 오늘날짜와 비교. 
		
		return false;
	}
	
	
}
