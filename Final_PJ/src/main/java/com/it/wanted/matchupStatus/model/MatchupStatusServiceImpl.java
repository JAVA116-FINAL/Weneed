package com.it.wanted.matchupStatus.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.wanted.common.SearchVO;
import com.it.wanted.matchup.model.MatchupMemDAO;
import com.it.wanted.matchupCom.model.MatchupComDAO;

@Service
public class MatchupStatusServiceImpl implements MatchupStatusService{
	
	@Autowired MatchupStatusDAO matchupStatusDao;
	@Autowired MatchupComDAO matchupComDao;
	@Autowired MatchupMemDAO matchupMemDao;
	
	@Transactional
	@Override
	public int updateStatus(int resumeNo, String comCode) {
		int result=0;
		
		//일단 매치업멤넘, 컴넘을 가져와서 vo에 세팅한다
		int mcucomNo=matchupComDao.selectMatchupCom(comCode).getMcucomNo();
		int mcumemNo=matchupMemDao.selectMcumemNo(resumeNo);
		MatchupStatusVO statusVo=new MatchupStatusVO();
		statusVo.setMcucomNo(mcucomNo);
		statusVo.setMcumemNo(mcumemNo);
		
		//레주메 맥스카운트와 리드카운트를 비교해서 개수가 얼마나 남았나 확인부터
		int check=matchupComDao.checkResumeReadCount(mcucomNo);
		System.out.println("이력서 조회 카운트 비교 결과 check="+check);
		
		if(check > 0) { //1개라도 남았으면 둘이 들어있는 status가 있는지 확인한다 
			int cnt=matchupStatusDao.checkStatusCount(statusVo);
			
			if(cnt==0) { //없으면 인서트하고 열람횟수 1개 까인다
				int insert=matchupStatusDao.insertStatus(statusVo);
				System.out.println("matchupStatus에 없는 정보라 insert됨, insert="+insert);
				cnt=matchupComDao.updateResumeReadCount(mcucomNo);
				System.out.println("열람권 차감, cnt="+cnt);
				result=MatchupStatusService.RESUMECNT_REDUCED;
			}else { //있으면 이미 읽은 상세이력서다
				result=MatchupStatusService.RESUMECNT_READ;
			}
		}else { //카운트 다 쓴 경우 
			result=MatchupStatusService.RESUMECNT_OVER;
		}
		
		return result;
	}

	/* 0216자연 */
	@Override
	public List<Map<String, Object>> selectMatchupStatusbyAdmin(SearchVO searchVo) {
		return matchupStatusDao.selectMatchupStatusbyAdmin(searchVo);
	}

	@Override
	public int selectTotalRecordbyAdmin(SearchVO searchVo) {
		return matchupStatusDao.selectTotalRecordbyAdmin(searchVo);
	}
	
}
