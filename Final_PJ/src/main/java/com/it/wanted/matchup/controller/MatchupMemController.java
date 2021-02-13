package com.it.wanted.matchup.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.reflect.Parameter;
import com.it.wanted.career.model.CareerService;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.education.model.EducationService;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.expertise.model.ExpertiseService;
import com.it.wanted.expertise.model.ExpertiseVO;
import com.it.wanted.jikgun.model.JikgunService;
import com.it.wanted.jikgun.model.JikgunVO;
import com.it.wanted.jikmu.model.JikmuService;
import com.it.wanted.jikmu.model.JikmuVO;
import com.it.wanted.matchup.model.MatchupAllVO;
import com.it.wanted.matchup.model.MatchupDetailAllVO;
import com.it.wanted.matchup.model.MatchupDetailsViewVO;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchup.model.MatchupMemVO;
import com.it.wanted.matchupCom.model.MatchupComService;
import com.it.wanted.matchupCom.model.MatchupComVO;
import com.it.wanted.matchupexcom.model.MatchupExComService;
import com.it.wanted.matchupexcom.model.MatchupExComVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemJikmuVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemjikmuService;
import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;
import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeService;
import com.it.wanted.resume.model.ResumeVO;

@Controller
@RequestMapping("/matchupMem")
public class MatchupMemController {
	private static final Logger logger=LoggerFactory.getLogger(MatchupMemController.class);
	
	@Autowired private MemberService memberService;
	@Autowired private MatchupMemService matchupService;
	@Autowired private JikgunService jikgunService;
	@Autowired private MatchupMemjikmuService matchupjikmuService;
	@Autowired private ResumeService resumeService;
	@Autowired private EducationService educationService;
	@Autowired private CareerService careerService;
	@Autowired private ExpertiseService expertiseService;
	@Autowired private MatchupComService matchupComService;
	@Autowired private MatchupExComService matchupexcomService;
	
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
		List<JikgunVO> jikgunList = jikgunService.selectAllJikgun();
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
		logger.info("매치업 등록1처리하기 파라미터 mcuAllVo={}",mcuAllVo);
		
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
		MatchupDetailsViewVO mDetailsView=matchupService.selectMatchupDetailsView(memVo.getMemNo());
		
