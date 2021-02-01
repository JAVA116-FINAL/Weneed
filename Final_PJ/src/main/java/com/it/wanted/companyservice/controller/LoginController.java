package com.it.wanted.companyservice.controller;

import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.commeminfo.model.ComMemInfoService;
import com.it.wanted.commeminfo.model.ComMemInfoVO;
import com.it.wanted.commemlist.model.ComMemListService;

@Controller
@RequestMapping("/company")
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired ComMemInfoService comMemService;
	@Autowired ComMemListService comMemListService;
	@Autowired ComInfoService comInfoService;
	
	public void login_get() { //로그인 팝업화면 노출시키는 거
		logger.info("로그인 화면 출력");
	}
	
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public String login(@RequestParam String comMemLoginId, @RequestParam String comMemLoginPwd,
			HttpServletRequest request, HttpSession session, Model model) {
		logger.info("로그인, 파라미터 comMemId={}, comMemPwd={}", comMemLoginId, comMemLoginPwd);
		
		int res=comMemService.loginCheck(comMemLoginId, comMemLoginPwd);
		logger.info("로그인 확인 결과 res={}", res);
		
		String loc="";
		ComInfoVO comInfoVo=new ComInfoVO();
		ComMemInfoVO comMemInfoVo=new ComMemInfoVO();
		if(res==ComMemInfoService.LOGIN_SUCCESS) { //일단 로그인 성공
			//일단 세션처리부터, 쿠키는 아이디저장기능 별도로 없어서 저장하지 않음
			session=request.getSession();
			session.setAttribute("comMemId", comMemLoginId);
			
			comMemInfoVo=comMemService.selectComMem(comMemLoginId);
			logger.info("기업회원정보 조회 결과 comMemInfoVo={}", comMemInfoVo);
			logger.info("기업회원이름 comMemName={}", comMemInfoVo.getComMemName());
			session.setAttribute("comMemName", comMemInfoVo.getComMemName());
			//멤버정보를 통째로 가져와서 사용할 수 있는 것들 
			// 1 멤버번호, 2 멤버이름, 3 멤버번호를 사용해서 기업정보 불러오기 
			
			//기업정보 등록 여부 확인.. 있는거 말고 승인됐는지 확인한다
			int regedCheck=comMemListService.checkComReged(comMemLoginId);
			logger.info("기업정보 등록 여부 확인 결과 regedCheck={}", regedCheck);
			
			//등록여부에 따라 기업명 세팅
			
			if(regedCheck==ComMemListService.REGED_COMPANY || regedCheck==ComMemListService.IMG_NOT_REGED) {
				comInfoVo=comInfoService.selectCompany(comMemInfoVo.getComMemNo());
				model.addAttribute("comInfoVo", comInfoVo);
				//번호를 넣어서 회사정보를 가져옴
			}
			
			//ajax 버림
			if(regedCheck==ComMemListService.REGED_COMPANY) { //기업정보와 이미지 모두 등록승인된 경우
				loc="redirect:/company/applicants.do";
			}else if(regedCheck==ComMemListService.IMG_NOT_REGED){ //정보만 등록승인되고 이미지 미등록시
				loc="redirect:/company/comInfoModify.do";
			}else if(regedCheck==ComMemListService.INFO_NOT_REGED){ //정보도 미등록됨
				loc="redirect:/company/register.do";
			}//기업정보 확인 if
		}else { //로그인 실패했다
			loc="redirect:/company/welcome.do";
		}
		
		session.setAttribute("comInfoVo", comInfoVo);
		
		logger.info("파라미터로 세팅한 comMemInfoVo={}", comMemInfoVo);
		return loc;
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String comMemId=(String) session.getAttribute("comMemId");
		logger.info("로그아웃 처리, 파라미터 comMemId={}", comMemId);
		
		session.removeAttribute("comMemId");
		session.removeAttribute("comInfoVo");
		
		return "redirect:/company/welcome.do";
	}
}
