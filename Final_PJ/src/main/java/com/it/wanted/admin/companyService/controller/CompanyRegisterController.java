package com.it.wanted.admin.companyService.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.comimginfo.model.ComImgInfoService;
import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;

@Controller
@RequestMapping("/admin/companyService")
public class CompanyRegisterController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyRegisterController.class);
	@Autowired ComInfoService comInfoService;	
	@Autowired ComImgInfoService comImgInfoService;
	
	@RequestMapping("/comInfoPermission.do")
	public String adminRegister(Model model) {
		logger.info("위니드 관리자 페이지 - 정보 /이미지 등록 승인 요청 조회");
		
		//기업정보 모조리 불러다 노출
		List<ComInfoVO> comList=comInfoService.selectAllCompany();
		logger.info("기업정보 전부 조회 결과, comList.size={}", comList.size());
		
		model.addAttribute("comList", comList);
		
		return "admin/companyService/comInfoPermission";
	}
	
	@ResponseBody
	@RequestMapping("/comInfoStatustoPass.do")
	public List<ComInfoVO> adminComInfoStatustoPass(@RequestParam(value="comCodeList[]") List<String> comCodeList,
			@RequestParam(value="comMemNoList[]") List<String> comMemNoList) {
		
		System.out.println("== comCodeList ==");
		for(String comCode : comCodeList) {
			System.out.println(comCode);
		}
		
		System.out.println("== comMemNoList ==");
		for(String comMemNo : comMemNoList) {
			System.out.println(comMemNo);
		}
		
		logger.info("기업정보등록 승인 처리, 파라미터 회사코드 배열 comCodeArr={}, comMemNoArr={}", comCodeList, comMemNoList);
		
		//컴코드랑 컴멤 싸그리 넘겨서 디비처리해줍니다
		List<ComInfoVO> changedComList=comInfoService.changeStatustoPass(comCodeList, comMemNoList);
		logger.info("기업정보등록 승인 처리 결과, changedComList.size={}", changedComList.size());
		
		//결과값은 다시 컴인포 목록입니다.
		return changedComList;
	}
	
	@RequestMapping("/comImgPermission.do")
	public String adminImgPermission(Model model, HttpSession session) {
		logger.info("위니드 관리자 페이지 - 이미지 등록 승인 요청 조회");
		
		//이미지 전체조회.. 인데 passed 아닌 것들만
		List<ComImgInfoVO> comImgList=comImgInfoService.selectAllImage();
		logger.info("승인대상 이미지 전부 조회 결과, comImgList.size={}", comImgList.size());
		
		model.addAttribute("comImgList", comImgList);
		
		return "admin/companyService/comImgPermission";
	}
	
	@ResponseBody
	@RequestMapping("/comImgStatustoPass.do")
	public List<ComImgInfoVO> adminComImgStatustoPass(@RequestParam(value="comImgNoArr[]") List<Integer> comImgNoArr) {
		
		logger.info("기업정보등록 승인 처리, 파라미터 기업이미지 배열 comImgNoArr.size={}", comImgNoArr.size());
		int cnt=0;
		for(int imgNo:comImgNoArr) {
			cnt+=comImgInfoService.changeStatustoPass(imgNo);
		}
		logger.info("이미지 승인 처리 결과 cnt={}", cnt);
		//통째로 넘겨서 승인처리 해줍니다
		List<ComImgInfoVO> changedComImgList=comImgInfoService.selectAllImage();
	//	List<ComImgInfoVO> changedComImgList=null;
		//결과값은 다시 컴인포 목록입니다.
		return changedComImgList;
	}
}
