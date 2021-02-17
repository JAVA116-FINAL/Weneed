package com.it.wanted.career.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.career.admin.model.ProgramAllVO;
import com.it.wanted.career.admin.model.ProgramListVO;
import com.it.wanted.career.admin.model.ProgramSelectAllVO;
import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;
import com.it.wanted.career.admin.model.ProgramVO2;
import com.it.wanted.career.cate.model.CareerCategoryService;
import com.it.wanted.career.cate.model.CareerCategoryVO;
import com.it.wanted.common.FileUploadUtil;
import com.it.wanted.common.PaginationInfo;
import com.it.wanted.common.SearchVO;
import com.it.wanted.common.Utility;

@Controller
@RequestMapping("/career/Admin")
public class ProgramWriteController {

	private static final Logger logger = LoggerFactory.getLogger(ProgramWriteController.class);

	@Autowired
	private CareerCategoryService careerCategoryService;
	@Autowired
	private ProgramService programService;
	@Autowired
	private FileUploadUtil fileUploadUtil;

	// 프로그램 글쓰기(등록) 화면 보여주기

	@RequestMapping(value = "/programWrite.do", method = RequestMethod.GET)
	public void insertGet(HttpSession session, Model model) {
		// 1.
		
		logger.info("프로그램 등록 화면 보여주기");

		List<CareerCategoryVO> ccgList = careerCategoryService.selectCareerCategoryAll();

		logger.info("카테고리 조회 결과 ccgList.size{}=", ccgList.size());

		model.addAttribute("ccgList", ccgList);
		// 4
	}

