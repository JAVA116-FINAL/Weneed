package com.it.wanted.career.detail.model;

import com.it.wanted.member.model.MemberVO;

public interface CareerSubsDAO {

	public int insertSubs(CareerSubsVO subsVo);

	public MemberVO selectMemberNameSub(String email);

}
