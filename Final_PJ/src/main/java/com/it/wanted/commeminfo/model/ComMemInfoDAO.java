package com.it.wanted.commeminfo.model;

public interface ComMemInfoDAO {
	int checkId(String userid);
	String selectPwd(String comMemId);
	int selectMemNo(String comMemId);
}
