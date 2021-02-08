package com.it.wanted.commeminfo.model;

public interface ComMemInfoService {
	//아이디 중복검사, 로그인 체크
	public final static int ID_NONE_EXIST=1; //없는 아이디
	public final static int ID_EXIST=2; //있는 아이디
	public final static int PWD_MISMATCH=3; //아이디는 있으나 비밀번호 불일치 
	public final static int LOGIN_SUCCESS=4; //로그인 성공
	
	int loginCheck(String comMemId, String comMemLoginPwd);
	int joinComMem(ComMemInfoVO vo);
	ComMemInfoVO selectComMem(String comMemId);
}
