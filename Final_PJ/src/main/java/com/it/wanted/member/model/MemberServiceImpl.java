package com.it.wanted.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDao;

	public int insertMember(MemberVO vo) {
		int cnt = memberDao.insertMember(vo);
		return cnt;
	}

	public int checkEmail(String email) {
		int cnt = memberDao.checkEmail(email);
		
		int result = 0;
		if(cnt>0) {
			result=EXIST_EMAIL; //이미 해당 이메일 존재
		}else {
			result=NON_EXIST_EMAIL;	//해당 이메일 없음
		}
		
		return result;
	}

	public int checkHp(String hp) {
		int cnt = memberDao.checkHp(hp);
		
		int result = 0;
		if(cnt>0) {
			result=EXIST_HP; //이미 해당 휴대폰번호 존재
		}else {
			result=NON_EXIST_HP; //해당 휴대폰번호 없음
		}
		
		return result;
	}

	public int loginCheck(String email, String pwd) {
		String dbPwd = memberDao.selectPwd(email);
		
		int result = 0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=EMAIL_NONE;
		}else {
			if(dbPwd.equals(pwd)) {
				result=LOGIN_OK;
			}else {
				result=PWD_DISAGREE;
			}
		}
		return result;
	}
	
	public MemberVO selectMember(String email) {
		return memberDao.selectMember(email);
	}

	public int checkLoginEmail(String email) {
		int cnt = memberDao.checkLoginEmail(email);
		
		int result = 0;
		if(cnt>0) {
			result=LOGIN_OK; //해당 이메일 존재
		}else {
			result=EMAIL_NONE;	//해당 이메일 없음
		}
		
		return result;
	}
	
}

















