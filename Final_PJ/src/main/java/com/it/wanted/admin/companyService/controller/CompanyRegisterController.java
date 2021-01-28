package com.it.wanted.admin.companyService.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;

@Controller
@RequestMapping("/admin/companyService")
public class CompanyRegisterController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyRegisterController.class);
	@Autowired ComInfoService comInfoService;	
	
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
}