	// 프로그램 등록하기 (등록 처리)
	@RequestMapping(value = "/programWrite.do", method = RequestMethod.POST)
	public String insertPost(@ModelAttribute ProgramVO proVo, HttpServletRequest request, Model model) {

		logger.info("프로그램 등록 처리, 파라미터 proVo={}", proVo);
		// 파일 업로드

		List<Map<String, Object>> fileList = null;
		String proImage = "";
		try {
			fileList = fileUploadUtil.fileUplaod(request, FileUploadUtil.PRO_IMAGE_TYPE);

			for (Map<String, Object> fileMap : fileList) {
				proImage = (String) fileMap.get("fileName");
				logger.info("imageUrl={}", proImage);
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			logger.info("파일 업로드 실패!");
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("파일 업로드 실패!");
		}

		proVo.setProImage(proImage);

		// 2
		int cnt = programService.insertProgram(proVo);

		String msg = "프로그램 등록 실패", url = "/career/Admin/programWrite.do";
		if (cnt > 0) {
			msg = "프로그램이 기본정보가 등록되었습니다.";
			url = "/career/Admin/programComplete1.do?programNo=" + proVo.getProgramNo();
		}

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	// 프로그램 작성 확인 1 페이지
	@RequestMapping(value = "/programComplete1.do", method = RequestMethod.GET)
	public void programComplete1(@RequestParam int programNo, Model model) {
		logger.info("programComplete1 프로그램 파트1 상세보기, 파라미터 programNo={}", programNo);

		ProgramVO proVo = programService.selectByProgramNo(programNo);
		logger.info("프로그램 등록 1 상세보기 결과, proVo={}", proVo);

		List<CareerCategoryVO> ccgList = careerCategoryService.selectCareerCategoryAll();

		logger.info("카테고리 조회 결과 ccgList.size{}=", ccgList.size());

		model.addAttribute("ccgList", ccgList);		
		model.addAttribute("proVo", proVo);

	}

	// 프로그램 작성 수정 1 뷰페이지
	@RequestMapping(value = "/programEdit1.do", method = RequestMethod.GET)
	public String programEdit1(@RequestParam(defaultValue = "0") int programNo, Model model) {
		logger.info("programEdit1 프로그램 내용1 수정페이지 보여주기 programNo=", programNo);

		List<CareerCategoryVO> ccgList = careerCategoryService.selectCareerCategoryAll();
		logger.info("카테고리 조회 결과 ccgList.size{}=", ccgList.size());
		model.addAttribute("ccgList", ccgList);

		ProgramVO proVo = programService.selectByProgramNo(programNo);

		logger.info("수정화면, 조회 결과 proVo={}", proVo);

		// 3
		model.addAttribute("proVo", proVo);

		// 4
		return "career/Admin/programEdit1";
	}

	// 프로그램 작성 수정 1 수정처리
	@RequestMapping(value = "/programEdit1.do", method = RequestMethod.POST)
	public String programEdit1_post(@RequestParam(defaultValue = "0") int programNo, ProgramVO proVo, Model model,
			HttpServletRequest request) {
		logger.info("프로그램 수정1 처리, 파라미터 proVo={}", proVo);
		// 파일 업로드

		List<Map<String, Object>> fileList = null;
		String proImage = "";
		try {
			fileList = fileUploadUtil.fileUplaod(request, FileUploadUtil.PRO_IMAGE_TYPE);

			for (Map<String, Object> fileMap : fileList) {
				proImage = (String) fileMap.get("fileName");
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
			logger.info("파일 수정 실패!");
		} catch (IOException e) {
			e.printStackTrace();
			logger.info("파일 수정 실패!");
		}

		proVo.setProImage(proImage);

		// 2
		int cnt = programService.updateProgramEdit1(proVo);
		logger.info("프로그램 수정 결과, cnt={}", cnt);

		String msg = "프로그램 수정 실패", url = "/career/Admin/programEdit1.do?prorgramNo="+proVo.getProgramNo();
		if (cnt > 0) {
			msg = "프로그램의 기본정보가 수정되었습니다.";
			url = "/career/Admin/programComplete1.do?programNo=" + proVo.getProgramNo();
		}

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	
	/* 프로그램 작성 2 뷰페이지 */
	@RequestMapping(value = "/programWrite2.do", method = RequestMethod.GET)
	public void programWrite2(@RequestParam(defaultValue = "0") int programNo, HttpSession session, HttpServletRequest request) {
		logger.info("programWrite2 관리자 프로그램 내용 등록 페이지 보여주기 programNo={}", programNo);
	}

	
	
	/* 프로그램 작성 2 등록처리 */

	@RequestMapping(value="/programWrite2.do", method=RequestMethod.POST)
	public String insertProgram2_post(@ModelAttribute ProgramAllVO proAllVo, int programNo,
			HttpServletRequest request, Model model) {
		/*
		 * String userid =(String) session.getAttribute("userid");
		 * vo.setCustomerId(userid);
		 */
		
		logger.info("프로그램등록 2, 파라미터 proAllVo={}", proAllVo);
		List<ProgramVO2> proVo2List = proAllVo.getProVo2List();
		  int cnt=0; 
		  if(proVo2List != null && !proVo2List.isEmpty()) { 
			  for(ProgramVO2 proVo2Con :proVo2List) { 
				  logger.info("파라미터 proVo2Con={}", proVo2Con);

				  cnt = programService.insertIntoProgramContents(proVo2Con);
				
			logger.info("프로그램등록 2 처리 결과 cnt={}, proVo2Con={}", cnt, proAllVo);
		}
	}

		String msg = "내용 등록 실패", url = "/career/Admin/programWrite2.do";
		if (cnt>0) {
			msg = "프로그램 내용이 등록되었습니다.";
			url = "/career/Admin/programCompleteAll.do?programNo=" + programNo;
		}

		// 3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";		
	}
		

	/* 프로그램 목록 */

	@RequestMapping("/programAdminList.do")
	public String programAdminListShow(@ModelAttribute SearchVO searchVo, Model model) {
		// 1

		logger.info("글 목록 페이지, 파라미터 searchVo={}", searchVo);

		// 2
		// 페이징 처리 관련 셋팅
		// [1]PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// [2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());

		int totalRecord = programService.selectListTotalRecord(searchVo);
		logger.info("글 개수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		List<ProgramVO> plist = programService.selectAllprogram(searchVo);
		logger.info("글목록 결과, plist.size={}", plist.size());

		// 3. 모델에 결과 저장
		model.addAttribute("plist", plist);
		model.addAttribute("pagingInfo", pagingInfo);

		// 4. 뷰페이지 리턴
		return "career/Admin/programAdminList";

	}
	

	/* (관리자) 프로그램 상세페이지 */
	@RequestMapping("/programDetail.do")
	public String programDetail_get(@RequestParam int programNo, HttpSession session, Model model) {
		logger.info("programDetail_get 프로그램 상세보기, 파라미터 programNo={}", programNo);
		
		if (programNo == 0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/career/Admin/programAdminList.do");

			return "common/message";
		}

		List<ProgramVO2> proConList = new ArrayList<ProgramVO2>();
		proConList = programService.selectProgramContentsView(programNo);
		logger.info("프로그램 내용 상세보기 결과, proConList.size={}", proConList.size());

		ProgramVO proVo = new ProgramVO();
		proVo=programService.selectProgramView(programNo);
		logger.info("프로그램 기본 상세보기 조회, 결과 proVo={}", proVo);
		 
		
		model.addAttribute("proConList", proConList);
		model.addAttribute("proVo", proVo);
		 

		return "career/Admin/programDetail";
	}
	
	
	/* 프로그램 2단계 수정 페이지 보여주기*/
	@RequestMapping(value="/programEditTotal.do", method=RequestMethod.GET)
	public void programEditTotal(@RequestParam int programNo, HttpSession session, Model model) {
		logger.info("programEditTotal 프로그램 2단계 수정페이지 보여주기");

		List<ProgramVO2> proConList = new ArrayList<ProgramVO2>();
		proConList = programService.selectProgramContentsView(programNo);
		logger.info("프로그램 내용 상세보기 결과, proConList.size={}", proConList.size());
		
		model.addAttribute("proConList", proConList);

	}

	
	/* 프로그램 2단계 수정 처리*/
	  @RequestMapping(value="/programEditTotal.do", method=RequestMethod.POST)
	  public String EditTotal_post(@RequestParam int programNo, Model model, ProgramAllVO proAllVo, HttpSession session) { 
			
		  
		  
			List<ProgramVO2> proConList =proAllVo.getProVo2List();
			logger.info("프로그램 내용 상세보기 결과, proConList.size={}", proConList.size());
			
			  int cnt=0; 
			  if(proConList != null && !proConList.isEmpty()) { 
				  for(ProgramVO2 proVo2Con :proConList) { 
					  logger.info("파라미터 proVo2Con={}", proVo2Con);

					  cnt = programService.updateProgramEditTotal(proVo2Con);
					
				logger.info("프로그램 내용부분 수정 처리 결과 cnt={}, proVo2Con={}", cnt, proVo2Con);
			}
		}
	  
		// 2 
		
		  String msg = "프로그램 수정 실패", url = "/career/Admin/programEditTotal.do?prorgramNo="+ programNo; 
		  if (cnt > 0) { 
			  msg = "프로그램이 수정되었습니다."; 
			  url = "/career/Admin/programDetail.do?programNo=" + programNo; 
		  }
		  
		  // 3 
		  model.addAttribute("msg", msg); 
		  model.addAttribute("url", url);
		  
		  return "common/message";
		  
	  }
	  
	 
	  
	  
	  
	  /* 프로그램 한개 삭제 뷰페이지  */
		@RequestMapping(value="/programDelete.do", method=RequestMethod.GET)
		public String programDelete_get(@RequestParam (defaultValue = "0") int programNo, Model model) {
			logger.info("programDelete 프로그램 내용1 삭제페이지 보여주기 파라미터 programNo={}", programNo);
			
			  
			/*
			 * if(programNo==0) { model.addAttribute("msg", "잘못된 url입니다.");
			 * model.addAttribute("url", "/career/Admin/programAdminList.do"); return
			 * "common/message"; }
			 */
			/*
			 * ProgramVO proVo = new ProgramVO(); proVo =
			 * programService.selectByProgramNo(programNo);
			 * 
			 * model.addAttribute("proVo", proVo); logger.info("파라미터 proVo={}", proVo);
			 */
	 
			 return "career/Admin/programDelete";
		}	  
	  
	  
	/* 프로그램 한개 삭제 */
	
	  @RequestMapping(value="/programDelete.do", method = RequestMethod.POST)
	  public String programDelete_post(@RequestParam int programNo, Model model) {
		  //1
		  logger.info("프로그램 삭제 처리, 파라미터 proVo={}", programNo);
			/*
			 * int programNo = programVo.getProgramNo();
			 */			
		  ProgramVO proVo = programService.selectByProgramNo(programNo);
		  //2
		  int cnt=programService.deleteOneProgram(proVo);
		  logger.info("프로그램 결과, cnt={}", cnt);

			String msg="프로그램 삭제 실패", url="/career/Admin/programDelete.do?programNo="+proVo.getProgramNo();
			if(cnt>0) {
				msg="글삭제되었습니다.";
				url="/career/Admin/programAdminList.do";
			}

			//3
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			//4
			return "common/message";
		}
	 
		
	  

	/* 프로그램 여러 개 삭제 */
	
	  @RequestMapping("/deleteProgramMulti.do") 
	  public String delMulti(@ModelAttribute ProgramListVO programListVo, HttpServletRequest request, Model model) {
		  
		  logger.info("선택한 프로그램 삭제 처리, 파라미터 programListVo={}", programListVo);
	  
		  List<ProgramVO> proList=programListVo.getProItems();
		  logger.info("선택한 프로그램 삭제 결과, proList={}", proList);
	  
		  int cnt=programService.deleteProgramMulti(proList);
		  logger.info("선택한 프로그램 삭제 결과, cnt={}", cnt);
	  
		  String msg="선택한 프로그램 삭제 실패!", url="/career/Admin/programAdminList.do";
		 
		  if(cnt>0) { 
			  msg="선택한 프로그램들을 삭제하였습니다.";
			  
			  for(int i=0;i<proList.size();i++) { 
				  ProgramVO proVo=proList.get(i);
			  
				  logger.info("[{}] : programNo={}", i, proVo.getProgramNo());
				  logger.info("proImage={}", proVo.getProImage());

				  int programNo=proVo.getProgramNo(); 
				  
				  if(programNo!=0) { 
					  //체크된 것만 파일삭제 
					 
						String upPath = fileUploadUtil.getUploadPath(FileUploadUtil.PRO_IMAGE_TYPE, request);
					
					  File delFile = new File(upPath, proVo.getProImage()); 
					  
					  if(delFile.exists()) {
						  boolean bool =delFile.delete(); 
						  logger.info("상품 이미지 파일 삭제 여부:{}", bool); 
					  } 
				  }
			  }//for 
		  }

		  model.addAttribute("msg", msg); 
		  model.addAttribute("url", url);
		  
		  return "common/message"; 
		  
		  }
		 
	  
	  
	  
	  


	@RequestMapping("/programCompleteAll.do")
	public void programCompleteAll() {
		logger.info("programCompleteAll 프로그램 등록완료 페이지 보여주기");
	}

	/*
	 * @RequestMapping("/programDetail.do") public void programDetail() {
	 * logger.info("programDetail 프로그램 등록 미리보기 페이지 보여주기"); }
	 */


}