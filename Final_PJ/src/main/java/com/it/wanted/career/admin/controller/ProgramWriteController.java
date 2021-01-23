package com.it.wanted.career.admin.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.wanted.common.FileUploadUtil;
import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;

@Controller
@RequestMapping("/career/admin")
public class ProgramWriteController {

	private static final Logger logger = LoggerFactory.getLogger(ProgramWriteController.class);
	
	@Autowired private ProgramService programService;
	@Autowired private FileUploadUtil fileUtil;
	
	
	//프로그램 글쓰기(등록) 화면 보여주기
	@RequestMapping(value="/programWrite.do", method=RequestMethod.GET)
	public String programWrite_get() {
		logger.info("programWrite 프로그램 등록 글쓰기 페이지 보여주기");		
		
		return "career/admin/programWrite";
	}
	
	//프로그램 등록하기 (등록 처리)
	@RequestMapping(value="/programWrite.do", method=RequestMethod.POST)
	public String programWrite_post(@ModelAttribute ProgramVO proVo, HttpServletRequest request, 
			Model model) {
		logger.info("programWrite 프로그램 등록 글쓰기 처리, 파라미터 proVo{}=", proVo);
		
		//파일 업로드
		List<Map<String, Object>> list=null;
		String imageUrl="";
		try {
			list=fileUtil.fileUplaod(request, FileUploadUtil.IMAGE_TYPE);
			for(Map<String, Object> map: list) {
				imageUrl=(String) map.get("fileName");
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		proVo.setImageUrl(imageUrl);
		
		int cnt=programService.insertProgram(proVo);
		logger.info("프로그램 등록 결과, cnt=", cnt);
		
		return "redirect:programComplete1.do";		
		
	}
	
	
}
