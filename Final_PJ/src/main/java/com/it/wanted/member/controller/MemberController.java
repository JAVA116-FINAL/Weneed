package com.it.wanted.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;

@Controller
public class MemberController {
	private static final Logger logger
		= LoggerFactory.getLogger(MemberController.class);
	
	@Autowired private MemberService memberService;
	/*
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/memberJoin.do", method = RequestMethod.POST) public
	 * String memberJoin(@RequestParam String email,String pwd) {
	 * logger.info("회원가입 성공 " + email); System.out.println("AAAA" +email); return
	 * "thank you join";
	 * 
	 * }
	 */
	
	@ResponseBody
	@RequestMapping(value="/memberJoin.do")
	public String memberJoin(@ModelAttribute MemberVO vo, Model model) {
		//1.
		logger.info("회원가입 처리 파라미터 vo ={}", vo);
		
		//2.
		int cnt = memberService.insertMember(vo);
		logger.info("회원가입 결과, cnt={}", cnt);
		
		String msg="회원가입 실패!", url="/index.do";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/index.do";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4.
		return "common/message";
		
	}
	
}
