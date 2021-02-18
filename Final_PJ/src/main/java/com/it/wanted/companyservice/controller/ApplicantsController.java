package com.it.wanted.companyservice.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.Format;
import java.text.SimpleDateFormat;
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
import com.it.wanted.cominfo.model.ComInfoVO;
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
			,@RequestParam(defaultValue = "0") int statusFlag ,@RequestParam(defaultValue = "0") int posNo) {      
		logger.info("기업서비스 지원자 목록 조회 메인페이지");

		//기업 코드 구하기
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		String comCode=comVo.getComCode();


		// 포지션 목록 가져오기
		List<ApplicantsVO> posList = applicantsService.selectAllPositions(comCode);
		logger.info("포지션 목록 조회 결과 posList.size = {}", posList.size());

		List<Map<String, Object>> firstList = applicantsService.selectAll();

		Date time = new Date();
		for (int i = 0; i < firstList.size(); i++) {
			Date appliReg= (Date) firstList.get(i).get("APPLY_REGDATE");
			//변경할 period
			long d = (time.getTime() - appliReg.getTime()) /(24*60*60*1000);

			if(d>15) {
				int no = Integer.parseInt(String.valueOf(firstList.get(i).get("APPLY_NO")));
				int cnt = applicantsService.updateByNo(no);
			}
			firstList.get(i).put("APPLY_PERIOD", d);
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
		appliPagingVo.setComCode(comCode);
		appliPagingVo.setPosNo(posNo);

		model.addAttribute("status",statusFlag);
		model.addAttribute("posNo",posNo);

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

		//응답률 구하기
		int bunmo = applicantsService.countBunmo(appliPagingVo);
		int bunja = applicantsService.countBunja(appliPagingVo);
		double responPer = (double)bunja/ (double)bunmo *100.0;

		model.addAttribute("responPer",String.format("%.1f", responPer));

		logger.info("{}", aList);
		logger.info("전체 지원자 조회 결과 aList.size()={}", aList.size());

		// 3. 모델에 결과 저장
		model.addAttribute("aList", aList);
		model.addAttribute("pagingInfo", pagingInfo);

		model.addAttribute("posList", posList);



		return "company/applicants";
	}

	@RequestMapping(value="/applicantsDetail.do", method=RequestMethod.GET)
	public String applicantsDetail(HttpSession session,@RequestParam(defaultValue = "0") int applyNo, 
			@RequestParam(defaultValue = "0") int posNo ,Model model) {
		logger.info("기업서비스 지원자 상세 조회 및 상태 변경 ");

		//기업 코드 구하기
		ComInfoVO comVo=(ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("session에서 읽어온 cominfoVo comVo={}", comVo);
		String comCode=comVo.getComCode();

		// 포지션 목록 가져오기
		List<ApplicantsVO> posList = applicantsService.selectAllPositions(comCode);
		logger.info("포지션 목록 조회 결과 posList.size = {}", posList.size());
		
		
		logger.info("상세 조회 파라미터 no={}", applyNo);

		ApplicantsVO aVo = applicantsService.selectByNo(applyNo);

		logger.info("상세보기 결과,vo={}", aVo);

		model.addAttribute("aVo", aVo);
		model.addAttribute("posList", posList);
		model.addAttribute("posNo",posNo);
		return "company/applicantsDetail";
	}

	@RequestMapping(value="/applicantsDetail.do", method = RequestMethod.POST)
	public String edit_status(@ModelAttribute ApplicantsVO applicantsVo,
			Model model) {
		//1
		logger.info("글수정 처리, 파라미터 vo={}", applicantsVo);
		logger.info("statusFlag = {}",applicantsVo.getStatusFlag());
		int status = applicantsVo.getStatusFlag();
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		//SimpleDateFormat fmt = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");

		logger.info("timestamp = {}",timestamp);


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

}