package com.it.wanted.notice.admin.controller;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.notice.admin.model.NoticeAdminService;
import com.it.wanted.notice.model.QnaReplyVO;
import com.it.wanted.notice.utility.EmailSender;
import com.it.wanted.notice.utility.NoticePagination;
import com.it.wanted.notice.utility.NoticePagingUtility;
import com.it.wanted.notice.utility.NoticeSearchVO;

//이용안내 관리자 컨트롤러
@Controller
@RequestMapping("/admin/noticeService")
public class NoticeAdminController {
	private static final Logger logger
		=LoggerFactory.getLogger(NoticeAdminController.class);
	
	@Autowired NoticeAdminService noticeAdminService;
	@Autowired EmailSender emailSender;
	
	@RequestMapping(value = "/noticeQna_detail.do")
	public String noticeQna_detail(@RequestParam int qna_no, Model model) {
		logger.info("1:1문의 상세보기 페이지 문의번호 qna_no={}", qna_no);
		
		List<Map<String, Object>> userDetail=noticeAdminService.selectQnaDetail_user(qna_no);
		List<Map<String, Object>> adminDetail=noticeAdminService.selectQnaDetail_admin(qna_no);
		
		model.addAttribute("userDetail", userDetail);
		model.addAttribute("adminDetail", adminDetail);
		
		logger.info("userDetail={}", userDetail);
		logger.info("adminDetail={}", adminDetail);
		
		return "admin/noticeService/noticeQna_detail";
	}
	
	@RequestMapping("/noticeQna_list.do")
	public String noticeQna_list(@ModelAttribute NoticeSearchVO searchVo, Model model){
		logger.info("1:1문의 리스트 페이지, searchVo={}", searchVo);
		
		NoticePagination pagingInfo=new NoticePagination();
		pagingInfo.setBlockSize(NoticePagingUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		
		List<Map<String, Object>> listSearch=noticeAdminService.selectQnaList_search(searchVo);
		
		int replyCnt=noticeAdminService.selectReply_cnt(searchVo);
		
		pagingInfo.setTotalRecord(noticeAdminService.selectQnaList_cnt(searchVo));
		
		model.addAttribute("listSearch", listSearch);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("replyCnt", replyCnt);
		
		logger.info("listSearch={}", listSearch);
		logger.info("listSearch.size={}", listSearch.size());
		logger.info("미답변 문의 cnt={}", replyCnt);
		
		return "admin/noticeService/noticeQna_list"; 
	}
	
	@RequestMapping("/noticeQna_write.do")
	public String noticeQna_write(@ModelAttribute QnaReplyVO qnaReplyVo, 
			Model model, HttpServletRequest request) {
		logger.info("qnaReplyVo={}", qnaReplyVo);
		
		//답변 등록, 답변여부 업데이트
		int cnt=noticeAdminService.insertQnaReply(qnaReplyVo);
		int updateCnt=noticeAdminService.updateReply(qnaReplyVo.getQna_no());
		
		String msg="1:1문의 답변 등록 실패", url="/admin/noticeService/noticeQna_detail.do?qna_no="+qnaReplyVo.getQna_no();
		if(cnt>0){
			msg="1:1문의 답변 등록 성공";
		}
		
		//이메일 발송 처리
		String sender="yuxxxng@gmail.com", receiver=qnaReplyVo.getQna_email();
		String qna_content=request.getParameter("qna_content");
		String subject=qnaReplyVo.getQna_r_title();
		String content="<br>"+qnaReplyVo.getQna_r_content()+"<br><br><hr color='#ececec' size='1px'><br><b>"+receiver+"</b><br><br>"+qna_content+
				"<br><br><hr color='#ececec' size='1px'>";
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		}catch (MessagingException e) {
			logger.info("이메일 발송 실패");
			e.printStackTrace();
		}
		
		logger.info("1:1문의 답변 등록 결과 cnt={}", cnt);
		logger.info("답변여부 업데이트 결과 updateCnt={}", updateCnt);
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
