package com.it.wanted.proposal.model;

public interface ProposalService {

	int insertProposal(ProposalVO propoVo);
	public int proposalCountbyMemNo(int memNo);

}
