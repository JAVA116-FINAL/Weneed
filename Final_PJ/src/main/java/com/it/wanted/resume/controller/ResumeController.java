package com.it.wanted.resume.controller;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeService;
import com.it.wanted.resume.model.ResumeVO;



@Controller
@RequestMapping("/resume")
public class ResumeController {
	private static final Logger logger=LoggerFactory.getLogger(ResumeController.class);
	@Autowired
	private ResumeService resumeService;
	
	//인트로화면보여주기
	@RequestMapping("/resumeIntro.do")
	public String resumeIntro() {
		logger.info("이력서소개 화면 보여주기");
		return "resume/resumeIntro";
	}
	
	//이력서 등록화면
	@RequestMapping(value = "/resumeRegister.do", method = RequestMethod.GET)
	public String resumeRegister_get(HttpSession session, Model model) {
		//1
		String email=(String) session.getAttribute("email");
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서 글쓰기 화면 보여주기,email={}, memNo={}",email,memNo);
		
		//2  DB작업 //이 때인서트를 하고 보여줘야할듯
		ResumeVO resumeVo=new ResumeVO();
		resumeVo.setMemNo(memNo);
		int cnt = resumeService.insertResume(resumeVo);
		logger.info("resume insert결과=cnt{}",cnt);
		
		if(cnt>0) {
			resumeVo=resumeService.selectResume(memNo);
			logger.info("resume select 결과=resumeVo{}",resumeVo);
		}
				
		//3
		model.addAttribute("resumeVo", resumeVo);
		//4
		return "resume/resumeRegister";
	}
	
	//진짜 이력서등록, 하지만 업뎃!
	@RequestMapping(value = "resumeRegister.do", method = RequestMethod.POST)
	public String resumeRegister_post(@ModelAttribute ResumeAllVO rAllVo,Model model) {
		//1 날짜 받아와서 셋팅해야함. 임시저장플래그처리
		logger.info("이력서 등록하기 파라미터 rAllVo={}",rAllVo);		
		/*
			ResumeVO rVo= rAllVo.getResumeVo();
			List<CareerVO> cList = rAllVo.getCrrList();
			List<AchievementVO>aList=rAllVo.getAchList();
		*/
		
		//2
		int cnt=resumeService.updateResume(rAllVo);
		logger.info("update결과=cnt{}",cnt);
		
		if(cnt<1) {
			model.addAttribute("msg","이력서 등록실패");
			model.addAttribute("url","/resume/resumeList.do");
			return "common/message";
		}
		//3
		
		//4
		return "redirect:/resume/resumeList.do";
		
	}
	
	
	@RequestMapping("/resumeList.do")
	public String resumeList() {
		logger.info("이력서 관리 화면 보여주기");
		return "resume/resumeList";
	}
	
	
	
	
}
