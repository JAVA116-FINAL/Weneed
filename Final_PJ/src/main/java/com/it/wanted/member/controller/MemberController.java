package com.it.wanted.member.controller;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger
		= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MemberService memberService;
	@Autowired BCryptPasswordEncoder pwdEncoder;
	
	@ResponseBody
	@RequestMapping(value="/memberJoin.do")
	public boolean memberJoin(@ModelAttribute MemberVO vo, Model model) {
		//1.
		logger.info("회원가입 처리 파라미터 vo ={}", vo);
		
		//2.
		boolean bool = false;
		String inputPass = vo.getPwd();
		String pwd = pwdEncoder.encode(inputPass);
		vo.setPwd(pwd);
		int cnt = memberService.insertMember(vo);
		logger.info("회원가입 결과, cnt={}", cnt);
		if(cnt>0) { //회원가입 성공
			bool = true;
		}
		
		//4.
		return bool;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckEmail.do")
	public boolean ajaxCheckEmail(@RequestParam String email) {
		logger.info("ajax 이용 - 이메일 중복 확인, email={}", email);
		
		boolean bool = false;
		int result = memberService.checkEmail(email);
		logger.info("이메일 중복확인 결과, result={}", result);
		if(result==MemberService.EXIST_EMAIL) {
			bool = true; //이미 존재
		}else if(result==MemberService.NON_EXIST_EMAIL) {
			bool= false; //사용 가능
		}
		
		return bool;
	}
	
	@ResponseBody
	@RequestMapping("/ajaxCheckHp.do")
	public boolean ajaxCheckHp(@RequestParam String hp) {
		logger.info("ajax 이용 - 휴대폰 유효성 검사, hp={}", hp);
		
		boolean bool = false;
		int result = memberService.checkHp(hp);
		logger.info("휴대폰 번호 중복확인 결과, result={}", result);
		if(result==MemberService.EXIST_HP) {
			bool = true; //이미 존재
		}else if(result==MemberService.NON_EXIST_HP) {
			bool = false; //사용 가능
		}
		
		return bool;
	}
	
	@ResponseBody
	@RequestMapping(value="/memberLogin.do",produces = "application/text; charset=utf-8")
	public String memberLogin(@ModelAttribute MemberVO vo,
			HttpServletRequest request, HttpServletResponse response, Model model) {
		//1.
		logger.info("로그인 처리 파라미터 vo ={}", vo);
		
		//2.
		int result = memberService.loginCheck(vo.getEmail(), vo.getPwd());
		logger.info("로그인 처리 결과, result={}", result);
		
		MemberVO memVo = null;
		
		String name = "";
		if(result==MemberService.LOGIN_OK) {
			memVo =memberService.selectMember(vo.getEmail());
			
			//[1] session
			HttpSession session = request.getSession();
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("name", memVo.getName());
			session.setAttribute("mem_no", memVo.getMemNo());
			session.setAttribute("fileName", memVo.getFileName());
			
			logger.info("Session={}", session.getAttribute("email"));
			logger.info("Session={}", session.getAttribute("name"));
			logger.info("Session={}", session.getAttribute("mem_no"));
			logger.info("Session={}", session.getAttribute("fileName"));
			
			//[2] cookie저장x
			
			name = memVo.getName();
		}
		
		//4.
		return name;
	}
	
	
	@ResponseBody
	@RequestMapping("/findPwd.do")
	public void findPwd(@ModelAttribute MemberVO vo, HttpServletResponse response) {
		logger.info("ajax 이용 - 비밀번호찾기, vo={}", vo);
		
		memberService.findPwd(response, vo);
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String email = (String) session.getAttribute("email");
		
		logger.info("로그아웃 처리, 파라미터 email={}", email);
		
		session.removeAttribute("email");
		session.removeAttribute("name");
		session.removeAttribute("mem_no");
		session.removeAttribute("fileName");
		
		return "redirect:/index.do";
	}
	
	@ResponseBody
	@RequestMapping("/resetPwd.do")
	public void resetPwd(@ModelAttribute MemberVO vo, HttpServletResponse response) {
		logger.info("ajax 이용 - 비밀번호재설정, vo={}", vo);
		
		memberService.resetPwd(response, vo);
	}
	
	@ResponseBody
	@RequestMapping("/resetPwdOk.do")
	public boolean resetPwdOk(@RequestParam String pwd,
			HttpSession session, HttpServletResponse response) {
		String email = (String) session.getAttribute("email");
		logger.info("email={}", email);
		logger.info("비밀번호 재설정 처리, 파라미터 pwd={}", pwd);
		
		boolean bool = false;
		int cnt = memberService.updatePwd(pwd);
		logger.info("비밀번호 update결과, cnt={}", cnt);
		
		if(cnt>0) {
			bool= true;
		}
		
		return bool;
	}
	
	
	
	@ResponseBody
	@RequestMapping("/withdraw.do")
	public boolean memberOut(HttpSession session, HttpServletResponse response) {
		String email = (String) session.getAttribute("email");
		logger.info("탈퇴처리 파라미터:email={}", email);
		
		boolean bool = false;
		int cnt = memberService.withdrawMember(email);
		if(cnt>0) {
			bool = true;
			session.removeAttribute("email");
			session.removeAttribute("name");
			session.removeAttribute("mem_no");
			session.removeAttribute("fileName");
		}
		
		logger.info("bool={}", bool);
		return bool;
	}
	
}

















