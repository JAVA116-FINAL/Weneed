package com.it.wanted.companyservice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String join_modal_post(@ModelAttribute ComMemInfoVO vo) {
		logger.info("기업회원 회원가입 처리, vo={}", vo);
		
		int cnt=comMemInfoService.joinComMem(vo);
		logger.info("회원가입 처리 결과, cnt={}", cnt);
		
		return "redirect:/company/register.do";
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
