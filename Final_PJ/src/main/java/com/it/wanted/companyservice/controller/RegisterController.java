package com.it.wanted.companyservice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.it.wanted.comimginfo.model.ComImgInfoService;
import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.cominfo.model.ComSizeInfoVO;
import com.it.wanted.cominfo.model.IndustryVO;
import com.it.wanted.cominfo.model.NationVO;
import com.it.wanted.cominfo.model.RegionVO;
import com.it.wanted.commeminfo.model.ComMemInfoService;
import com.it.wanted.commeminfo.model.ComMemInfoServiceImpl;
import com.it.wanted.commeminfo.model.ComMemInfoVO;
import com.it.wanted.commemlist.model.ComMemListService;
import com.it.wanted.common.FileUploadUtil;

@Controller
@RequestMapping("/company")
public class RegisterController {
	
	private static final Logger logger=LoggerFactory.getLogger(RegisterController.class);
	@Autowired ComMemInfoService comMemInfoService;
	@Autowired ComInfoService comInfoService;
	@Autowired ComImgInfoService comImgInfoService;
	@Autowired ComMemListService comMemListService;
	@Autowired FileUploadUtil fileUpload;
	@Autowired BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/member/join.do", method= RequestMethod.POST)
	public String join_modal_post(@ModelAttribute ComMemInfoVO vo, Model model) {
		
		logger.info("기업회원 회원가입 처리, vo={}", vo);
		
		int cnt=comMemInfoService.joinComMem(vo);
		logger.info("회원가입 처리 결과, cnt={}", cnt);
		
		String msg="", url="";
		if(cnt==1) { //회원가입 처리 성공
			msg="회원가입 되었습니다.";
			url="/company/welcome.do";
		}else { //cnt가 2면 이미 존재하는 아이디임
			msg="이미 가입된 계정입니다.";
			url="/company/welcome.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/register.do", method = RequestMethod.GET)
	public void register_get(Model model, HttpSession session) {
		logger.info("회사정보등록 페이지 조회");
		
		//산업군 목록 
		List<IndustryVO> industryList=comInfoService.selectIndustryList();
		logger.info("산업군목록 조회결과 industry.size={}", industryList.size());
		//국가목록
		List<NationVO> nationList=comInfoService.selectNationList();
		logger.info("국가목록 조회결과 nationList.size={}", nationList.size());
		//회사규모
		List<ComSizeInfoVO> comSizeList=comInfoService.selectComSizeList();
		logger.info("규모목록 조회결과 comSizeList.size={}", comSizeList.size());
		//최초 지역목록
		List<RegionVO> regionList=comInfoService.selectRegionList("KR");
		logger.info("지역목록 조회결과 regionList.size={}", regionList.size());
		
		String comMemId=(String) session.getAttribute("comMemId");
		
		ComMemInfoVO comMemInfoVo=comMemInfoService.selectComMem(comMemId);
		
		model.addAttribute("comMemInfoVo", comMemInfoVo);
		model.addAttribute("industryList", industryList);
		model.addAttribute("nationList", nationList);
		model.addAttribute("comSizeList", comSizeList);
		model.addAttribute("regionList", regionList);
		
	}
	
	@ResponseBody //국가별 지역목록 조회 ajax 핸들러
	@RequestMapping("/selectRegionbyNation.do")
	public List<RegionVO> selectRegionList(@RequestParam String nationCode) {
		logger.info("국가명으로 지역목록 선택, 파라미터 국가코드 nationCode={}", nationCode);
		
		List<RegionVO> regionList=comInfoService.selectRegionList(nationCode);
		logger.info("국가명으로 지역목록 조회 결과, regionList.size={}", regionList.size());
		
		return regionList;
	}
	
	@RequestMapping(value="/register.do", method = RequestMethod.POST)
	public String register_post(@ModelAttribute ComInfoVO comInfoVo, Model model) {
		logger.info("회사정보등록 처리, 파라미터 comInfoVo={}", comInfoVo);
		
		//입력된 정보로 insert, 승인여부는 'Yet'으로 자동세팅됨
		int cnt=comInfoService.insertComInfo(comInfoVo);
		logger.info("회사정보등록 처리 결과, cnt={}", cnt);
		
		String msg="", url="", returnUrl="";
		if(cnt>0) { //입력 성공
			msg="기업 정보 제출이 완료되었습니다. 1영업일 후 승인처리됩니다.";
			url="/company/welcome.do";
			returnUrl="common/message2";
		}else {
			msg="기업 정보 제출이 실패했습니다.";
			url="/company/register.do";
			returnUrl="common/message";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		//안내화면 하나 만들어줘야겠네
		return "common/message";
	}
	
	//회사 이미지 등록 페이지 조회
	@RequestMapping("/comInfoModify.do")
	public void imgUpload_get(HttpSession session, Model model, HttpServletRequest request) {
		logger.info("회사이미지등록 페이지 조회");
		
		String comMemId=(String) session.getAttribute("comMemId");
		ComInfoVO comInfoVo=(ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("세션의 comMemId, comInfo 조회 결과, comMemId={}, comInfoVo={}", comMemId, comInfoVo);
		
		//국가정보로 지역목록을 불러온다. 해당 국가와 지역으로 세팅해야 함
		//이 코드를 value로 하는 값을 처음에 세팅해줘야 하고, jsp에서 ajax로 값 변경시 다시 받아오는걸 해야 함
		String comNation=comInfoVo.getNation();
		logger.info("기업의 국가코드 comNation={}", comNation); //나중에 지우자
		String comRegion=comInfoVo.getRegion();
		logger.info("기업의 지역코드 comNation={}", comRegion); //나중에 지우자
		
		List<NationVO> nationList=comInfoService.selectNationList();
		List<RegionVO> regionList=comInfoService.selectRegionList(comNation);
		
		//[2] cominfo의 comcode에 해당하는 이미지들이 있으면 불러와서 세팅한다.
		List<ComImgInfoVO> imgList=comImgInfoService.selectAllImg(comInfoVo.getComCode());
		logger.info("회사코드로 이미지 조회 결과, imgList.size={}", imgList.size());
		
		//회사정보, 회사이미지 세팅해주기 위해 모델에 add
		model.addAttribute("nationList", nationList);
		model.addAttribute("regionList", regionList);
		model.addAttribute("imgList", imgList);
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/imgUpload.do", method = RequestMethod.POST)
	public List<ComImgInfoVO> imgMultiUpload_post(HttpServletRequest request, HttpSession session) {
		String comMemId=(String) session.getAttribute("comMemId");
		String comCode=comMemListService.selectComCode(comMemId);
		
		logger.info("이미지 업로드 처리 시작, 파라미터 comCode={}, imgFileRequest={}", comCode, request);
		
		List<Map<String, Object>> fileList=null;
		try { //파일네임, 오리진네임, 파일사이즈가 있는 mapList를 리턴받음
			fileList=fileUpload.fileUplaod_comImg(request);
			logger.info("이미지 업로드 결과, fileList.size={}", fileList.size());
		} catch (IllegalStateException e){
			logger.info("이미지 업로드 실패!");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("이미지 업로드 실패!");
			e.printStackTrace();
		}
		ComImgInfoVO imgVo=new ComImgInfoVO();
		for(Map<String, Object> fileMap : fileList) {
			logger.info("fileName={}", fileMap.get("fileName"));
			logger.info("fileSize={}", fileMap.get("fileSize"));
			logger.info("originalFileName={}", fileMap.get("originalFileName"));
			imgVo.setComCode(comCode);
			imgVo.setComImgUrl((String)fileMap.get("fileName"));
			imgVo.setComImgPassed("N");
			int cnt=comImgInfoService.insertImg(imgVo);
			logger.info("이미지 입력 결과, imgVo={}, cnt={}", imgVo, cnt);
		} //출력까지 해보자 그러고 성공하면, comCode와 함께 이미지를 묶어서 db에 insert
		
		//return 값은 이미지 파일 리스트여야 함. 앞단에서 미리보기 해줘야 하니까
		List<ComImgInfoVO> imgList=comImgInfoService.selectAllImg(comCode);
		
		return imgList;
	} 
	
	@ResponseBody
	@RequestMapping(value = "/imgDelete.do", method = RequestMethod.GET)
	public String comImgDelete(@RequestParam String imgFileName, 
			HttpServletRequest request, HttpSession session){
		String res="삭제 실패!";

		String upPath = fileUpload.getUploadPath_comImg(request);
		boolean bool=false;
		
		//실물파일 삭제해줘
		File imgFile = new File(upPath, imgFileName);
		if(imgFile.exists()) {
			bool=imgFile.delete();
			logger.info("파일 삭제 여부 :{}", bool);
		}//if
		
		//파일네임 찾아서 db에서도 삭제해줘
		int cnt=comImgInfoService.deleteImg(imgFileName);
		logger.info("파일 삭제 결과 cnt={}", cnt);
		if(bool && cnt>0) {
			res="삭제 성공!";
		}
		
		return res;
	}
}
