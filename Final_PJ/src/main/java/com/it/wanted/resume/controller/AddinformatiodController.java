package com.it.wanted.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.addinformatiod.model.AddinformatiodService;
import com.it.wanted.addinformatiod.model.AddinformatiodVO;

@Controller
@RequestMapping("/addinformatiod")
public class AddinformatiodController {
	private static final Logger logger= LoggerFactory.getLogger(AddinformatiodController.class);
	@Autowired
	private AddinformatiodService addinformatiodService;
	
	@ResponseBody
	@RequestMapping("/addinformatiodRegister.do")
	public AddinformatiodVO addinformatiodRegister(@RequestParam (defaultValue = "0") int resumeNo) {
		//1
		logger.info("기타 활동사항 화면보여주기, 파라미터 resumeNO={}", resumeNo);
		AddinformatiodVO aVo= new AddinformatiodVO();
		aVo.setResumeNo(resumeNo);
		//2
		int cnt=addinformatiodService.insertAdd(aVo);
		if(cnt>0) {
			aVo=addinformatiodService.selectAdd(resumeNo);
		}
		//3
		//4
		return aVo;
	}
	
	@ResponseBody
	@RequestMapping("/addinformatiodDelete.do")
	public int addinformationDelete(@RequestParam (defaultValue ="0" ) int addNo) {
		//1
		logger.info("기타활동 삭제 파라미터 addNo={}",addNo);
		//2
		int cnt=addinformatiodService.deleteAdd(addNo);
		//3
		//4
		return cnt;
	}
	
}
