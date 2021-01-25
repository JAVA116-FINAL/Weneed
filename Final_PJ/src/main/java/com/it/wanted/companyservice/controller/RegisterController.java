package com.it.wanted.companyservice.controller;

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

import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.cominfo.model.ComSizeInfoVO;
import com.it.wanted.cominfo.model.IndustryVO;
import com.it.wanted.cominfo.model.NationVO;
import com.it.wanted.cominfo.model.RegionVO;
import com.it.wanted.commeminfo.model.ComMemInfoService;
import com.it.wanted.commeminfo.model.ComMemInfoVO;

@Controller
@RequestMapping("/company")
public class RegisterController {
	
	private static final Logger logger=LoggerFactory.getLogger(RegisterController.class);
	@Autowired ComMemInfoService comMemInfoService;
	@Autowired ComInfoService comInfoService;
	
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
	
	@RequestMapping(value="/register.do", method = RequestMethod.GET)
	public void register_get(Model model, HttpSession session) {
		logger.info("회사정보등록 페이지 조회");
		
		//산업군 목록 
		List<IndustryVO> industryList=comInfoService.selectIndustryList();
		logger.info("산업군목록 조회결과 industry.size={}", industryList.size());
		//국가목록
		List<NationVO> nationList=comInfoService.selectNationList();
		logger.info("국가목록 조회결과 nationList.size={}", nationList.size());
		//회사규모
		List<ComSizeInfoVO> comSizeList=comInfoService.selectComSizeList();
		logger.info("규모목록 조회결과 comSizeList.size={}", comSizeList.size());
		//최초 지역목록
		List<RegionVO> regionList=comInfoService.selectRegionList("KR");
		logger.info("지역목록 조회결과 regionList.size={}", regionList.size());
		
		String comMemId=(String) session.getAttribute("comMemId");
		
		ComMemInfoVO comMemInfoVo=comMemInfoService.selectComMem(comMemId);
		
		model.addAttribute("comMemInfoVo", comMemInfoVo);
		model.addAttribute("industryList", industryList);
		model.addAttribute("nationList", nationList);
		model.addAttribute("comSizeList", comSizeList);
		model.addAttribute("regionList", regionList);
		
	}
	
	@ResponseBody
	@RequestMapping("/selectRegionbyNation.do")
	public List<RegionVO> selectRegionList(@RequestParam String nationCode) {
		logger.info("국가명으로 지역목록 선택, 파라미터 국가코드 nationCode={}", nationCode);
		
		List<RegionVO> regionList=comInfoService.selectRegionList(nationCode);
		logger.info("국가명으로 지역목록 조회 결과, regionList.size={}", regionList.size());
		
		return regionList;
	}
	
	@RequestMapping(value="/register.do", method = RequestMethod.POST)
	public String register_post(@ModelAttribute ComInfoVO comInfoVo, Model model) {
		logger.info("회사정보등록 처리, 파라미터 comInfoVo={}", comInfoVo);
		
		//입력된 정보로 insert, 승인여부는 'Yet'으로 자동세팅됨
		int cnt=comInfoService.insertComInfo(comInfoVo);
		logger.info("회사정보등록 처리 결과, cnt={}", cnt);
		
		String msg="", url="", returnUrl="";
		if(cnt>0) { //입력 성공
			msg="기업 정보 제출이 완료되었습니다. 1영업일 후 승인처리됩니다.";
			url="/company/welcome.do";
			returnUrl="common/message2";
		}else {
			msg="기업 정보 제출이 실패했습니다.";
			url="/company/register.do";
			returnUrl="common/message";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//안내화면 하나 만들어줘야겠네
		return "common/message";
	}
	
	@RequestMapping("/imgUpload.do")
	public void imgUpload_get() {
		logger.info("회사이미지등록 페이지 조회");
		
	}
	
}
