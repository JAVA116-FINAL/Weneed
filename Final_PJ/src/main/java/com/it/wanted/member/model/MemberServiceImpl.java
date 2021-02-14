package com.it.wanted.member.model;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
        String encodedPassword = new BCryptPasswordEncoder().encode(pwd);
        
		int result = 0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=EMAIL_NONE;
		}else {
			if(!encodedPassword.matches(pwd)) {
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

	@Override
	public void sendEmail(MemberVO vo, String div) {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; 
		String hostSMTPid = "weneedinfoteam@gmail.com";//서버 이메일 주소(보내는 사람 이메일 주소)
		String hostSMTPpwd = "dnlslem123";//서버 이메일 비번(보내는 사람 이메일 비번)

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "weneedinfoteam@gmail.com";//보내는 사람 이메일주소(받는 사람 이메일에 표시됨)
		String fromName = "위니드";//프로젝트이름 또는 보내는 사람 이름
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "위니드 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += "임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	@Override
	public void findPwd(HttpServletResponse response, MemberVO vo) {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = memberDao.selectMember(vo.getEmail());
		//PrintWriter out = response.getWriter();
		// 가입된 이메일이 아니면
		if(!vo.getEmail().equals(ck.getEmail())) {
			System.out.println("등록되지 않은 이메일입니다.");
			System.out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setPwd(pw);
			// 비밀번호 변경
			memberDao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			System.out.println("이메일로 임시 비밀번호를 발송하였습니다.");
			System.out.close();
		}
	}

	@Override
	public int withdrawMember(String email) {
		return memberDao.withdrawMember(email);
	}

	@Override
	public void resetPwd(HttpServletResponse response, MemberVO vo) {
			response.setContentType("text/html;charset=utf-8");
			//memberDao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail2(vo, "resetpw");

			System.out.println("이메일로 비밀번호 재설정 링크를 발송하였습니다.");
			System.out.close();
	}

	@Override
	public void sendEmail2(MemberVO vo, String div) {
		// Mail Server 설정
				String charSet = "utf-8";
				String hostSMTP = "smtp.gmail.com"; 
				String hostSMTPid = "weneedinfoteam@gmail.com";//서버 이메일 주소(보내는 사람 이메일 주소)
				String hostSMTPpwd = "dnlslem123";//서버 이메일 비번(보내는 사람 이메일 비번)

				// 보내는 사람 EMail, 제목, 내용
				String fromEmail = "weneedinfoteam@gmail.com";//보내는 사람 이메일주소(받는 사람 이메일에 표시됨)
				String fromName = "위니드";//프로젝트이름 또는 보내는 사람 이름
				String subject = "";
				String msg = "";

				if(div.equals("resetpw")) {
					subject = "[위니드] 비밀번호 초기화";
					msg += "<div align='center' style='border:1px solid black; font-family:verdana;padding-bottom:30px'>";
					msg += "<h3 style='color: blue;margin-top:20px;margin-bottom:40px'>";
					msg += "비밀번호를 재설정하시려면 하단의 '비밀번호 재설정'을 클릭하세요.</h3>";
					msg += "<a href='http://localhost:9090/Final_PJ/profileSetting/passwordChange.do' style='background-color:#3366ff;font-size:15px;border-radius:4px;padding:15px 25px;color:#fff; text-decoration:none;'>비밀번호 재설정</a></div>";
				}

				// 받는 사람 E-Mail 주소
				String mail = vo.getEmail();
				try {
					HtmlEmail email = new HtmlEmail();
					email.setDebug(true);
					email.setCharset(charSet);
					email.setSSL(true);
					email.setHostName(hostSMTP);
					email.setSmtpPort(465);

					email.setAuthentication(hostSMTPid, hostSMTPpwd);
					email.setTLS(true);
					email.addTo(mail, charSet);
					email.setFrom(fromEmail, fromName, charSet);
					email.setSubject(subject);
					email.setHtmlMsg(msg);
					email.send();
				} catch (Exception e) {
					System.out.println("메일발송 실패 : " + e);
				}
	}
	
}

















