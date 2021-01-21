package com.it.wanted.member.model;

public interface MemberService {
	//이메일 중복확인시 사용
	public static final int EXIST_EMAIL=1; //이메일이 이미 존재하는 경우
	public static final int NON_EXIST_EMAIL=2; //존재하지 않는 경우
	
	//휴대폰 중복확인시 사용
	public static final int EXIST_HP=1; //휴대폰번호가 이미 존재하는 경우
	public static final int NON_EXIST_HP=2;	//존재하지 않는 경우
	
	public int insertMember(MemberVO vo);
	public int checkEmail(String email);
	public int checkHp(String hp);
}
