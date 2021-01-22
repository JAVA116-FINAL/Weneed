package com.it.wanted.commeminfo.model;

public interface ComMemInfoDAO {
	int checkId(String comMemId);
	String selectPwd(String comMemId);
	int selectMemNo(String comMemId);
	int joinComMem(ComMemInfoVO vo);
}
