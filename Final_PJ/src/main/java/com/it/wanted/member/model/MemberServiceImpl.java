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
			result=NON_EXIST_EMAIL;	//해당 아이디 없음
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
	
}
