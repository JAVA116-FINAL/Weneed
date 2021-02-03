package com.it.wanted.member.model;

public interface MemberDAO {
	public int insertMember(MemberVO vo);
	public int checkEmail(String email);
	public int checkHp(String hp);
	public String selectPwd(String email);
	public MemberVO selectMember(String email);
	public int checkLoginEmail(String email);
	public int updatePw(MemberVO vo);
	
}
