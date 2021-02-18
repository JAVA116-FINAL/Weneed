package com.it.wanted.career.detail.model;

import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.member.model.MemberVO;

public interface CareerSubsService {

	public int insertSubs(CareerSubsVO subsVo);

	public MemberVO selectMemberNameSub(String email);

	public ProgramVO selectProgramInfo(int programNo);

}
