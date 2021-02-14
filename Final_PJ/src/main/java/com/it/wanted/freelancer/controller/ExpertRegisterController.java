package com.it.wanted.freelancer.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/*import com.it.wanted.freelancer.expert.model.ExpertService;
import com.it.wanted.freelancer.expert.model.ExpertVO;*/

@Controller
@RequestMapping("/freelancer")
public class ExpertRegisterController {
	private static final Logger logger=LoggerFactory.getLogger(ExpertRegisterController.class);

	@RequestMapping("/expertRegister/expertRegister1.do")
	public String expertRegister1() {
		logger.info("전문가 등록 첫번째 화면 조회하기.");
		return "/freelancer/expertRegister/expertRegister1";
	}

	@RequestMapping("/expertRegister/expertRegister2.do")
	public String expertRegister2() {
		logger.info("전문가 등록 두번째 화면 조회하기.");
		return "/freelancer/expertRegister/expertRegister2";
	}

	@RequestMapping("/expertRegister/expertRegister3.do")
	public String expertRegister3() {
		logger.info("전문가 등록 세번째 화면 조회하기.");
		return "/freelancer/expertRegister/expertRegister3";
	}


	/*
	 * @Autowired private ExpertService expertService;
	 * 
	 * @RequestMapping(value="/expregister1.do", method=RequestMethod.POST) public
	 * String write_post(@ModelAttribute ExpertVO expertVo) { //1
	 * logger.info("전문가 등록 1 처리, 파라미터 vo={}", expertVo);
	 * 
	 * //2 int cnt=expertService.insertExpert(expertVo);
	 * logger.info("전문가 등록 1 처리 결과, cnt={}", cnt);
	 * 
	 * //3 return "/expertRegister2"; }
	 */


}