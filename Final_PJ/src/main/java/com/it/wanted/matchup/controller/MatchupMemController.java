package com.it.wanted.matchup.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.google.common.reflect.Parameter;
import com.it.wanted.expertise.model.ExpertiseService;
import com.it.wanted.jikgun.model.JikgunService;
import com.it.wanted.jikgun.model.JikgunVO;
import com.it.wanted.jikmu.model.JikmuService;
import com.it.wanted.jikmu.model.JikmuVO;
import com.it.wanted.matchup.model.MatchupAllVO;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchup.model.MatchupMemVO;
import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;
import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeVO;

@Controller
@RequestMapping("/matchupMem")
public class MatchupMemController {
	private static final Logger logger=LoggerFactory.getLogger(MatchupMemController.class);
	

	@Autowired
	private MemberService memberService;
	@Autowired
	private MatchupMemService matchupService;
	@Autowired
	private JikgunService jikgunService;

	
	//1.매치업 인트로
	@RequestMapping("/matchupMemIntro.do")
	public String matchupIntro() {
		logger.info("matchupIntr 화면 보여주기");
		return "matchupMem/matchupMemIntro";
	}
	
	//2. 매치업 등록화면-우선 전문가번호 등록하기! 
	//매치업 회원인지 카운트해보고 없으면 인서트 없으면 정보 셀렉트해서 뿌리기
	@RequestMapping(value = "/matchupMemRegister.do", method = RequestMethod.GET)
	public String matchupRegister_get(HttpSession session, Model model) {
		//1 
		int memNo=(Integer) session.getAttribute("mem_no");
		String email=(String) session.getAttribute("email");
		logger.info("machupRegister 화면 보여주기, 파라미터memNo={}",memNo);
		
		//2 매치업 회원인지 확인  
		MatchupMemVO mcuVo=new MatchupMemVO();
		mcuVo.setMemNo(memNo);
		//회원정보 뿌려주고, 매치업회원인지 확인
		MemberVO memVo = memberService.selectMember(email);
		int mcuCnt=matchupService.isMatchupMem(memNo);
		int resumeCnt=matchupService.hasMcuResumeNo(memNo);
		
		logger.info("매치업 회원여부 mcuCnt={}, resumeCnt={}",mcuCnt,resumeCnt);
		if(mcuCnt>0) {//매치업회원,전문가번호가있다.
			if(resumeCnt>0) {//매치업회원이고, 이력서가등록되어있다.
				return "redirect:/matchupMem/matchupMemList.do";
				
			}else {//아직 이력서 등록이 안됐다!그러면 이력서 등록화면으로 간다.
				return "redirect:/matchupMem/matchupMemRegister2.do";
			}
		}
			
		//회원 아니면 화면보여주기 회원정보와 직군리스트를 뿌려줘야함.
		List<JikgunVO> jikgunList= new ArrayList<JikgunVO>();		
		jikgunList = jikgunService.selectAllJikgun();
		logger.info("jikgunList={}",jikgunList);
		
		//3
		model.addAttribute("jikgunList", jikgunList);
		model.addAttribute("memVo", memVo);

		//4
		return "matchupMem/matchupMemRegister";
	}
	
	
	//3.매치업 등록 post
	@RequestMapping(value = "/matchupMemRegister.do", method = RequestMethod.POST)
	public String matchupRegister_post(@ModelAttribute MatchupAllVO mcuAllVo,Model model) {
		//1.
		logger.info("매치업 등록하기 파라미터 mcuAllVo={}",mcuAllVo);
		
		//2.DB작업 전문번호, 직무, 매치업회원순!
		int cnt=matchupService.insertMcuMem(mcuAllVo);
		
		if(cnt<1) {
			model.addAttribute("msg","매치업 회원등록 실패");
			model.addAttribute("url", "/matchupMem/matchupMemRegister.do");
			return "common/message";
		}
		//3. 
		//4.
		return "redirect:/matchupMem/matchupMemRegister2.do";
	}
	
	//4.매치업 이력서 등록!
	@RequestMapping(value = "/matchupMemRegister2.do",method = RequestMethod.GET)
	public String matchupRegister2_get(HttpSession session, Model model) {
		//1 화면 보여주기
		logger.info("매치업 이력서 등록 화면보여주기");
		String email=(String) session.getAttribute("email");
		MemberVO memVo = memberService.selectMember(email);
		logger.info("매치업 aside 회원정보 조회 memVo={}",memVo);
		//2
		MatchupMemVO mcuVo = matchupService.selectMcuMem(memVo.getMemNo());	
		
		int mcuCnt=matchupService.isMatchupMem(memVo.getMemNo());
		int resumeCnt=matchupService.hasMcuResumeNo(memVo.getMemNo());
		logger.info("매치업 회원여부 mcuCnt={}, resumeCnt={}",mcuCnt,resumeCnt);
		if(mcuCnt>0) {//매치업회원,전문가번호가있다.
			if(resumeCnt>0) {//매치업회원이고, 이력서가등록되어있다.
				return "redirect:/matchupMem/matchupMemList.do";
			}
		}
		
		//3
			model.addAttribute("memVo", memVo);
			model.addAttribute("mcuVo", mcuVo);
		//4
		return "matchupMem/matchupMemRegister2";
	}
	
	//5.매치업 이력서 등록2/8
	@RequestMapping(value = "/matchupMemRegister2.do",method = RequestMethod.POST)
	public String matchupRegister2_post(@ModelAttribute ResumeAllVO rAllVo,@RequestParam int mcumemNo,Model model) {
		//1
		logger.info("매치업 이력서 등록 화면 보여주기 파라미터 rAllVo={}, mcumemNo={}",rAllVo, mcumemNo);
		MatchupMemVO mcuVo=new MatchupMemVO();
		mcuVo.setMcumemNo(mcumemNo);
		//2
		int cnt=matchupService.insertMcuMem2(rAllVo, mcuVo);
		logger.info("이력서 등록결과 cnt={}",cnt);
		if(cnt<1) {
			model.addAttribute("msg", "매치업 이력서 등록 실패!");
			model.addAttribute("url", "/matchupMem/matchupMemRegister2.do");
			return "common/message";
		}
		//3
		//4
		return "redirect:/matchupMem/matchupMemList.do";
	}
	
	//6.매치업 관리
	@RequestMapping("/matchupMemList.do")
	public String machupList() {
		//1 매치업 정보 매치업이력서, 이력서리스트, 전문분야 등 보내기 
		logger.info("machupList 화면 보여주기");
		//2
		//3
		//4
		return "matchupMem/matchupMemList";
	}
	
	//7.ajax 직무 리스트 뿌려주기
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
