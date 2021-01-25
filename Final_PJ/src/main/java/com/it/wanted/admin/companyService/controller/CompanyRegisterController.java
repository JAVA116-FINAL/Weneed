package com.it.wanted.admin.companyService.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/companyService")
public class CompanyRegisterController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyRegisterController.class);
		
	@RequestMapping("/comInfoPermission.do")
	public String adminRegister() {
		logger.info("위니드 관리자 페이지 - 정보 /이미지 등록 승인 요청 조회");
		
		return "admin/companyService/comInfoPermission";
	}
}
