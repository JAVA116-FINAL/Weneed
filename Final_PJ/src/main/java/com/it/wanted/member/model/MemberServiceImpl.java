package com.it.wanted.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO vo) {
		int cnt = memberDao.insertMember(vo);
		return cnt;
	}
	
}
