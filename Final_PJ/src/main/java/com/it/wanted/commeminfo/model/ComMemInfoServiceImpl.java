package com.it.wanted.commeminfo.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComMemInfoServiceImpl implements ComMemInfoService{
	
	@Autowired ComMemInfoDAO comMemDao;

	@Override
	public int loginCheck(String comMemId, String comMemPwd) {
		int result=0;
		int cnt=comMemDao.checkId(comMemId); //일단 아이디가 있는 아이디인지 체크한다
		if(cnt<1) { //없는 아이디다
			result=ID_NONE_EXIST;
		}else{ //있는 아이디다
			//그러면 비밀번호를 가꼬와
			String dbPwd=comMemDao.selectPwd(comMemId); //해당 아이디의 비밀번호를 가져온다 
			if(comMemPwd.equals(dbPwd)) { //비밀번호도 일치하면 로그인 성공
				result=LOGIN_SUCCESS;
			}else {
				result=PWD_MISMATCH; //비밀번호 땡 틀렸습니다
			}
		}
		return result;
	}

	@Override
	public int joinComMem(ComMemInfoVO vo) {
		//아이디 중복체크
		int result=0;
		int cnt=comMemDao.checkId(vo.getComMemId());
		if(cnt<1) { //없는 아이디다
			result=comMemDao.joinComMem(vo); //성공하면 카운트 1이겠지
		}else { //있는 아이디다
			result=ID_EXIST;
		}
		//메일인증 나중에 생각할까.. 이번에 또 해야하나.. 할까.. 말까.. 
		
		return result;
	}
	
}
