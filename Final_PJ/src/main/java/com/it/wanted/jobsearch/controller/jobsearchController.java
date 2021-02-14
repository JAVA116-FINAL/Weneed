package com.it.wanted.jobsearch.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;
import com.it.wanted.position.model.PositionService;
import com.it.wanted.resume.model.ResumeService;
import com.it.wanted.resume.model.ResumeVO;

@Controller
@RequestMapping("/jobsearch")
public class jobsearchController {
	private static final Logger logger =LoggerFactory.getLogger(jobsearchController.class);
	@Autowired ResumeService resumeService;
	@Autowired MatchupMemService matchupmemServece;
	@Autowired MemberService memberService;
	@Autowired PositionService positionService;
	
	@RequestMapping("/jobsearchList.do")
	public void jobsearchList(Model model) {
		logger.info("탐색 목록화면 보여주기");
		
		//포지션 번호, 포지션명, 기업코드에 해당하는 기업이름, 
		//국가코드에 해당하는 국가명, 지역코드에 해당하는 지역명은 시간관계상 생략하는걸로
		List<Map<String, Object>> posList=positionService.selectJobsearchList();
		logger.info("모든 탐색공고 목록 가져온 결과, posList.size={}", posList.size());
		
		model.addAttribute("posList", posList);
	}
	
	@RequestMapping("/jobsearchDetail.do")
	public void jobsearchDetail(@RequestParam int posNo) {
		logger.info("탐색 상세보기 화면보여주기");
	}
	
	@RequestMapping( value = "/apply.do", method = RequestMethod.GET)
	public String apply_get(@RequestParam (defaultValue = "0") int posNo, HttpSession session, Model model) {
		//1
		int memNo= (Integer) session.getAttribute("mem_no");
		String email= (String) session.getAttribute("email");
		logger.info("지원하기 화면보여주기 파라미터 posNo={}",posNo);
		//2 회원정보, 이력서 리스트,매치업이력서번호,포지션번호 
		MemberVO memVo = memberService.selectMember(email);
		List<ResumeVO> resumeList = resumeService.selectResumeAll(memNo);
		int cnt=matchupmemServece.hasMcuResumeNo(memNo);
		int mcuResumeNo=0;
		if(cnt>0) {
			mcuResumeNo=matchupmemServece.selectmcuResumeNo(memNo);
		}
		//3
		model.addAttribute("memVo", memVo);
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("mcuResumeNo", mcuResumeNo);
		model.addAttribute("posNo",posNo);
		//4
		return "jobsearch/apply";
	}
	
}
