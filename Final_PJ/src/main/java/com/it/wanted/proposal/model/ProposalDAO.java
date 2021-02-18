package com.it.wanted.proposal.model;

public interface ProposalDAO {

	int insertProposal(ProposalVO propoVo);
	int checkProposalCount(ProposalVO propoVo);

}
