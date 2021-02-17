package com.it.wanted.companyservice.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.context.annotation.ApplicationScope;

import com.it.wanted.applicants.model.AppliPagingVO;
import com.it.wanted.applicants.model.ApplicantsService;
import com.it.wanted.applicants.model.ApplicantsVO;
import com.it.wanted.common.PaginationInfo;
import com.it.wanted.common.Utility;
import com.itextpdf.text.DocumentException;

@Controller
@RequestMapping("/company")
public class ApplicantsController {

	private static final Logger logger = LoggerFactory.getLogger(ApplicantsController.class);
	@Autowired
	private ApplicantsService applicantsService;


	@RequestMapping("/applicants.do")
	public String applicantsMain(HttpSession session, Model model, @ModelAttribute AppliPagingVO appliPagingVo
			,@RequestParam(defaultValue = "0") int statusFlag ) {      
		logger.info("기업서비스 지원자 목록 조회 메인페이지");

		logger.info("status = {}", statusFlag);
		List<Map<String, Object>> firstList = applicantsService.selectAll();
		
		Date time = new Date();
		for (int i = 0; i < firstList.size(); i++) {
			Date appliReg= (Date) firstList.get(i).get("APPLY_REGDATE");
			//변경할 period
			long d = (time.getTime() - appliReg.getTime()) /(24*60*60*1000);
			
			if(d>15) {
				//aList.get(i).put("STATUS_FLAG",4);	//기간 만료
				//update status_flag = 4로
				int no = Integer.parseInt(String.valueOf(firstList.get(i).get("APPLY_NO")));
				//logger.info("기간 만료로 수정할 no = {}",no);
				int cnt = applicantsService.updateByNo(no);
			}
			firstList.get(i).put("APPLY_PERIOD", d);
			
			//응
		}
		
		//페이징 처리 관련 셋팅
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(appliPagingVo.getCurrentPage());

		//[2] SearchVo 셋팅
		appliPagingVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		appliPagingVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		

		appliPagingVo.setStatusFlag(statusFlag);
		model.addAttribute("status",statusFlag);
		
		List<Map<String, Object>> aList = applicantsService.selectApplicants(appliPagingVo);
		
		for (int i = 0; i < aList.size(); i++) {
			Date appliReg= (Date) aList.get(i).get("APPLY_REGDATE");
			//변경할 period
			long d = (time.getTime() - appliReg.getTime()) /(24*60*60*1000);
			
			aList.get(i).put("APPLY_PERIOD", d);
		}
		
		int totalRecord=applicantsService.selectTotalRecord(appliPagingVo);
		logger.info("글 개수, totalRecord={}", totalRecord);		
		
		pagingInfo.setTotalRecord(totalRecord);
		
		//신규: d>0 && d<=15


		logger.info("{}", aList);
		logger.info("전체 지원자 조회 결과 aList.size()={}", aList.size());

		

		// 포지션 목록 가져오기
		logger.info("채용 포지션 목록 조회");

		List<ApplicantsVO> posList = applicantsService.selectAllPositions();

		logger.info("포지션 목록 조회 결과 posList.size = {}", posList.size());

		// 응답률, 응답일 계산

		// 지원자 목록 전달.. 페이징처리 해야할거같음

		// 3. 모델에 결과 저장
		model.addAttribute("aList", aList);
		model.addAttribute("pagingInfo", pagingInfo);

		model.addAttribute("posList", posList);



		return "company/applicants";
	}

	@RequestMapping(value="/applicantsDetail.do", method=RequestMethod.GET)
	public String applicantsDetail(@RequestParam(defaultValue = "0") int applyNo, Model model) {
		logger.info("기업서비스 지원자 상세 조회 및 상태 변경 ");

		logger.info("상세 조회 파라미터 no={}", applyNo);

		ApplicantsVO aVo = applicantsService.selectByNo(applyNo);
		
		logger.info("상세보기 결과,vo={}", aVo);
		
		model.addAttribute("aVo", aVo);

		return "company/applicantsDetail";
	}
	
	@RequestMapping(value="/applicantsDetail.do", method = RequestMethod.POST)
	public String edit_status(@ModelAttribute ApplicantsVO applicantsVo,
			Model model) {
		//1
		logger.info("글수정 처리, 파라미터 vo={}", applicantsVo);
		
		//2
		int cnt=applicantsService.updateStatus(applicantsVo);
		logger.info("글수정 결과, cnt={}", cnt);
		
		String msg="status 수정 실패", url="/company/applicantsDetail.do?applyNo="+applicantsVo.getApplyNo();
		if(cnt>0) {
			msg="변경되었습니다.";
			url="/company/applicantsDetail.do?applyNo="+applicantsVo.getApplyNo();
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//4
		return "common/message";
	}
	
	/*
	 * @RequestMapping("/applicantsDetail.do") public String
	 * applicantsDetail(@RequestParam(defaultValue = "0") int applyNo, @RequestParam
	 * int statusFlag, Model model,
	 * 
	 * @ModelAttribute ApplicantsVO aVo) { logger.info("기업서비스 지원자 상세 조회 및 상태 변경 ");
	 * 
	 * if(applyNo==0) { model.addAttribute("msg", "잘못된 url입니다.");
	 * model.addAttribute("url", "/company/applicants.do"); return "common/message";
	 * }
	 * 
	 * // 1 logger.info("상세 조회 파라미터 no={}", applyNo);
	 * 
	 * aVo = applicantsService.selectByNo(applyNo); logger.info("상세보기 결과,vo={}",
	 * aVo);
	 * 
	 * // 2 //aVo.setStatusFlag(statusFlag);
	 * 
	 * logger.info("현재 status={}", aVo.getStatusFlag());
	 * logger.info("파라미터 status={}", statusFlag); int cnt =
	 * applicantsService.updateStatus(statusFlag); logger.info("cnt={}",cnt); // 3
	 * model.addAttribute("aVo", aVo);
	 * 
	 * return "company/applicantsDetail"; }
	 */



	//서류통과 테스트
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/statusCheck.do") public List<Map<String, Object>>
	 * statusCheck(@RequestParam(defaultValue = "0") int statusFlag) {
	 * 
	 * logger.info("status = {}", statusFlag); List<Map<String, Object>> aList =
	 * applicantsService.selectApplicants(statusFlag);
	 * 
	 * return aList;
	 * 
	 * }
	 */
}