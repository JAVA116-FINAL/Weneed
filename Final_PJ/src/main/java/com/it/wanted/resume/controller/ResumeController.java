package com.it.wanted.resume.controller;


import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonParser;
import com.it.wanted.common.FileUploadUtil;
import com.it.wanted.common.PdfFileUtil;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeService;
import com.it.wanted.resume.model.ResumeVO;
import com.itextpdf.text.DocumentException;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private static final Logger logger=LoggerFactory.getLogger(ResumeController.class);
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private MatchupMemService mcumemService;
	@Autowired
	private FileUploadUtil fileUploadUtil;
	@Autowired
	private PdfFileUtil pdfFileUtil; 
	
	//인트로화면보여주기
	@RequestMapping("/resumeIntro.do")
	public String resumeIntro() {
		logger.info("이력서소개 화면 보여주기");
		return "resume/resumeIntro";
	}
	
	//이력서 등록화면
	@RequestMapping(value = "/resumeRegister.do", method = RequestMethod.GET)
	public String resumeRegister_get(HttpSession session, Model model) {
		//1
		String email=(String) session.getAttribute("email");
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서 글쓰기 화면 보여주기,email={}, memNo={}",email,memNo);
		
		//2  DB작업 //이 때인서트를 하고 보여줘야할듯
		ResumeVO resumeVo=new ResumeVO();
		resumeVo.setMemNo(memNo);
		int cnt = resumeService.insertResume(resumeVo);
		logger.info("resume insert결과=cnt{}",cnt);
		
		if(cnt>0) {
			resumeVo=resumeService.selectResume(memNo);
			logger.info("resume select 결과=resumeVo{}",resumeVo);
		}
				
		//3
		model.addAttribute("resumeVo", resumeVo);
		//4
		return "resume/resumeRegister";
	}
	
	//진짜 이력서등록, 하지만 업뎃!
	@RequestMapping(value = "resumeRegister.do", method = RequestMethod.POST)
	public String resumeRegister_post(@ModelAttribute ResumeAllVO rAllVo,Model model) {
		//1 날짜 받아와서 셋팅해야함. 임시저장플래그처리
		logger.info("이력서 등록하기 파라미터 rAllVo={}",rAllVo);		
		
		//2
		int cnt=resumeService.updateResume(rAllVo);
		logger.info("update결과=cnt{}",cnt);
		
		if(cnt<1) {
			model.addAttribute("msg","이력서 등록실패");
			model.addAttribute("url","/resume/resumeList.do");
			return "common/message";
		}
		//3
		//4
		return "redirect:/resume/resumeList.do";
		
	}
	
	//이력서 관리화면 
	@RequestMapping("/resumeList.do")
	public String resumeList(HttpSession session, Model model) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서 관리 화면 보여주기 memNo={}",memNo);
		
		//2 회원번호로 이력서 테이블 불러오기, 매치업이력서 번호 확인 
		List<ResumeVO> resumeList = resumeService.selectResumeAll(memNo);
		logger.info("이력서 조회결과 resumeList.size()={}", resumeList.size());
		
		int cnt=mcumemService.isMatchupMem(memNo);
		logger.info("매치업 조회결과 cnt={}", cnt);
		if(cnt>0) {
			int mcuResumeNo=mcumemService.selectmcuResumeNo(memNo);
			logger.info("매치업 이력서번호 mcuResumeNo={}", mcuResumeNo);
		
			if(mcuResumeNo>0) { 
				model.addAttribute("mcuResumeNo", mcuResumeNo); 
			}
		}

		

		//3
		model.addAttribute("resumeList", resumeList);
		//4
		return "resume/resumeList";
	}
	
	//이력서 상세보기/수정
	@RequestMapping("/resumeDetail.do")
	public String resumeDetail(@RequestParam (defaultValue = "0")int resumeNo, HttpSession session, Model model) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서 상세보기 화면보여주기 파라미터 resumeNo={}, memNo={}",resumeNo, memNo);
		ResumeVO rVo= new ResumeVO();
		rVo.setMemNo(memNo);
		rVo.setResumeNo(resumeNo);
		//2
		ResumeAllVO rAllVo = resumeService.selectResumeDetail(rVo);
		logger.info("이력서 상세보기 결과rAllVo={}",rAllVo);
		//3
		model.addAttribute("rAllVo", rAllVo);
		//4
		return "resume/resumeDetail";
		
	}
	
	@RequestMapping(value = "/resumeEdit.do", method = RequestMethod.POST)
	public String resumeEdit(@ModelAttribute ResumeAllVO rAllVo, Model model) {
		//1 날짜 받아와서 셋팅해야함. 임시저장플래그처리
		logger.info("이력서 등록하기 파라미터 rAllVo={}",rAllVo);		
		
		//2
		int cnt=resumeService.updateResume(rAllVo);
		logger.info("update결과,cnt={}",cnt);
		
		if(cnt<1) {
			ResumeVO rVo = rAllVo.getResumeVo();
			model.addAttribute("msg","이력서 등록실패");
			model.addAttribute("url","/resume/resumeDetail.do?resumeNo="+rVo.getResumeNo());
			return "common/message";
		}
		//3
		//4
		return "redirect:/resume/resumeList.do";
		
	}
	
	
	
	//파일업로드!
	@ResponseBody
	@RequestMapping(value = "/resumefileUpload.do", method = RequestMethod.POST)
	public ResumeVO resumefileUpload( HttpSession session, HttpServletRequest request) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서파일 등록하기 화면, memNo={}" , memNo);
		//2
		
		ResumeVO rVo=new ResumeVO();
		rVo.setMemNo(memNo);
		
		List<Map<String, Object>> fileList=null;
		String resumeFile="";
		try {
			fileList=fileUploadUtil.fileUplaod(request, FileUploadUtil.RESUME_UP_TYPE);
			for (Map<String, Object> fileMap:fileList) {
				resumeFile=(String) fileMap.get("fileName");
				logger.info("resumeFile={}",resumeFile);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			logger.info("파일업로드 실패!!");
		}catch (IOException e) {
			e.printStackTrace();
			logger.info("파일업로드 실패!!");
		}
		rVo.setResumeFile(resumeFile);
		
		int cnt=resumeService.insertResumeFile(rVo);
		if(cnt>0) {
			rVo=resumeService.selectResume(memNo);
		}
		//3
		//4
		return rVo;
	}
	
	//pdf파일 생성 다운
	@ResponseBody
	@RequestMapping("/resumeDown.do")
	public int resumeDownload(@RequestParam (defaultValue = "0")int resumeNo, HttpSession session) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("pdf파일 다운로드화면 보여주기,파라미터resumeNo={}",resumeNo);
		
		//2
		ResumeVO rVo=new ResumeVO();
		rVo.setMemNo(memNo);
		rVo.setResumeNo(resumeNo);
		rVo=resumeService.selectResumeOne(rVo);
		logger.info("pdf파일 다운로드파라미터 rVo={}",rVo);
		int result=0;
		try {
			pdfFileUtil.createPdf(rVo);
			result=1;
		} catch (DocumentException e) {
			e.printStackTrace();
			result=0;
		} catch (IOException e) {
			e.printStackTrace();
			result=0;
		}
		//3
		//4
		//JsonParser jsonParser = JsonParser.parse(result);
		
		return result;
		
	}
	
	//이력서 지우기
	@ResponseBody
	@RequestMapping("/deleteResume.do")
	public int deleteResume(@RequestParam int resumeNo, HttpSession session) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서삭제 파라미터 resumeNo={}, memNo={}",resumeNo, memNo);
		
		ResumeVO rVo= new ResumeVO();
		rVo.setMemNo(memNo);
		rVo.setResumeNo(resumeNo);
		//2
		int cnt=resumeService.deleteResume(rVo);
		logger.info("삭제 결과 cnt={}, rVo={}", cnt,rVo);
		//3
		//4
		return cnt;
	}
	
	
	
}
