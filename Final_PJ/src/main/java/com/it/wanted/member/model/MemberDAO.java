package com.it.wanted.member.model;

public interface MemberDAO {
	public int insertMember(MemberVO vo);
	public int checkEmail(String email);
	public int checkHp(String hp);
}
