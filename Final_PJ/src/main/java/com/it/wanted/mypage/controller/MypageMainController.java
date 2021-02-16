package com.it.wanted.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.applicants.model.ApplicantsService;
import com.it.wanted.applicants.model.ApplicantsVO;
import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;

@Controller
@RequestMapping("/mypage")
public class MypageMainController {

	private final static Logger logger=LoggerFactory.getLogger(MypageMainController.class);
	
	@Autowired private MemberService memberService;
	@Autowired private ApplicantsService applicantsService;
	
	@RequestMapping(value="/main.do")
	public String mypageMemInfo(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		logger.info("email={}", email);
		
		//회원정보 셋팅
		MemberVO memVo = memberService.selectMember(email);
		logger.info("memVo={}", memVo);
		
		//지원현황 셋팅
		int applyComplete = applicantsService.selectApplyComplete(memVo.getMemNo());
		logger.info("지원완료 조회 결과 : applyComplete={}", applyComplete);
		int documentPass = applicantsService.selectDocumentPass(memVo.getMemNo());
		logger.info("서류통과 조회 결과 : documentPass={}", documentPass);
		int finalAccept = applicantsService.selectFinalAccept(memVo.getMemNo());
		logger.info("최종합격 조회 결과 : finalAccept={}", finalAccept);
		int finalFail = applicantsService.selectFinalFail(memVo.getMemNo());
		logger.info("불합격 조회 결과 : finalFail={}", finalFail);
		
		
		model.addAttribute("memVo", memVo);
		model.addAttribute("applyComplete", applyComplete);
		model.addAttribute("documentPass", documentPass);
		model.addAttribute("finalAccept", finalAccept);
		model.addAttribute("finalFail", finalFail);
		
		return "mypage/main";
		
	}
	
}
