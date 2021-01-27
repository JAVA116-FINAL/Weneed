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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.common.FileUploadUtil;
import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;

@Controller
@RequestMapping("/career/Admin")
public class ProgramWriteController {

	private static final Logger logger = LoggerFactory.getLogger(ProgramWriteController.class);
	
	@Autowired private ProgramService programService;
	@Autowired private FileUploadUtil fileUtil;
	
	
	//프로그램 글쓰기(등록) 화면 보여주기
	@RequestMapping(value="/programWrite.do", method=RequestMethod.GET)
	public String programWrite_get() {
		logger.info("programWrite 프로그램 등록 글쓰기 페이지 보여주기");		
		
		return "career/Admin/programWrite";
	}

	/*
	 * //ajax이용해서
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="/cateChecked.do", method=RequestMethod.POST) public
	 * ProgramVO cateCheckbox(@ModelAttribute ProgramVO proVo) {
	 * logger.info("cateChecked ajax proVo={}", proVo);
	 * 
	 * ProgramVO proVoResult = new ProgramVO();
	 * proVoResult.setProName(proVo.getProName());
	 * proVoResult.setP(proVo.getProName());
	 * proVoResult.setProName(proVo.getProName());
	 * proVoResult.setProName(proVo.getProName());
	 * proVoResult.setProName(proVo.getProName());
	 * 
	 * 
	 * return proVoResult; }
	 */
	
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
		
		//2
		int cnt=programService.insertProgram(proVo);
		logger.info("프로그램 등록 결과, cnt=", cnt);
				
		String msg="프로그램 등록 실패", url="/career/Admin/programWrite.do";
		if(cnt>0) {
			msg="프로그램이 등록되었습니다.";
			url="/career/Admin/programComplete1.do";
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
		
	
	/*
	 * @RequestMapping("/programComplete1.do") public void programComplete1() {
	 * 
	 * logger.info("programComplete1 프로그램 기본정보 등록완료 디테일 페이지 보여주기"); }
	 */


	@RequestMapping("/programComplete1.do")
	public String programDetail_get(@RequestParam(defaultValue = "0") int programNo,
			Model model) {
		logger.info("programDetail_get 프로그램 파트1 상세보기, 파라미터 programNo={}", programNo);
		
		if(programNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/programWrite.do");
			
			return "common/message";
		}
		
		ProgramVO proVo=programService.selectByProgramNo(programNo);
		logger.info("프로그램 상세보기 결과, proVo={}", proVo);
		
		model.addAttribute("proVo", proVo);
		
		return "career/Admin/programComplete1";
	}

}
