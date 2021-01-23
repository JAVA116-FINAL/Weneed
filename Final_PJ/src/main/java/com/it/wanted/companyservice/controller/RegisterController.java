package com.it.wanted.companyservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.commeminfo.model.ComMemInfoService;
import com.it.wanted.commeminfo.model.ComMemInfoVO;

@Controller
@RequestMapping("/company")
public class RegisterController {
	
	private static final Logger logger=LoggerFactory.getLogger(RegisterController.class);
	@Autowired ComMemInfoService comMemInfoService;
	
	@RequestMapping(value = "/member/join.do", method= RequestMethod.POST)
	public String join_modal_post(@ModelAttribute ComMemInfoVO vo, Model model) {
		logger.info("기업회원 회원가입 처리, vo={}", vo);
		
		int cnt=comMemInfoService.joinComMem(vo);
		logger.info("회원가입 처리 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt==1) { //회원가입 처리 성공
			msg="회원가입 되었습니다.";
			url="/company/register.do";
		}else { //cnt가 2면 이미 존재하는 아이디임
			msg="이미 가입된 계정입니다.";
			url="/company/welcome.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/register.do")
	public void register_get() {
		logger.info("회사정보등록 페이지 조회");
		
	}
	
	@RequestMapping("/imgUpload.do")
	public void imgUpload_get() {
		logger.info("회사이미지등록 페이지 조회");
		
	}
	
}