		logger.info("매치업 회원여부 mcuCnt={}, resumeCnt={}",mcuCnt,resumeCnt);
		if(mcuCnt>0) {//매치업회원,전문가번호가있다.
			if(resumeCnt>0) {//매치업회원이고, 이력서가등록되어있다. return
				if(mDetailsView.getEduNo()!=0&&mDetailsView.getCareerNo()!=0) {
					return "redirect:/matchupMem/matchupMemList.do";	
				}
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
	public String matchupRegister2_post(@ModelAttribute MatchupAllVO mAllVo,Model model) {
		//1
		logger.info("매치업 이력서 등록2 처리 파라미터 mAllVo={}",mAllVo);
		
		//2
		int cnt=matchupService.insertMcuMem2(mAllVo);
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
	public String machupList(HttpSession session,Model model) {
		//1 매치업 정보 매치업이력서, 이력서리스트, 전문분야 등 보내기

		logger.info("machupList 화면 보여주기");
		//2
		int memNo=(Integer) session.getAttribute("mem_no");
		String email=(String) session.getAttribute("email");
		
		//1)회원정보 셋팅
		MemberVO memVo = memberService.selectMember(email);
		logger.info("매치업 aside 회원정보 조회 memVo={}",memVo);
		
		//2)매치업 회원번호구하기(회원인지, 등록됐는지 확인)
		int mcuCnt=matchupService.isMatchupMem(memNo);
		int resumeCnt=matchupService.hasMcuResumeNo(memNo);
		logger.info("매치업 회원여부 mcuCnt={}, resumeCnt={}",mcuCnt,resumeCnt);
		if(mcuCnt<1) {//매치업회원X
			return "redirect:/matchupMem/matchupMemRegister.do";
		}else {
			if(resumeCnt<1) {//매치업회원이고, 이력서가등록안되어있다.
				return "redirect:/matchupMem/matchupMemRegister2.do";
			}	
		}
		MatchupMemVO mcuVo = matchupService.selectMcuMem(memNo);
		logger.info("mcuVo={}",mcuVo);
		
		//3)매치업 정보 가져오기 view의 모든정보 excomList, jikmuList, resumeList
		List<MatchupDetailAllVO> mDetailsList = matchupService.selectMatchupDetails(mcuVo.getMcumemNo());
		List<Map<String, Object>> jikmuList = matchupjikmuService.selectMjikmuView(mcuVo.getExpertiseNo());
		List<ResumeVO> resumeList = resumeService.selectResumeAll(memNo);
		logger.info("matchup 회원조회결과: mDetailsList={}",mDetailsList);
		logger.info("matchup 회원조회결과: jkimuList={}",jikmuList);
		logger.info("matchup 회원조회결과: resumeList={}",resumeList);
		
		//3
		model.addAttribute("memVo", memVo);
		model.addAttribute("mDetailsList", mDetailsList);
		model.addAttribute("jikmuList", jikmuList);
		model.addAttribute("resumeList", resumeList);
		//4
		return "matchupMem/matchupMemList";
	}
	
	//7.매치업 학교,직장정보 입력 matchupMem/matchupMemEdit2.do?mcumemNo=${mVo.MMDetailsVo.mcumemNo}&eduNo=${mVo.MMDetailsVo.eduNo}&careerNo=${mVo.MMDetailsVo.careerNo}
	@RequestMapping(value="/matchupMemEdit2.do", method = RequestMethod.GET)
	public String matchupMemEdit2_get(@ModelAttribute MatchupDetailsViewVO mViewVo,HttpSession session, Model model) {
		//1
		String email= (String) session.getAttribute("email");
		logger.info("매치업 학교/직장/간략소개 수정하기 화면보여주기 파라미터 mViewVo={}, 세션회원번호 email={}",mViewVo,email);

		//2
		//에듀랑 커리어노가 있는지 확인 둘중에 하나라도 없으면 register2로 리턴
		if(mViewVo.getCareerNo()==0||mViewVo.getEduNo()==0) {
			return "redirect:/matchupMem/matchupMemRegister2.do";
		}
		
		MemberVO memVo = memberService.selectMember(email);
		logger.info("회원정보 memVo={}", memVo);
		
		//이력서, 에듀, 커리어,
	    EducationVO eduVo = educationService.selectEduOne(mViewVo.getEduNo());
	    logger.info("학력사항 정보 eduVo={}", eduVo); CareerVO crrVo =
	    careerService.selectCareerOne(mViewVo.getCareerNo());
	    logger.info("경력사항 정보 crrVo={}", crrVo); 
	    ResumeVO resumeVo = resumeService.selectResumeOnebyResumeNo(mViewVo.getResumeNo());
	    logger.info("이력서 정보 resumeVo={}", resumeVo);
	 
		//3
		model.addAttribute("memVo", memVo);
		model.addAttribute("eduVo", eduVo);
		model.addAttribute("crrVo", crrVo);
		model.addAttribute("resumeVo", resumeVo);
		
		//4	
		return "matchupMem/matchupMemEdit2";
	}
	
	//8./matchupMem/matchupMemEdit2.do
	@RequestMapping(value = "/matchupMemEdit2.do", method = RequestMethod.POST)
	public String matchupMemEdit2_post(@ModelAttribute MatchupAllVO mAllVo) {
		//1	
		logger.info("매치업 학교/직장/간략소개 수정 mAllVo={}",mAllVo);
		//2
		int cnt=matchupService.updateMatcupInfo2(mAllVo);
		logger.info("수정결과 cnt={}", cnt);
		//3
		//4
		return "redirect:/matchupMem/matchupMemList.do";
	}
	
	//9.매치업 전문분야설정 expertise /matchupMem/matchupMemEdit1.do?expertiseNo
	@RequestMapping(value = "/matchupMemEdit1.do",method = RequestMethod.GET)
	public String matchupMemEdit1_get(@RequestParam (defaultValue = "0" ) int expertiseNo, HttpSession session, Model model) {
		//1
		logger.info("전문분야 수정하기 화면 파라미터 expertisxeNo={}",expertiseNo);
		String email=(String) session.getAttribute("email");
		
		//2 회원정보, 전문가정보(직군,직무,경력연봉,스킬), 매치업 직무정보(전문가정보 직군번호로찾기), (리스트뿌릴것:직군리스트, (사용자선택값의)직무리스트)
		MemberVO memVo = memberService.selectMember(email);
		ExpertiseVO expertVo=expertiseService.selectExpertise(expertiseNo);
		logger.info("expertVo={}",expertVo);
		List<MatchupMemJikmuVO> mJikmuList = matchupjikmuService.selectMcuMemjikmubyexpertiseNo(expertiseNo);
		logger.info("mJikmuList={}",mJikmuList);
		//뿌려줄 직군리스트(이중에 엑스퍼트등록된 직군은 체크되게한다.)
		List<JikgunVO> jikgunList = jikgunService.selectAllJikgun();
		List<JikmuVO> jikmuList = jikgunService.selectJikmuByJikgunCode(expertVo.getJikgunCode());

		//3
		model.addAttribute("memVo", memVo);
		model.addAttribute("expertVo", expertVo);
		model.addAttribute("mJikmuList", mJikmuList);
		model.addAttribute("jikgunList", jikgunList);
		model.addAttribute("jikmuList", jikmuList);
			
		//4
		return "/matchupMem/matchupMemEdit1";
	}
	
	//10. 매치업 전문분야 수정 포스트
	@RequestMapping(value = "/matchupMemEdit1.do",method = RequestMethod.POST)
	public String matchupMemEdit1_get(@ModelAttribute MatchupAllVO mAllVo) {
		//1
		logger.info("매치업 전문분야 수정하기 파라미터 mAllVo={}",mAllVo);
		//2 expertise jikmuVo 수정 
		int cnt=matchupService.updateMatcupInfo1(mAllVo);
		logger.info("매치업 전문분야 수정결과 cnt={}",cnt);
		//3
		//4
		return "redirect:/matchupMem/matchupMemList.do";
	}
	
	//11.ajax 직무 리스트 뿌려주기
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
	
	//12. ajax 매치업 이력서 번호 변경하기
	/* /matchupMem/matchupMemChangeResume.do */
	@ResponseBody
	@RequestMapping("/matchupMemChangeResume.do")
	public int matchupMemChangeResume(@RequestParam (defaultValue = "0") int  mcumemNo, @RequestParam (defaultValue = "0")int resumeNo) {
		//1
		logger.info("매치업 이력서 변경하기 파라미터 mcumemNo={}, resumeNo={}",mcumemNo,resumeNo);
		MatchupMemVO mcuVo= new MatchupMemVO();
		mcuVo.setMcumemNo(mcumemNo);
		mcuVo.setResumeNo(resumeNo);
		//2
		int cnt=matchupService.updateMatchupResume(mcuVo);
		logger.info("업데이트 결과 cnt={}",cnt);
		//3
		//4
		return cnt;
	}
	
	//13 ajax 매치업List 추천인 업뎃하기
	@ResponseBody
	@RequestMapping("/matchupRefNameUpdate.do")
	public MatchupMemVO matchupRefNameUpdate(@RequestParam (defaultValue = "0") int mcumemNo, @RequestParam String refName) {
		//1
		logger.info("추천인업데이트 파라미터 mcumemNo={}, refName={}",mcumemNo, refName);
		//2
		MatchupMemVO mcuVo= new MatchupMemVO();
		mcuVo.setMcumemNo(mcumemNo);
		mcuVo.setRefName(refName);
		int cnt=matchupService.updateMatchupRefName(mcuVo);
		MatchupMemVO mcumemVo = new MatchupMemVO();
		if(cnt>0) {
			mcumemVo = matchupService.selectOnebymatchupMemNo(mcumemNo);
		}
		String getRefName=mcumemVo.getRefName();
		logger.info("업뎃결과 getRefName={}",getRefName);
		//3
		//4
		return mcumemVo;
	}
	
	//14 ajax 구직플래그변경
	@ResponseBody
	@RequestMapping("/matchupjobFlagUpdate.do")
	public MatchupMemVO matchupjobFlagUpdate(@RequestParam (defaultValue = "0")int mcumemNo, @RequestParam String jobsearchFlag) {
		//1
		logger.info("플래그 변경 파라미터 mcumemNo={}, jobsearchFlag={}",mcumemNo,jobsearchFlag);
		//2
		MatchupMemVO mcuVo= new MatchupMemVO();
		mcuVo.setMcumemNo(mcumemNo);
		mcuVo.setJobsearchFlag(jobsearchFlag);
		mcuVo.setResumeopenFlag(jobsearchFlag);
		int cnt=matchupService.updateMatchupjobFlag(mcuVo);
		if(cnt>1) {
			mcuVo=matchupService.selectOnebymatchupMemNo(mcumemNo);
			
		}
		logger.info("플래그 변경 후 결과mcuVo={}",mcuVo);
		//3
		//4
		return mcuVo;
	}
	
	//15. ajax 매치업 회사 키워트 조회 /matchupSearchCom.do
	@ResponseBody
	@RequestMapping("/matchupSearchCom.do")
	public List<Map<String, Object>> matchupSearchCom(@RequestParam String comName) {
		//1
		logger.info("회사 검색하기 파라미너 comName={}",comName);
		//2
		List<Map<String, Object>> mcuComList = matchupComService.selectSearchmatchupCombyComName(comName);
		logger.info("회사 검색하기 결과 mcuComList={}",mcuComList);
		//3
		//4
		return mcuComList;
	}
	
	//16.ajax매치업 제외기업 등록하기 matchupMem/matchupExComRegister.do
	@ResponseBody
	@RequestMapping("/matchupExComRegister.do")
	public int matchupExComRegister(@ModelAttribute MatchupExComVO matchupexcomVo){
		//1
		logger.info("매치업 추천 제외기업 등록하기 파라미터 matchupexcomVo"+matchupexcomVo);
		//2
		int cnt=matchupexcomService.insertMatchupExCom(matchupexcomVo);
		logger.info("조회결과cnt={}",cnt);
		//3
		//4
		return cnt;
	}
	
	//17. ajax매치업 제외기업 삭제 /matchupMem/matchupExComDelete.do
	@ResponseBody
	@RequestMapping("/matchupExComDelete.do")
	public int matchupExComDelete(@ModelAttribute MatchupExComVO matchupexcomVo) {
		//1
		logger.info("제외기업 삭제하기 파라미터 matchupexcomVo={}", matchupexcomVo);
		//2
		int cnt=matchupexcomService.deleteMatchuoExcom(matchupexcomVo);
		logger.info("삭제결과 cnt={}", cnt);
		//3
		//4
		return cnt;
	}
	
	//18. ajax매치업 등록기업 정보 불러오기 /matchupExComSelectView.do
	@ResponseBody
	@RequestMapping("/matchupExComSelectView.do")
	public Map<String, Object> matchupExComSelectView(@ModelAttribute MatchupExComVO matchupexcomVo){
		//1
		logger.info("매치업 뷰 조회 파라미터 matchupexcomVo={}",matchupexcomVo);
		//2
		Map<String, Object> matchupexcomView = matchupexcomService.selectExcomView(matchupexcomVo);
		logger.info("매치업 뷰 조회 결과 matchupexcomView={}",matchupexcomView);
		//3
		//4
		return matchupexcomView;
	}
	
}
