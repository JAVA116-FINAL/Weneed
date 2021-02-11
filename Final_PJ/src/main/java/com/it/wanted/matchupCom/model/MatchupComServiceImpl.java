package com.it.wanted.matchupCom.model;

import java.math.BigDecimal;
import java.util.Map;
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
	public Map<String, Object> hasMatchup(String comCode) {
		//이 메소드가 해야 할 일
		//[1] 매치업 기업에 있는지 확인한다
		int cnt=matchupComDao.checkListedMatchup(comCode);
		System.out.println("매치업 기업에 있는지 확인한 cnt="+cnt);
		Map<String, Object> resultMap=null;
		
		//[2] 매치업 기업에 있으면 날짜가 지났는지, 카운트는 남았는지 확인한다. 
		if(cnt>0) {
			resultMap=matchupComDao.isOverMatchup(comCode);
			System.out.println("resultMap: "+resultMap);
			if(Integer.parseInt(String.valueOf(resultMap.get("LEFTDATE"))) > 0 
					&& Integer.parseInt(String.valueOf(resultMap.get("LEFTCOUNT"))) > 0) {
				resultMap.put("HASMATCHUP", 1);
			}else {
				resultMap.put("LEFTDATE", 0);
				resultMap.put("LEFTCOUNT", 0);
			}
		}
		return resultMap;
	}
}
