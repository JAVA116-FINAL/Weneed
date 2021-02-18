package com.it.wanted.member.model;

import javax.servlet.http.HttpServletResponse;

public interface MemberService {
	//이메일 중복확인시 사용
	public static final int EXIST_EMAIL=1; //이메일이 이미 존재하는 경우
	public static final int NON_EXIST_EMAIL=2; //존재하지 않는 경우
	
	//휴대폰 중복확인시 사용
	public static final int EXIST_HP=1; //휴대폰번호가 이미 존재하는 경우
	public static final int NON_EXIST_HP=2;	//존재하지 않는 경우
	
	//로그인 처리시 사용
	public static final int LOGIN_OK=1;	//로그인 성공
	public static final int EMAIL_NONE=2;	//아이디가 없는 경우
	public static final int PWD_DISAGREE=3;	//비밀번호 불일치
	
	public int insertMember(MemberVO vo);
	public int checkEmail(String email);
	public int checkHp(String hp);
	public int loginCheck(String email, String pwd);
	public MemberVO selectMember(String email);
	public int checkLoginEmail(String email);
	
	//이메일 발송
	public void sendEmail(MemberVO vo, String div);
	
	//비밀번호 찾기
	public void findPwd(HttpServletResponse response, MemberVO vo);
	
	//비밀번호 재설정
	public void resetPwd(HttpServletResponse response, MemberVO vo);
	public void sendEmail2(MemberVO vo, String div);
	
	//회원탈퇴
	public int withdrawMember(String email);
	
	//비밀번호 재설정2
	public int updatePwd(String pwd);
	
	//0218자연
	public int updateMemInfobyMemNo(MemberVO memberVo);
	public int updateMemberImg(MemberVO memberVo);
}
