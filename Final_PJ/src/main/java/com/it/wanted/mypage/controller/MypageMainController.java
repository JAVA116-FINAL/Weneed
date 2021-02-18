package com.it.wanted.mypage.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.util.FileUtil;
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

import com.it.wanted.applicants.model.ApplicantsService;
import com.it.wanted.applicants.model.ApplicantsVO;
import com.it.wanted.common.FileUploadUtil;
import com.it.wanted.matchup.model.MatchupMemService;
import com.it.wanted.matchupStatus.model.MatchupStatusService;
import com.it.wanted.member.model.MemberService;
import com.it.wanted.member.model.MemberVO;
import com.it.wanted.proposal.model.ProposalService;
import com.it.wanted.resume.model.ResumeVO;

@Controller
@RequestMapping("/mypage")
public class MypageMainController {

	private final static Logger logger=LoggerFactory.getLogger(MypageMainController.class);
	
	@Autowired private MemberService memberService;
	@Autowired private ApplicantsService applicantsService;
	@Autowired private ProposalService proposalService;
	@Autowired private MatchupStatusService matchupStatusService;
	@Autowired private MatchupMemService matchupmemService;
	@Autowired private FileUploadUtil fileUploadUtil;
	
	@RequestMapping(value="/main.do")
	public String mypageMemInfo(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		logger.info("email={}", email);
		
		//회원정보 셋팅
		MemberVO memVo = memberService.selectMember(email);
		logger.info("memVo={}", memVo);
		
		//지원현황 셋팅
		int applyComplete = applicantsService.selectApplyComplete(memVo.getMemNo());
		logger.info("지원완료 조회 결과 : applyComplete={}", applyComplete);
		int documentPass = applicantsService.selectDocumentPass(memVo.getMemNo());
		logger.info("서류통과 조회 결과 : documentPass={}", documentPass);
		int finalAccept = applicantsService.selectFinalAccept(memVo.getMemNo());
		logger.info("최종합격 조회 결과 : finalAccept={}", finalAccept);
		int finalFail = applicantsService.selectFinalFail(memVo.getMemNo());
		logger.info("불합격 조회 결과 : finalFail={}", finalFail);
		
		/* 0218자연추가 */
		int proposalCnt=proposalService.proposalCountbyMemNo(memVo.getMemNo());
		int openResumeCnt=matchupStatusService.openResumeCountbyMemNo(memVo.getMemNo());
		int likeCnt=matchupmemService.matchupLikeCountbyMemNo(memVo.getMemNo());
		logger.info("memVo={},proposalCnt={}",memVo,proposalCnt);
		logger.info("openResumeCnt={},likeCnt={}",openResumeCnt,likeCnt);
		//3
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("proposalCnt", proposalCnt);
		model.addAttribute("openResumeCnt", openResumeCnt);
		/* 0218자연추가 끝 */
		model.addAttribute("memVo", memVo);
		model.addAttribute("applyComplete", applyComplete);
		model.addAttribute("documentPass", documentPass);
		model.addAttribute("finalAccept", finalAccept);
		model.addAttribute("finalFail", finalFail);
		
		return "mypage/main";
		
	}
	
	@RequestMapping(value="/applicationsStatus.do")
	public String applicationsStatus(HttpSession session, Model model) {
		String email = (String) session.getAttribute("email");
		logger.info("email={}", email);
		
		//회원정보 셋팅
		MemberVO memVo = memberService.selectMember(email);
		logger.info("memVo={}", memVo);
		
		//지원현황 셋팅
		int applyTotal = applicantsService.selectApplyTotal(memVo.getMemNo());
		logger.info("전체 조회 결과 : applyTotal={}", applyTotal);
		int applyComplete = applicantsService.selectApplyComplete(memVo.getMemNo());
		logger.info("지원완료 조회 결과 : applyComplete={}", applyComplete);
		int documentPass = applicantsService.selectDocumentPass(memVo.getMemNo());
		logger.info("서류통과 조회 결과 : documentPass={}", documentPass);
		int finalAccept = applicantsService.selectFinalAccept(memVo.getMemNo());
		logger.info("최종합격 조회 결과 : finalAccept={}", finalAccept);
		int finalFail = applicantsService.selectFinalFail(memVo.getMemNo());
		logger.info("불합격 조회 결과 : finalFail={}", finalFail);
		
		List<Map<String, Object>> list = applicantsService.selectApplyList(memVo.getMemNo());
		logger.info("지원 리스트 조회 결과, list={}", list);
		
		model.addAttribute("list", list);
		model.addAttribute("memVo", memVo);
		model.addAttribute("applyTotal", applyTotal);
		model.addAttribute("applyComplete", applyComplete);
		model.addAttribute("documentPass", documentPass);
		model.addAttribute("finalAccept", finalAccept);
		model.addAttribute("finalFail", finalFail);
		
		return "mypage/applicationsStatus";
		
	}
	
