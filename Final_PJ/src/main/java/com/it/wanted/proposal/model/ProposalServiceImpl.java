package com.it.wanted.proposal.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProposalServiceImpl implements ProposalService{

	@Autowired ProposalDAO proposalDao;

	@Transactional
	@Override
	public int insertProposal(ProposalVO propoVo) {
		int result=-1;
		//카운트를 받아서
		int count=proposalDao.checkProposalCount(propoVo);
		
		if(count==0) { //카운트가 없으면
			result=proposalDao.insertProposal(propoVo);
		}
		
		return result;
	}
	
}
