package com.it.wanted.notice.controller;

import java.io.IOException;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.it.wanted.common.EmailSender;
import com.it.wanted.common.FileUploadUtil;
import com.it.wanted.notice.cate.model.NoticeCateService;
import com.it.wanted.notice.model.NoticeService;
import com.it.wanted.notice.model.NoticeVO;
import com.it.wanted.notice.model.QnaVO;
import com.it.wanted.notice.utility.KeywordVO;
import com.it.wanted.notice.utility.NoticePagination;
import com.it.wanted.notice.utility.NoticePagingUtility;
import com.it.wanted.notice.utility.NoticeUtility;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private final static Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired NoticeService noticeService;
	@Autowired NoticeCateService noticeCateService;
	@Autowired FileUploadUtil fileUtil; //파일업로드처리
	@Autowired EmailSender emailSender; //메일발송
	
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
	
	//페이징도 같이
	@RequestMapping("/notice_search.do")
	public String noticeSearch(@ModelAttribute KeywordVO keywordVo, Model model) {
		logger.info("keywordVo={}", keywordVo);
		
		//페이징
		NoticePagination pagingInfo=new NoticePagination();
		pagingInfo.setBlockSize(NoticePagingUtility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(keywordVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		
		keywordVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		keywordVo.setRecordCountPerPage(NoticePagingUtility.RECORD_COUNT);
		
		List<NoticeVO>listSelect=noticeService.noticeSearch(keywordVo);
		
		Map<String, Object> listSelectCnt=noticeService.noticeSearchCnt(keywordVo);
		
		int totalRecord=Integer.parseInt(String.valueOf(listSelectCnt.get("CNT")));
		logger.info("totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("listSelect", listSelect);
		model.addAttribute("pagingInfo", pagingInfo);
		
		logger.info("listSelect.size={}", listSelect.size());
		logger.info("listSelect={}", listSelect);

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
	
	@RequestMapping(value = "/notice_qna.do", method = RequestMethod.GET)
	public String notice_qna() {
		logger.info("notice_qna 출력");
		
		return "notice/notice_qna";
	}
	
	@RequestMapping( value = "/notice_qna.do", method = RequestMethod.POST)
	public String notice_qna_ok(@ModelAttribute QnaVO qnaVo, 
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		logger.info("문의등록, 파라미터 qnaVo={}", qnaVo);
		
		//파일 업로드 처리
		String qna_origin_filename="", qna_filename="";
		long qna_filesize=0;
		try {
			List<Map<String, Object>> fileList
				=fileUtil.fileUplaod(request, FileUploadUtil.PDS_TYPE);
			for(Map<String, Object>fileMap : fileList){
				qna_origin_filename=(String)fileMap.get("qna_origin_filename");
				qna_filename=(String)fileMap.get("qna_filename");
				qna_filesize=(Long)fileMap.get("qna_filesize");
			}//for
			
		}catch (IllegalStateException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		}catch (IOException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		}
		
		//2
		qnaVo.setQna_filename(qna_filename);
		qnaVo.setQna_filesize(qna_filesize);
		qnaVo.setQna_origin_filename(qna_origin_filename);
		
		int cnt=noticeService.insertQna(qnaVo);
		logger.info("문의등록 결과, cnt={}", cnt);
		
		
		redirectAttributes.addAttribute("receiver", qnaVo.getQna_email());
		redirectAttributes.addAttribute("subject", qnaVo.getQna_title());
		redirectAttributes.addAttribute("content", qnaVo.getQna_content());
		redirectAttributes.addAttribute("no", qnaVo.getQna_no());
		return "redirect:/notice/notice_email_send.do";
	}
	
	@RequestMapping("/notice_email_send.do")
	public String notice_email_send(RedirectAttributes redirectAttributes
			, @RequestParam String receiver, String subject, String content, int no) {
		logger.info("receiver={}", receiver);
		logger.info("subject={}", subject);
		logger.info("content={}", content);
		logger.info("no={}", no);
		
		String sender="weneed@admil.com";
		content="<p>"+"안녕하세요, 위니드 고객센터입니다."+"<br>"+"문의가 정상 접수되었습니다."+"<br><br>"+
				"문의제목: "+subject+"<br><br>"+
				"영업일 기준 최대 1~2일 이내 안내 드릴 수 있도록 최선을 다하겠습니다."+"<br><br>"+
				"감사합니다."+"<br><br>"+"위니드 드림"+"<br><br>"+"<hr color='#ececec' size='1px'>"+"</p>"; //하단 위니드 이미지 태그 추가, 링크도 추가할 것
		subject="문의가 정상 접수되었습니다. ("+subject+")";
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		}catch (MessagingException e) {
			logger.info("이메일 발송 실패");
			e.printStackTrace();
		}
		
		redirectAttributes.addAttribute("no", no);
		
		return "redirect:/notice/notice_qna_ok.do"; //문의 등록 완료 안내 페이지로 이동할 것
	}
	
	@RequestMapping("/notice_qna_ok.do")
	public String notice_qna_ok(@RequestParam int no, Model model) {
		logger.info("문의등록 완료 뷰 출력, no={}", no);
		
		model.addAttribute("no", no);
		return "notice/notice_qna_ok";
	}
}