	/* 0218자연 */
	@RequestMapping(value = "/profileEdit.do",method =RequestMethod.GET )
	public String profileEdit_get(HttpSession session, Model model) {
		//1
		String email=(String) session.getAttribute("email");
		logger.info("회원정보 수정 파라미터 email", email);
		//2 회원정보, 제안횟수, 열람횟수
		MemberVO memVo = memberService.selectMember(email);
		logger.info("memVo",memVo);
		int proposalCnt=proposalService.proposalCountbyMemNo(memVo.getMemNo());
		int openResumeCnt=matchupStatusService.openResumeCountbyMemNo(memVo.getMemNo());
		int likeCnt=matchupmemService.matchupLikeCountbyMemNo(memVo.getMemNo());
		logger.info("memVo={},proposalCnt={}",memVo,proposalCnt);
		logger.info("openResumeCnt={},likeCnt={}",openResumeCnt,likeCnt);
		//3
		model.addAttribute("memVo", memVo);
		model.addAttribute("likeCnt", likeCnt);
		model.addAttribute("proposalCnt", proposalCnt);
		model.addAttribute("openResumeCnt", openResumeCnt);
		//4
		return "mypage/profileEdit";
	}
	@RequestMapping(value = "/profileEdit.do",method =RequestMethod.POST )
	public String profileEdit_post(@ModelAttribute MemberVO memberVo,HttpSession session, Model model) {
		//1
		logger.info("회원정보 수정하기 파라미터 memberVo",memberVo);
		//2
		int cnt=memberService.updateMemInfobyMemNo(memberVo);
		logger.info("회원정보 수정결과 cnt={}", cnt);
		//3
		String msg="회원정보 수정 실패", url="/mypage/profileEdit.do";
		if(cnt>0) {
			session.setAttribute("email", memberVo.getEmail());
			session.setAttribute("name", memberVo.getName());
			msg="회원정보 수정 완료";
			url="/mypage/main.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		//4
		return "common/message"; 
				
	}
	
	// 파일업로드
		@ResponseBody
		@RequestMapping(value = "/fileUpload.do", method = RequestMethod.POST,produces = "application/text; charset=utf8")
		public String resumefileUpload(@RequestParam String oldFileName, HttpSession session, HttpServletRequest request) {
			//1
			int memNo=(Integer) session.getAttribute("mem_no");
			String email=(String) session.getAttribute("email");
			logger.info("회원이미지 등록하기 화면, memNo={}" , memNo);
			//2
			MemberVO memberVo=new MemberVO();
			memberVo.setMemNo(memNo);
			memberVo.setEmail(email);
			List<Map<String, Object>> fileList=null;
			String fileName="", originalFilename="";
			long fileSize=0;
			try {
				fileList=fileUploadUtil.fileUplaod(request, FileUploadUtil.MEMBER_IMAGE_TYPE);
				logger.info("파일리스트:",fileList);
				
				for (Map<String, Object> fileMap:fileList) {
					fileName=(String) fileMap.get("fileName");
					fileSize= (long) fileMap.get("fileSize");
					originalFilename=(String) fileMap.get("originalFileName");
					logger.info("filename={},filesize={}",fileName, fileSize);
					
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
				logger.info("파일업로드 실패!!");
			}catch (IOException e) {
				e.printStackTrace();
				logger.info("파일업로드 실패!!");
			}
			memberVo.setFileName(fileName);
			memberVo.setOriginalFileName(originalFilename);
			memberVo.setFileSize(fileSize);
			
			int cnt=memberService.updateMemberImg(memberVo);
			if(cnt>0) {
				memberVo=memberService.selectMember(memberVo.getEmail());
				session.setAttribute("fileName", memberVo.getFileName());
				//파일 업로드 됐을때 기존파일 있으면 지우기
			
				if(fileName!=null && ! fileName.isEmpty()) {
					String upPath=fileUploadUtil.getUploadPath(FileUploadUtil.MEMBER_IMAGE_TYPE, request);
					File oldFile=new File(upPath,oldFileName);
					if(oldFile.exists()) {
						boolean bool=oldFile.delete();
						logger.info("기존파일삭제여부={}",bool);
					}
				}
			}
			//3
			//4
			//String upPath=request.getSession().getServletContext().getRealPath("/memberImgUpload");
			//String upPath=request.getServletContext().getRealPath("/memberImgUpload");
			String upPath=fileUploadUtil.getUploadPath(FileUploadUtil.MEMBER_IMAGE_TYPE, request);
					
			String path=upPath+"/"+ memberVo.getFileName();
			return  path;
		}
	
	
}
