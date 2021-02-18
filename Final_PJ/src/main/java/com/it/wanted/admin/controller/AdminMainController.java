package com.it.wanted.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.applicants.model.ApplicantsService;
import com.it.wanted.common.PaginationInfo;
import com.it.wanted.common.SearchVO;
import com.it.wanted.common.Utility;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchupCom.model.MatchupComService;
import com.it.wanted.matchupStatus.model.MatchupStatusService;
import com.it.wanted.position.model.PositionService;
import com.it.wanted.resume.model.ResumeService;


@Controller
@RequestMapping("/admin")
public class AdminMainController {
	@Autowired ResumeService resumeService;
	@Autowired ApplicantsService applyService;
	@Autowired MatchupMemService matchupMemService;
	@Autowired MatchupComService matchupComService;
	@Autowired MatchupStatusService matchupStatusService;
	@Autowired PositionService positionService;
	private Logger logger=LoggerFactory.getLogger(AdminMainController.class);
	
	@RequestMapping("/index.do")
	public void adminMain() {
		logger.info("위니드 관리자 메인페이지 조회");
	}

	/* 자연0215 */
	@RequestMapping("/adminResume.do")
	public String adminResume(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("위니드 등록이력서 조회 searchVo={}",searchVo);
		//2
		
		//[1]페이지셋팅
		PaginationInfo pagingInfo= new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2]searchVo셋팅
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> resumeList = resumeService.selectResumeAllbyAdmin(searchVo);
		logger.info("글목록 결과 resumeList.size()", resumeList.size());
		
		int totalRecord=resumeService.selectTotalRecord(searchVo);
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/adminResume";
	}
	
	@RequestMapping("/adminApply.do")
	public String adminApply(@ModelAttribute SearchVO searchVo,Model model) {
		//1
		logger.info("지원 조회 searchVo={}",searchVo);
		//2
		//[1]페이지인포 셋팅
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2]searchVo셋팅
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> applyList = applyService.selectApplyAllbyAdmin(searchVo);
		logger.info("글목록 결과 applyList.size()", applyList.size());
		
		int totalRecord=applyService.selectTotalRecordbyAdmin(searchVo);
		logger.info("totalRecord={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("applyList", applyList);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		
		return "admin/adminApply";
	}
	
	//2/15 어드민 매치업멤리스트 조회
	@RequestMapping("/adminMatchup.do")
	public String adminMatchup() {
		logger.info("매치업현황 화면보여주기");
		return "admin/adminMatchup";
	}
	
	
	@RequestMapping("/adminMatchupMem.do")
	public String adminMatchupMem(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("adminMatchupMem조회 파라미터 searchVo={}",searchVo);
		//2
		//[1]pagingInfo셋팅
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2]searchVo셋팅
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> mcumemList = matchupMemService.selectMatchupMemAllbyAdmin(searchVo);
		logger.info("매치업 조회 mcumemList.size()",mcumemList.size());
		int totalRecord=matchupMemService.totalRecordbyAdmin(searchVo);
		logger.info("매치업 조회 총 레코드수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("mcumemList", mcumemList);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "admin/adminMatchupMem";
	}

	@RequestMapping("/adminMatchupCom.do")
	public String adminMatchupCom(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("adminMatchupCom조회 파라미터 searchVo={}",searchVo);
		//2
		//[1]pagingInfo셋팅
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2]searchVo셋팅
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> mcucomList = matchupComService.selectMatchupComAllbyAdmin(searchVo);
		logger.info("매치업 조회 mcucomList.size()",mcucomList.size());
		int totalRecord=matchupComService.selectTotalRordbyAdmin(searchVo);
		logger.info("매치업 조회 총 레코드수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("mcucomList", mcucomList);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "admin/adminMatchupCom";
	}
	
	@RequestMapping("/adminMatchupStatus.do")
	public String adminMatchupStatus(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("adminMatchupStatus조회 파라미터 searchVo={}",searchVo);
		//2
		//[1]pagingInfo셋팅
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2]searchVo셋팅
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> mcustatusList = matchupStatusService.selectMatchupStatusbyAdmin(searchVo);
		logger.info("매치업현황 조회 mcustatusList.size()",mcustatusList.size());
		int totalRecord=matchupStatusService.selectTotalRecordbyAdmin(searchVo);
		logger.info("매치업 조회 총 레코드수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("mcustatusList", mcustatusList);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "admin/adminMatchupStatus";
	}
	
	/* 0216자연 */
	@RequestMapping("/adminPosition.do")
	public String adminPosition(@ModelAttribute SearchVO searchVo, Model model) {
		//1
		logger.info("adminPosition 조회 파라미터 searchVo={}",searchVo);
		//2
		//[1]pagingInfo셋팅
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2]searchVo셋팅
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<Map<String, Object>> posList = positionService.selectPositionAllbyAdmin(searchVo);
		logger.info("포지션 조회 posList.size()",posList.size());
		int totalRecord=positionService.selectTotalRecordbyAdmin(searchVo);
		logger.info(" 포지션조회 총 레코드수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		//3
		model.addAttribute("posList", posList);
		model.addAttribute("pagingInfo", pagingInfo);
		//4
		return "admin/adminPosition";
	}

	
}
