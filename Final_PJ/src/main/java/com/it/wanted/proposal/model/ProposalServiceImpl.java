package com.it.wanted.proposal.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.wanted.matchup.model.MatchupMemDAO;
import com.it.wanted.matchup.model.MatchupMemVO;
import com.it.wanted.matchupCom.model.MatchupComDAO;
import com.it.wanted.matchupCom.model.MatchupComVO;
import com.it.wanted.matchupStatus.model.MatchupStatusDAO;
import com.it.wanted.matchupStatus.model.MatchupStatusVO;

@Service
public class ProposalServiceImpl implements ProposalService{

	@Autowired ProposalDAO proposalDao;
	@Autowired MatchupStatusDAO matchupStatusDao;
	@Autowired MatchupMemDAO matchupMemDao;
	@Autowired MatchupComDAO matchupComDao;

	@Transactional
	@Override
	public int insertProposal(ProposalVO propoVo) {
		int result=-1;
		//카운트를 받아서
		int count=proposalDao.checkProposalCount(propoVo);
		System.out.println("제안한 적 있는지 count="+count);
		if(count==0) { //카운트가 없으면
			result=proposalDao.insertProposal(propoVo);
			
			//상태도 업데이트
			MatchupStatusVO statusVo=new MatchupStatusVO();
			MatchupComVO comVo =matchupComDao.selectMatchupCom(propoVo.getComCode());
			int mcucomNo=comVo.getMcucomNo();
			System.out.println("mcucomNo: "+mcucomNo);
			MatchupMemVO memVo=matchupMemDao.selectMcuMem(propoVo.getMemNo());
			int mcumemNo=memVo.getMcumemNo();
			System.out.println("mcumemNo: "+mcumemNo);
			
			statusVo.setMcucomNo(mcucomNo);
			statusVo.setMcumemNo(mcumemNo);
			
			int cnt = matchupStatusDao.checkStatusCount(statusVo);
			
			if(cnt>0) { //이미 있는 현황이라면 (이력서를 열람만 한 상태)
				matchupStatusDao.updateProposalDate(statusVo);
				System.out.println("이력서 열람 후 제안했음");
			}else { //아예 처음 보고 바로 제안하는 상태, 인서트와 일자업뎃 동시에
				matchupStatusDao.insertProposal(statusVo);
				System.out.println("이력서 열람과 동시에 제안했음");
			}
			System.out.println("제안일자까지 업데이트 완료");
		}
		
		return result;
	}
	
}
