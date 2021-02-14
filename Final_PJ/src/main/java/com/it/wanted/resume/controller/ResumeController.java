package com.it.wanted.resume.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.servlet.ModelAndView;

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
	@Autowired private ResumeService resumeService;
	@Autowired private MatchupMemService mcumemService;
	@Autowired private FileUploadUtil fileUploadUtil;
	@Autowired private PdfFileUtil pdfFileUtil; 
	
	//1.인트로화면보여주기
	@RequestMapping("/resumeIntro.do")
	public String resumeIntro() {
		logger.info("이력서소개 화면 보여주기");
		return "resume/resumeIntro";
	}
	
	//2.이력서 등록화면
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
	
	//3.진짜 이력서등록, 하지만 업뎃!
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
	
	//4.이력서 관리화면 
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
	
	//5.이력서 상세보기/수정
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
	
	//6.이력서 수정처리
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
	
	//7. 파일업로드!
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
			logger.info("파일리스트:",fileList);
			
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
	//파일다운로드!!!
	
	//8. pdf파일 생성 다운
	@ResponseBody
	@RequestMapping("/resumeDown.do")
	public int resumeDownload(@RequestParam (defaultValue = "0") int resumeNo, HttpSession session) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("pdf파일 다운로드화면 보여주기,파라미터resumeNo={}",resumeNo);
		
		//2
		ResumeVO rVo=new ResumeVO();
		rVo.setMemNo(memNo);
		rVo.setResumeNo(resumeNo);
		//rVo=resumeService.selectResumeOne(rVo);//샘플 이력서테이블만
		ResumeAllVO rAllVo = resumeService.selectResumeDetail(rVo);
		
		//logger.info("pdf파일 다운로드파라미터 rVo={}",rVo);
		logger.info("pdf파일 다운로드파라미터 rAllVo={}",rAllVo);
		
		int result=0;
		try {
			//pdfFileUtil.createPdf(rAllVo);
			//pdfFileUtil.createPdf(rAllVo, "C:\\Users\\user\\Downloads\\");
			pdfFileUtil.createPdf(rAllVo, "C:\\Users\\jazzo\\Downloads\\");
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
	
	//9.이력서 파일 다운로드
	@RequestMapping("/resumeFileDown.do")
	public ModelAndView resumeFileDown(@RequestParam (defaultValue = "0") int resumeNo, @RequestParam String resumeFile, HttpServletRequest request) {
		//1
		logger.info("이력서 파일 다운로드 파라미터 resumeNo={},resumeFile={}", resumeNo, resumeFile);
		//2
		//3
		Map<String, Object> map=new HashMap<String, Object>();
		String upPath=fileUploadUtil.getUploadPath(FileUploadUtil.RESUME_UP_TYPE, request);
		
		File file=new File(upPath,resumeFile);
		map.put("file", file);
		ModelAndView mav= new ModelAndView("resumeDownloadView",map);
		//4
		return mav;
	}
	
	//10.이력서 지우기
	@ResponseBody
	@RequestMapping("/deleteResume.do")
	public int deleteResume(@RequestParam (defaultValue = "0") int resumeNo, HttpSession session) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서삭제 파라미터 resumeNo={}, memNo={}",resumeNo, memNo);
		
		ResumeVO rVo= new ResumeVO();
		rVo.setMemNo(memNo);
		rVo.setResumeNo(resumeNo);
		logger.info("rVo={}",rVo);
		//2
		int cnt=resumeService.deleteResume(rVo);
		logger.info("삭제 결과 cnt={}, rVo={}", cnt,cnt);
		//3
		//4
		return cnt;
	}
	
	//11.파일이력서 지우기
	@ResponseBody
	@RequestMapping("/deleteResumeFile.do")
	public int deleteResumeFile(@RequestParam (defaultValue = "0") int resumeNo, @RequestParam String resumeFile, HttpServletRequest request, HttpSession session) {
		//1
		int memNo=(Integer) session.getAttribute("mem_no");
		logger.info("이력서 파일 삭제, 파라미터 resumeNo={}, resumeFile={}",resumeNo, resumeFile);
		logger.info("회뭔번호 memNo={}",memNo);
		
		ResumeVO rVo= new ResumeVO();
		rVo.setMemNo(memNo);
		rVo.setResumeNo(resumeNo);
		rVo.setResumeFile(resumeFile);
		logger.info("회뭔번호 rVo={}",rVo);
		
		//2
		int cnt=resumeService.deleteResume(rVo);
		logger.info("삭제 결과 cnt={}, rVo={}", cnt,rVo);
		
		if(cnt>0) {
			String upPath=fileUploadUtil.getUploadPath(FileUploadUtil.IMAGE_TYPE, request);
			File file= new File(upPath, resumeFile);
			if(file.exists()) {
				boolean bool=file.delete();
				logger.info("파일 삭제여부bool={}",bool);
			}
		}
		
		//3
		//4
		return cnt;
	}
	//12.이력서 샘플 파일 다운로드
		@RequestMapping("/resumeSampleFileDown.do")
		public ModelAndView resumeSampleFileDown(HttpServletRequest request) {
			//1
			logger.info("이력서샘플 파일 다운로드");
			//2
			//3
			Map<String, Object> map=new HashMap<String, Object>();
			
			String upPath=request.getSession().getServletContext().getRealPath("/resources/file/");
			
			File file=new File(upPath,"sample_resume_ko.pdf");
			map.put("file", file);
			ModelAndView mav= new ModelAndView("resumeDownloadView",map);
			//4
			return mav;
		}
		
	
	/* 현빈 */
	//pdf파일 생성 다운 - memNo 없는 버전
	@ResponseBody
	@RequestMapping("/matchupPopupResumeDown.do")
	public int resumeDownload(@RequestParam (defaultValue = "0") int resumeNo) {
		//1
	//	logger.info("pdf파일 다운로드, 파라미터 resumeNo={}",resumeNo);
		
		//2
		ResumeAllVO rAllVo = resumeService.selectResumeByResumeNo(resumeNo);
		
		//logger.info("pdf파일 다운로드파라미터 rVo={}",rVo);
		logger.info("pdf파일 다운로드 파라미터 rAllVo={} resumeNo={}", rAllVo, resumeNo);
		String downloadPath="C:\\Users\\jazzo\\Downloads\\";
		
		int result=0;
		try {
			pdfFileUtil.createPdf(rAllVo, downloadPath);
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
		
		return result;
	}
	
}