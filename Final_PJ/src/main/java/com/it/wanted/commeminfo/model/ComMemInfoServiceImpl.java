package com.it.wanted.commeminfo.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class ComMemInfoServiceImpl implements ComMemInfoService{
	
	@Autowired ComMemInfoDAO comMemDao;

	/*
	 * @Autowired //필드 인젝션은 권장하는 방법이 아니라 안될 때도 있음, 그러면 생성자로 주입받아야 한다 public
	 * ComMemInfoServiceImpl(BCryptPasswordEncoder pwdEncoder) { this.pwdEncoder =
	 * pwdEncoder; }
	 */
	@Override
	public int loginCheck(String comMemId, String comMemLoginPwd) {
		int result=0;
		int cnt=comMemDao.checkId(comMemId); //일단 아이디가 있는 아이디인지 체크한다
		if(cnt<1) { //없는 아이디다
			result=ID_NONE_EXIST;
		}else{ //있는 아이디다
			//그러면 일단 디비에서 비밀번호를 가꼬와
			String dbPwd=comMemDao.selectPwd(comMemId); //해당 아이디의 비밀번호를 가져온다 
			
			//테스트계정을 위한.. 분기처리.. 
			if(dbPwd.equals("1")) { //가져온 비번이 1이면 테스트계정
				if(comMemLoginPwd.equals(dbPwd)) { //비밀번호도 일치하면 로그인 성공
					result=LOGIN_SUCCESS;
				}else {
					result=PWD_MISMATCH; //비밀번호 땡 틀렸습니다
				}
			}else {
				//아니면 디코딩한 패스워드와 비교해야 하는 계정
				boolean pwdCheck=new BCryptPasswordEncoder().matches(comMemLoginPwd, dbPwd);
				if(pwdCheck) {
					result=LOGIN_SUCCESS;
				}else {
					result=PWD_MISMATCH;
				}
			}
		}
		return result;
	}

	@Override
	public int joinComMem(ComMemInfoVO vo) {
		int result=0;
		System.out.println("vo="+vo);
		//비밀번호 암호화
		String encodedPwd=new BCryptPasswordEncoder().encode(vo.getComMemPwd());
		System.out.println("암호화된 패스워드: "+encodedPwd);
		vo.setComMemPwd(encodedPwd);
		//아이디 중복체크
		int cnt=comMemDao.checkId(vo.getComMemId());
		if(cnt<1) { //없는 아이디다
			result=comMemDao.joinComMem(vo); //성공하면 카운트 1이겠지
		}else { //있는 아이디다
			result=ID_EXIST;
		}
		//메일인증 나중에 생각할까.. 이번에 또 해야하나.. 할까.. 말까.. 
		
		return result;
	}

	@Override
	public ComMemInfoVO selectComMem(String comMemLoginId) {
		return comMemDao.selectComMem(comMemLoginId);
	}
	
}
