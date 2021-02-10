package com.it.wanted.notice.admin.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.common.PaginationInfo;
import com.it.wanted.notice.admin.model.NoticeAdminService;
import com.it.wanted.notice.controller.NoticeController;
import com.it.wanted.notice.model.QnaVO;
import com.it.wanted.notice.utility.KeywordVO;
import com.it.wanted.notice.utility.NoticePagination;
import com.it.wanted.notice.utility.NoticePagingUtility;

//이용안내 관리자 컨트롤러
@Controller
@RequestMapping("/admin/noticeService")
public class NoticeAdminController {
	private final static Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired NoticeAdminService noticeAdminService;
	
	@RequestMapping(value = "/noticeQna_detail.do")
	public String noticeQna_detail_get(@RequestParam int qna_no, Model model) {
		logger.info("1:1문의 상세보기 페이지 문의번호 qna_no={}", qna_no);
		
		List<Map<String, Object>> userDetail=noticeAdminService.selectQnaDetail_user(qna_no);
		List<Map<String, Object>> adminDetail=noticeAdminService.selectQnaDetail_admin(qna_no);
		
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("adminDetail", adminDetail);
		
		return "admin/noticeService/noticeQna_detail";
	}
	
	@RequestMapping("/noticeQna_list.do")
	public String noticeQna_list(@ModelAttribute KeywordVO keywordVo, Model model){
		logger.info("1:1문의 리스트 페이지, keywordVo={}", keywordVo);
		
		NoticePagination pagingInfo=new NoticePagination();
		pagingInfo.setBlockSize(NoticePagingUtility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(keywordVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		
		keywordVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		keywordVo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		
		List<QnaVO> listSearch=noticeAdminService.selectQnaList_search(keywordVo);
		Map<String, Object> listCnt=noticeAdminService.selectQnaList_cnt(keywordVo);
		
		int replyCnt=noticeAdminService.selectReply_cnt();
		
		int totalRecord=Integer.parseInt(String.valueOf(listCnt.get("CNT")));
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("replyCnt", replyCnt);
		
		logger.info("listSearch={}", listSearch);
		logger.info("listSearch.size={}", listSearch.size());
		
		return "admin/noticeService/noticeQna_list"; 
	}
	
}
