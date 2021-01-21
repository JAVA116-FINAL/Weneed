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
	
	@ResponseBody
	@RequestMapping(value="/memberJoin.do")
	public boolean memberJoin(@ModelAttribute MemberVO vo, Model model) {
		//1.
		logger.info("회원가입 처리 파라미터 vo ={}", vo);
		
		//2.
		boolean bool = false;
		int cnt = memberService.insertMember(vo);
		logger.info("회원가입 결과, cnt={}", cnt);
		if(cnt>0) { //회원가입 성공
			bool = true;
		}
		
		//4.
		return bool;
		
	}
	
}
