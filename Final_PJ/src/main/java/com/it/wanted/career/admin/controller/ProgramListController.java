package com.it.wanted.career.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.wanted.career.admin.model.ProgramService;
import com.it.wanted.career.admin.model.ProgramVO;


@Controller
@RequestMapping("/career/Admin")
public class ProgramListController {
	private static final Logger logger
		=LoggerFactory.getLogger(ProgramListController.class);
	
	@Autowired
	private ProgramService programService;
	
	@RequestMapping("/programList.do")
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
	
}
