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

import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;
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
	
	@Autowired private CareerCategoryService careerCategoryService;
	@Autowired private ProgramService programService;
	@Autowired private FileUploadUtil fileUtil;
	
	
	//프로그램 글쓰기(등록) 화면 보여주기

	@RequestMapping(value="/programWrite.do", method=RequestMethod.GET)
	public void insertGet(Model model){
		//1. 
		logger.debug("상품 등록 화면 보여주기");

		List<CareerCategoryVO> ccgList=careerCategoryService.selectCareerCategoryAll();
		
		logger.debug("카테고리 조회 결과 ccgList.size{}=", ccgList.size());
		
		model.addAttribute("ccgList", ccgList);
		//4
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

	
	@RequestMapping("/programAdminList.do")
	public String list(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("글 목록 페이지, 파라미터 searchVo={}", searchVo);
		
		//2
		//페이징 처리 관련 셋팅
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<ProgramVO> plist=programService.selectAll(searchVo);
		logger.info("글목록 결과, plist.size={}", plist.size());
		
		int totalRecord=programService.selectTotalRecord(searchVo);
		logger.info("글 개수, totalRecord={}", totalRecord);		
		pagingInfo.setTotalRecord(totalRecord);

		//3. 모델에 결과 저장
		model.addAttribute("plist", plist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//4. 뷰페이지 리턴
		return "career/Admin/programList";
	}	
	
	
	
	
	

	@RequestMapping("/programWrite2.do")
	public void programWrite2() {
		logger.info("programWrite2 관리자 프로그램 내용 등록 페이지 보여주기");
	}

	@RequestMapping("/programEdit1.do")
	public void programEdit1() {
		logger.info("programEdit1 프로그램 내용1 수정페이지 보여주기");
	}

	@RequestMapping("/programDelete.do")
	public void programDelete() {
		logger.info("programDelete 프로그램 내용1 삭제페이지 보여주기");
	}


	@RequestMapping("/programCompleteAll.do")
	public void programCompleteAll() {
		logger.info("programCompleteAll 프로그램 등록완료 페이지 보여주기");
	}

	@RequestMapping("/programDetail.do")
	public void programDetail() {
		logger.info("programDetail 프로그램 등록 미리보기 페이지 보여주기");
	}

	@RequestMapping("/programEditTotal.do")
	public void programEditTotal() {
		logger.info("programEditTotal 프로그램 전체 수정페이지 보여주기");
	}



	
}

