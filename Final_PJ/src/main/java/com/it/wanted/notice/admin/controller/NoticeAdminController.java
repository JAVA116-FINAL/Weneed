package com.it.wanted.notice.admin.controller;

import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.notice.admin.model.NoticeAdminService;
import com.it.wanted.notice.model.NoticeService;
import com.it.wanted.notice.model.NoticeVO;
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
	
	@Autowired NoticeService noticeService;
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
	
	
	@RequestMapping("/notice_list.do")
	public String notice_list(@ModelAttribute NoticeSearchVO searchVo, Model model) {
		logger.info("이용안내 리스트 페이지, searchVo={}", searchVo);
		
		NoticePagination pagingInfo=new NoticePagination();
		pagingInfo.setBlockSize(NoticePagingUtility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		
		List<Map<String, Object>> listAll=noticeAdminService.selectNoticeAll(searchVo);
		pagingInfo.setTotalRecord(noticeAdminService.selectNoticeAll_cnt(searchVo));

		model.addAttribute("listAll", listAll);
		model.addAttribute("pagingInfo", pagingInfo);
		
		logger.info("listAll={}", listAll);
		logger.info("listAll.size={}", listAll.size());
		
		return "admin/noticeService/notice_list";
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
	
	@RequestMapping("/notice_detail.do")
	public String notice_detail(@RequestParam int notice_no, Model model) {
		logger.info("notice_no={}", notice_no);
		
		Map<String, Object> listDetail=noticeService.selectDetail(notice_no);
		
		model.addAttribute("listDetail", listDetail);
		logger.info("listDetail={}", listDetail);
		
		return "admin/noticeService/notice_detail";
	}
	
	@RequestMapping("/notice_delete.do")
	public String notice_delete(@RequestParam int notice_no, Model model) {
		logger.info("이용안내 삭제 notice_no={}", notice_no);
		
		int cnt=noticeAdminService.deleteNotice(notice_no);
		
		String msg="이용안내 삭제 실패", url="/admin/noticeService/notice_detail.do?qna_no="+notice_no;
		if(cnt>0) {
			msg="이용안내가 삭제되었습니다";
			url="/admin/noticeService/notice_list.do";
		}
		logger.info("이용안내 삭제 결과 cnt={}", cnt);
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/notice_update.do", method = RequestMethod.GET)
	public String notice_update_get(@RequestParam int notice_no, Model model) {
		logger.info("이용안내 수정 notice_no={}", notice_no);
		
		Map<String, Object> listDetail=noticeService.selectDetail(notice_no);
		logger.info("listDetail", listDetail);
		
		model.addAttribute("listDetail", listDetail);
		
		return "admin/noticeService/notice_update";
	}
	
	@RequestMapping(value = "/notice_update.do", method = RequestMethod.POST)
	public String notice_update_post(@ModelAttribute NoticeVO noticeVo, Model model) {
		logger.info("이용안내 수정 noticeVo={}", noticeVo);
		
		int cnt=noticeAdminService.updateNotice(noticeVo);
		
		String msg="이용안내 수정 실패", url="/admin/noticeService/notice_detail.do?notice_no="+noticeVo.getNotice_no();
		if(cnt>0) {
			msg="이용안내가 수정되었습니다";
		}
		logger.info("이용안내 수정 결과 cnt={}", cnt);
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.GET)
	public String notice_write_get() {
		logger.info("이용안내 등록 페이지 - get");
		
		return "admin/noticeService/notice_write";
	}
	
	@RequestMapping(value = "/notice_write.do", method = RequestMethod.POST)
	public String notice_write_post(@ModelAttribute NoticeVO noticeVo, Model model) {
		logger.info("이용안내 등록 페이지 - post");
		logger.info("이용안내 작성 noticeVo={}", noticeVo);
		
		int cnt=noticeAdminService.insertNotice(noticeVo);
		
		String msg="이용안내 업로드 실패", url="/admin/noticeService/notice_write.do";
		if(cnt>0) {
			msg="이용안내가 작성되었습니다";
			url="/admin/noticeService/notice_list.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/selectByDept1")
	public List<Map<String, Object>> selectByDept1(@RequestParam(required = false) int notice_dept1) {
		logger.info("notice_dept1={}", notice_dept1);
		
		List<Map<String, Object>> notice_dept2=noticeAdminService.selectByDept1(notice_dept1);
		logger.info("notice_dept2={}", notice_dept2);
		
		return notice_dept2;
	}
	
	@RequestMapping("/noticeQna_mute")
	public String noticeQna_mute(@RequestParam int qna_no, Model model) {
		logger.info("문의 무시하기 qna_no={}", qna_no);
		
		int cnt=noticeAdminService.updateReply_mute(qna_no);
		
		String msg="문의 무시 처리 실패", url="/admin/noticeService/noticeQna_detail.do?qna_no="+qna_no;
		if(cnt>0) {
			msg="문의가 무시되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
