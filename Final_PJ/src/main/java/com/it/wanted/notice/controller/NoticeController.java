package com.it.wanted.notice.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.notice.cate.model.NoticeCateService;
import com.it.wanted.notice.model.NoticeService;
import com.it.wanted.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private final static Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired NoticeService noticeService;
	@Autowired NoticeCateService noticeCateService;
	
	
	@RequestMapping("/notice.do")
	public String notice(Model model) {
		logger.info("notice메인 출력");
		
		List<Map<String, Object>>listMain1=noticeService.selectMain1();
		List<Map<String, Object>>listMain2=noticeService.selectMain2();
		List<Map<String, Object>>listMain3=noticeService.selectMain3();
		
		model.addAttribute("listMain1", listMain1);
		model.addAttribute("listMain2", listMain2);
		model.addAttribute("listMain3", listMain3);
		
		logger.info("개인회원 자주 묻는 질문={}", listMain1);
		logger.info("기업회원 자주 묻는 질문={}", listMain2);
		logger.info("원티드 소식={}", listMain3);
		
		return "notice/notice";
	}
	
	@RequestMapping("/notice_qna.do")
	public void notice_qna() {
		logger.info("notice_qna 출력");
	}
	
	@RequestMapping("/notice_dept1.do")
	public String notice_dept1(@RequestParam(defaultValue = "0") int notice_dept1, Model model) {
		logger.info("notice_dept1 출력, notice_dept1={}", notice_dept1);
		
		String notice_dept1_info=noticeCateService.selectCate1(notice_dept1); //대분류명 받아옴
		
		List<Map<String, Object>>listDept2Count=noticeCateService.selectDept2Count(notice_dept1); //카테고리 개수 받아옴
		
		model.addAttribute("notice_dept1", notice_dept1);
		model.addAttribute("listDept2Count", listDept2Count);
		model.addAttribute("notice_dept1_info", notice_dept1_info); //대분류명 보내기
		
		logger.info("notice_dept1_info={}", notice_dept1_info);
		logger.info("listDept2Count.size={}", listDept2Count.size());		
		
		return "notice/notice_dept1";
	}
	
	@RequestMapping("/notice_dept2.do")
	public String notice_dept2(@RequestParam(defaultValue = "0") int notice_dept2, 
			Model model) {
		logger.info("notice_dept2 출력, notice_dept2={}", notice_dept2);
		
		Map<String, Object>selectDept2Info=noticeCateService.selectDept2Info(notice_dept2); //소분류 레코드 받아옴
		List<NoticeVO> listDept2=noticeService.select_dept2(notice_dept2);
		
		model.addAttribute("listDept2", listDept2);
		model.addAttribute("selectDept2Info", selectDept2Info);
		
		logger.info("listDept2={}", listDept2);
		logger.info("selectDept2Info={}", selectDept2Info);
		
		return "notice/notice_dept2";
	}
	
	@RequestMapping("/notice_detail.do")
	public String notice_detail(@RequestParam(defaultValue = "0") int notice_no, 
			Model model) {
		logger.info("notice_detail 출력, notice_no={}", notice_no);

		Map<String, Object>listDetail=noticeService.selectDetail(notice_no);
		
		model.addAttribute("listDetail", listDetail);
		logger.info("listDetail={}", listDetail);
		
		return "notice/notice_detail";
	}
	
	@RequestMapping("/notice_result.do")
	public void notice_result() {
		logger.info("notice_result 출력");
	}
	
	@RequestMapping("/notice_inc/notice_showByDept2.do")
	public String notice_selectByDept2(@RequestParam(defaultValue = "0") int notice_dept2,
			Model model) {
		
		List<Map<String, Object>>listByDept2=noticeService.selectByDept2(notice_dept2);
		model.addAttribute("listByDept2", listByDept2);
		model.addAttribute("listByDept2Count", listByDept2.size());
		
		return "notice/notice_inc/notice_showByDept2";
	}
	
	@RequestMapping("/notice_inc/notice_other.do")
	public String noticeOther(@RequestParam(defaultValue = "0")int notice_dept2, 
			Model model) {
		logger.info("이 섹션의 문서, notice_dept2={}", notice_dept2);
		
		List<Map<String, Object>> listOther=noticeService.selectOther(notice_dept2);
		model.addAttribute("listOther", listOther);
		
		return "notice/notice_inc/notice_other";
	}
	
	@RequestMapping(value = "/notice_search.do", method = RequestMethod.POST)
	public String noticeSearch(HttpServletRequest request, Model model) {
		String keyword=request.getParameter("keyword");
		logger.info("notice_search 출력, keyword={}", keyword);
		
		List<Map<String, Object>>listSelect=noticeService.noticeSearch(keyword);
		Map<String, Object>listSelectCnt=noticeService.noticeSearchCnt(keyword);
		
		model.addAttribute("listSelect", listSelect);
		model.addAttribute("listSelectCnt", listSelectCnt);
		model.addAttribute("keyword", keyword);
		
		logger.info("listSelect.size={}", listSelect.size());
		logger.info("listSelectCnt={}", listSelectCnt);
		
		return "notice/notice_search";
	}
	
	@RequestMapping("/notice_inc/notice_split.do")
	public String noticeSplit(@RequestParam (defaultValue = "0") String notice_content,
			String notice_keyword, Model model) {
		logger.info("notice_content={}", notice_content);
		logger.info("notice_keyword={}", notice_keyword);
		
		NoticeUtility util=new NoticeUtility();
		
		String content=util.splitContent(notice_content, notice_keyword);
		
		model.addAttribute("content", content);
		
		logger.info("notice_split 파라미터 content={}", content);
		
		return "notice/notice_inc/notice_split";
	}
	
}
