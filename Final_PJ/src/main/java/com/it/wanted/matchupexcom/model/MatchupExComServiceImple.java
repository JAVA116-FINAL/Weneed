package com.it.wanted.matchupexcom.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchupExComServiceImple implements MatchupExComService{
	@Autowired MatchupExComDAO matchupexcomDao;
	
	@Override
	public int insertMatchupExCom(MatchupExComVO matchupexcomVo) {
		//1 매치업제외기업으로 등록됐느지 확인
		int count=matchupexcomDao.selecMahuprgisterCheckCount(matchupexcomVo);
		//2
		int cnt=-1;
		if(count<1) {
			cnt=matchupexcomDao.insertMatchupExCom(matchupexcomVo);
		}
		//3
		return cnt;
	}

	@Override
	public int deleteMatchuoExcom(MatchupExComVO matchupexcomVo) {
		return matchupexcomDao.deleteMatchuoExcom(matchupexcomVo);
	}

	@Override
	public Map<String, Object> selectExcomView(MatchupExComVO matchupexcomVo) {
		return matchupexcomDao.selectExcomView(matchupexcomVo);
	}

	
	
}
