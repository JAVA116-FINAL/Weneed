package com.it.wanted.notice.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.notice.admin.model.NoticeAdminService;
import com.it.wanted.notice.controller.NoticeController;

//이용안내 관리자 컨트롤러
@Controller
@RequestMapping("/admin/noticeService")
public class NoticeAdminController {
	private final static Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired NoticeAdminService noticeAdminService;
	
	@RequestMapping("/noticeQna_list.do")
	public String noticeQna_list(Model model) {
		logger.info("1:1문의 리스트 페이지");
		
		List<Map<String, Object>> qnaList=noticeAdminService.selectQnaList();
		int replyCnt=noticeAdminService.selectReply_cnt();
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("replyCnt", replyCnt);
		
		logger.info("qnaList.size={}", qnaList.size());
		
		return "admin/noticeService/noticeQna_list";
	}
	
	@RequestMapping("/noticeQna_detail.do")
	public String noticeQna_detail(@RequestParam int qna_no, Model model) {
		logger.info("1:1문의 상세보기 페이지 문의번호 qna_no={}", qna_no);
		
		List<Map<String, Object>> userDetail=noticeAdminService.selectQnaDetail_user(qna_no);
		List<Map<String, Object>> adminDetail=noticeAdminService.selectQnaDetail_admin(qna_no);
		
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("adminDetail", adminDetail);
		
		return "admin/noticeService/noticeQna_detail";
	}
	
}
