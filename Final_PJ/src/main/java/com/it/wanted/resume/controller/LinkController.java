package com.it.wanted.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.link.model.LinkService;
import com.it.wanted.link.model.LinkVO;

@Controller
@RequestMapping("/link")
public class LinkController {
	private static final Logger logger=LoggerFactory.getLogger(LinkController.class);
	@Autowired
	private LinkService linkService;
	
	@ResponseBody
	@RequestMapping("/linkRegister.do")
	public LinkVO linkRegister(@RequestParam (defaultValue = "0")int resumeNo) {
		//1
		logger.info("링크 화면보여주기, resumeNo={}", resumeNo);
		LinkVO linkVo=new LinkVO();
		linkVo.setResumeNo(resumeNo);
		//2
		int cnt=linkService.insertLink(linkVo);
		if (cnt>0) {
			linkVo=linkService.selectLink(resumeNo);
		}
		//3
		//4
		return linkVo;
	}
	
	@ResponseBody
	@RequestMapping("linkDelete.do")
	public int linkDelete(@RequestParam (defaultValue = "0")int linkNo) {
		//1
		logger.info("링크삭제 linkNo={}",linkNo);
		//2
		int cnt=linkService.deleteLink(linkNo);
		//3
		//4
		return cnt;
	}
}
