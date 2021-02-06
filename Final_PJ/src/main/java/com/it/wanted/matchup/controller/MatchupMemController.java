package com.it.wanted.matchup.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.jikgun.model.JikgunService;
import com.it.wanted.jikgun.model.JikgunVO;
import com.it.wanted.jikmu.model.JikmuService;
import com.it.wanted.jikmu.model.JikmuVO;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchup.model.MatchupMemVO;
import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;

@Controller
@RequestMapping("/matchupMem")
public class MatchupMemController {
	private static final Logger logger=LoggerFactory.getLogger(MatchupMemController.class);
	@Autowired
	private MatchupMemService matchupService;

	@Autowired
	private JikgunService jikgunService;
	
	@Autowired
	private MemberService memberService;
	
	
	//1.매치업 인트로
	@RequestMapping("/matchupMemIntro.do")
	public String matchupIntro() {
		logger.info("matchupIntr 화면 보여주기");
		return "matchupMem/matchupMemIntro";
	}
	
	//2. 매치업 등록화면 
	//매치업 회원인지 카운트해보고 없으면 인서트 없으면 정보 셀렉트해서 뿌리기
	@RequestMapping("/matchupMemRegister.do")
	public String machupEdit(HttpSession session, Model model) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		String email=(String) session.getAttribute("email");
		logger.info("machupRegister 화면 보여주기, 파라미터memNo={}",memNo);
		MatchupMemVO mVo=new MatchupMemVO();
		mVo.setMemNo(memNo);

		//2
		MemberVO memVo = memberService.selectMember(email);
		
		int count=matchupService.isMatchupMem(memNo);
		logger.info("매치업 회원여부 count={}",count);
		if(count>0) {
			//매치업회원이면 셀렉트
			mVo=matchupService.selectMcuMem(memNo);
			logger.info("mVo={}",mVo);
			model.addAttribute("mVo", mVo);
			model.addAttribute("memVo", memVo);
			return "/redirect:/matchupMem/matchupMemList.do";
		}
			
		//회원 아니면 직군등록 인서트부터뿌려주자!
		List<JikgunVO> jikgunList = jikgunService.selectAllJikgun();
		logger.info("jikgunList={}",jikgunList);
		//3
		model.addAttribute("jikgunList", jikgunList);
		model.addAttribute("memVo", memVo);
		//4
		return "matchupMem/matchupMemRegister";
	}
	
	//3.매치업 관리
	@RequestMapping("/matchupMemList.do")
	public String machupList() {
		//1 매치업 정보 매치업이력서, 이력서리스트, 전문분야 등 보내기 
		logger.info("machupList 화면 보여주기");
		//2
		//3
		//4
		return "matchupMem/matchupMemList";
	}
	//4.ajax 직무 리스트 뿌려주기
	@ResponseBody
	@RequestMapping("/matchupGetJikmu.do")
	public List<JikmuVO> matchupGetJikmu(@RequestParam String jikgunCode){
		//1
		logger.info("get Jikmu 화면 파라미터: jikgunCode={}",jikgunCode);
		
		//2
		List<JikmuVO> jikmuList = jikgunService.selectJikmuByJikgunCode(jikgunCode);
		logger.info("jikmuList={}",jikmuList);
		//3
		
		//4
		return jikmuList;
	}
	
}
