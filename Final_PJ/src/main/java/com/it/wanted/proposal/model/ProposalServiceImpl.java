package com.it.wanted.proposal.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProposalServiceImpl implements ProposalService{

	@Autowired ProposalDAO proposalDao;
	
}
