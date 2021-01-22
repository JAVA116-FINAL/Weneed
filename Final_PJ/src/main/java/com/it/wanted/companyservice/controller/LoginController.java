package com.it.wanted.companyservice.controller;

import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.commeminfo.model.ComMemInfoService;
import com.it.wanted.commeminfo.model.ComMemInfoVO;
import com.it.wanted.commemlist.model.ComMemListService;

@Controller
@RequestMapping("/company")
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired ComMemInfoService comMemService;
	@Autowired ComMemListService comMemListService;
	
	public void login_get() { //로그인 팝업화면 노출시키는 거
		logger.info("로그인 화면 출력");
	}
	
	@RequestMapping(value="/member/login.do", method = RequestMethod.POST)
	public String checkId(@RequestParam String comMemLoginId, @RequestParam String comMemLoginPwd,
			HttpServletRequest request) {
		logger.info("ajax 연습 - 로그인, 파라미터 comMemId={}, comMemPwd={}", comMemLoginId, comMemLoginPwd);
		
		int res=comMemService.loginCheck(comMemLoginId, comMemLoginPwd);
		logger.info("로그인 확인 결과 res={}", res);
		
		String loc="";
		if(res==ComMemInfoService.LOGIN_SUCCESS) { //한번 더 해야돼 기업정보 등록 돼있는지 안돼있는지
			//일단 세션처리부터, 쿠키는 아이디저장기능 별도로 없어서 저장하지 않음.. 이걸로 되나? ajax 써서 뭔가 안되는거 아닌가? 불안쓰
			HttpSession session=request.getSession();
			session.setAttribute("comMemId", comMemLoginId);
			
			//기업정보 등록 여부 확인
			int regedCheck=comMemListService.checkComReged(comMemLoginId);
			logger.info("기업정보 등록 여부 확인 결과 regedCheck={}", regedCheck);
			
			//ajax 버림
			if(regedCheck==ComMemListService.REGED_COMPANY) { //기업정보가 등록된 경우
				loc="redirect:/company/applicants.do";
			}else if(regedCheck==ComMemListService.IMG_NOT_REGED){ //정보만 등록되고 이미지 미등록시
				loc="redirect:/company/imgUpload.do";
			}else if(regedCheck==ComMemListService.INFO_NOT_REGED){ //정보도 미등록됨
				loc="redirect:/company/register.do";
			}//기업정보 확인 if
		}else { //로그인 실패했다
			loc="redirect:/company/welcome.do";
		}
		
		return loc;
	}
}
