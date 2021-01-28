package com.it.wanted.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.education.model.EducationService;
import com.it.wanted.education.model.EducationVO;

@Controller
@RequestMapping("/education")
public class EducationController {
	private static final Logger logger=LoggerFactory.getLogger(EducationController.class);
	@Autowired
	private EducationService eduService;
	
	@ResponseBody
	@RequestMapping(value = "/educationRegister.do", method = RequestMethod.GET)
	public EducationVO educationRegister(@RequestParam (defaultValue = "0") int resumeNo) {
		//1
		logger.info("학력작성 화면 보여주기 파라미터 resumeNo={}", resumeNo);
		EducationVO eduVo= new EducationVO();
		eduVo.setResumeNo(resumeNo);
		//2
		int cnt=eduService.insertEdu(eduVo);
		if(cnt>0) {
			eduVo=eduService.selectEdu(resumeNo);
		}
		
		//3
		//4
		return eduVo;
	}
	

}
