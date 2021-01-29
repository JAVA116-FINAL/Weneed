package com.it.wanted.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.languages.model.LanguagesService;
import com.it.wanted.languages.model.LanguagesVO;

@Controller
@RequestMapping("/languages")
public class LanguagesController {
	@Autowired
	private LanguagesService languagesService;
	private static final Logger logger=LoggerFactory.getLogger(LanguagesController.class);

	@ResponseBody
	@RequestMapping("/languagesRegister.do")
	public LanguagesVO languagesRegister(@RequestParam (defaultValue = "0")int resumeNo) {
		//1
		logger.info("외국어 등록하기 파라미터, resumeNo={}",resumeNo);
		//2
		LanguagesVO lVo=new LanguagesVO();
		lVo.setResumeNo(resumeNo);
		
		int cnt=languagesService.insertLang(lVo);
		if(cnt>0) {
			lVo=languagesService.selectLang(resumeNo);
			logger.info("외국어 등록 결과 , lVo={}",lVo);
		}
		//3
		//4
		return lVo;
	}
	
	@ResponseBody
	@RequestMapping("/languagesDelete.do")
	public int languagesDelete(int langNo) {
		//1
		logger.info("외국어 삭제 파라미터, langNo={}",langNo);
		//2
		int cnt=languagesService.deleteLang(langNo);
		logger.info("외국어 삭제 결과, cnt={}",cnt);
		//3
		//4
		return cnt;
	}
	
}
