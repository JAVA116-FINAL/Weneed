package com.it.wanted.admin.companyService.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.comimginfo.model.ComImgInfoService;
import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.common.PaginationInfo;
import com.it.wanted.common.PaginationInfoJsonImgVO;
import com.it.wanted.common.PaginationInfoJsonVO;
import com.it.wanted.common.SearchVO;
import com.it.wanted.common.Utility;

@Controller
@RequestMapping("/admin")
public class CompanyRegisterController {

	private static final Logger logger=LoggerFactory.getLogger(CompanyRegisterController.class);
	@Autowired ComInfoService comInfoService;	
	@Autowired ComImgInfoService comImgInfoService;
	
	//정보 승인 페이지
	@RequestMapping("/comInfoPermission.do")
	public String adminRegister(SearchVO searchVo, SearchVO searchVo2, Model model) {
		//1
		logger.info("위니드 관리자 페이지 - 정보 /이미지 등록 승인 요청 조회");
		//2
		//페이징 처리 관련 셋팅
		//YET 페이징
		PaginationInfo pagingInfoYet = new PaginationInfo();
		pagingInfoYet.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfoYet.setRecordCountPerPage(5);
		pagingInfoYet.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfoYet.getFirstRecordIndex());
		
		//PASS 페이징
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfoPassed = new PaginationInfo();
		pagingInfoPassed.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfoPassed.setRecordCountPerPage(5);
		pagingInfoPassed.setCurrentPage(searchVo2.getCurrentPage());
		
		//[2] SearchVo 셋팅
		searchVo2.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo2.setFirstRecordIndex(pagingInfoPassed.getFirstRecordIndex());
	
		//기업정보 모조리 불러다 노출
		//YET 리스트 
		List<ComInfoVO> comListYet=comInfoService.selectAllYetCompany(searchVo);
		int totalRecord=comInfoService.selectYetTotalRecord(searchVo);
		logger.info("기업정보 승인요청건 조회 결과, comListYet.size={}", comListYet.size());
		
		//PASSED 리스트 
		List<ComInfoVO> comListPassed=comInfoService.selectAllPassedCompany(searchVo2);
		logger.info("기업정보 승인완료건 조회 결과, comListPassed.size={}", comListPassed.size());
		int totalRecord2=comInfoService.selectPassedTotalRecord(searchVo2);
		
		logger.info("승인요청 건 개수={}, 승인완료 개수={}", totalRecord, totalRecord2);
		pagingInfoYet.setTotalRecord(totalRecord);
		pagingInfoPassed.setTotalRecord(totalRecord2);
		
		model.addAttribute("comListYet", comListYet);
		model.addAttribute("comListPassed", comListPassed);
		model.addAttribute("pagingInfoYet", pagingInfoYet);
		model.addAttribute("pagingInfoPassed", pagingInfoPassed);
		
		return "admin/companyService/comInfoPermission2";
	}
	
	@ResponseBody
	@RequestMapping("/comInfoPermissionYet.do")
	public PaginationInfoJsonVO adminRegister(@RequestParam int curPage) {
		logger.info("위니드 관리자 페이지 - 정보 승인 요청 조회, 파라미터 curPageY={}", curPage);
		//2
		//페이징 처리 관련 셋팅
		//YET 페이징
		SearchVO searchVo = new SearchVO();
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(curPage);
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//YET 리스트 
		List<ComInfoVO> comList=comInfoService.selectAllYetCompany(searchVo);
		logger.info("기업정보 승인요청건 조회 결과, comListYet.size={}", comList.size());
	
		int totalRecord=comInfoService.selectYetTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		PaginationInfoJsonVO jsonVo=new PaginationInfoJsonVO();
		
		jsonVo.setComList(comList);
		jsonVo.setPagingInfo(pagingInfo);
		
		return jsonVo;
	}
	
	@ResponseBody
	@RequestMapping("/comInfoPermissionPassed.do")
	public PaginationInfoJsonVO adminRegister2(@RequestParam int curPage) {
		logger.info("위니드 관리자 페이지 - 정보 승인 완료 건 조회, 파라미터 curPageP={}", curPage);
		//2
		//페이징 처리 관련 셋팅
		//PASSED 페이징
		SearchVO searchVo = new SearchVO();
		PaginationInfo pagingInfoPassed = new PaginationInfo();
		pagingInfoPassed.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfoPassed.setRecordCountPerPage(5);
		pagingInfoPassed.setCurrentPage(curPage);
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfoPassed.getFirstRecordIndex());
		
		List<ComInfoVO> comListPassed=comInfoService.selectAllPassedCompany(searchVo);
		logger.info("기업정보 승인완료건 조회 결과, comListPassed.size={}", comListPassed.size());
		
		int totalRecord=comInfoService.selectPassedTotalRecord(searchVo);
		pagingInfoPassed.setTotalRecord(totalRecord);
		
		PaginationInfoJsonVO jsonVo=new PaginationInfoJsonVO();
		
		jsonVo.setComList(comListPassed);
		jsonVo.setPagingInfo(pagingInfoPassed);
		
		return jsonVo;
	}
	
	@ResponseBody
	@RequestMapping("/comInfoStatustoPass.do")
	public List<ComInfoVO> adminComInfoStatustoPass(@RequestParam(value="comCodeList[]") List<String> comCodeList,
			@RequestParam(value="comMemNoList[]") List<String> comMemNoList) {
		
		System.out.println("== comCodeList ==");
		for(String comCode : comCodeList) {
			System.out.println(comCode);
		}
		
		System.out.println("== comMemNoList ==");
		for(String comMemNo : comMemNoList) {
			System.out.println(comMemNo);
		}
		
		logger.info("기업정보등록 승인 처리, 파라미터 회사코드 배열 comCodeArr={}, comMemNoArr={}", comCodeList, comMemNoList);
		
		//컴코드랑 컴멤 싸그리 넘겨서 디비처리해줍니다
		List<ComInfoVO> changedComList=comInfoService.changeStatustoPass(comCodeList, comMemNoList);
		logger.info("기업정보등록 승인 처리 결과, changedComList.size={}", changedComList.size());
		
		//결과값은 다시 컴인포 목록입니다.
		return changedComList;
	}
	
	//이미지 목록 페이징 최초세팅은 둘다 해줘야 하고, 페이징할때는 각각
	@RequestMapping("/comImgPermission.do")
	public String adminRegister3(SearchVO searchVo, SearchVO searchVo2, Model model) {
		//1
		logger.info("위니드 관리자 페이지 - 정보 /이미지 등록 승인 요청 조회");
		//2
		//페이징 처리 관련 셋팅
		//YET 페이징
		PaginationInfo pagingInfoYet = new PaginationInfo();
		pagingInfoYet.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfoYet.setRecordCountPerPage(5);
		pagingInfoYet.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfoYet.getFirstRecordIndex());
		
		//PASS 페이징
		//[1] PaginationInfo 생성
		PaginationInfo pagingInfoPassed = new PaginationInfo();
		pagingInfoPassed.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfoPassed.setRecordCountPerPage(5);
		pagingInfoPassed.setCurrentPage(searchVo2.getCurrentPage());
		
		//[2] SearchVo 셋팅
		searchVo2.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo2.setFirstRecordIndex(pagingInfoPassed.getFirstRecordIndex());
	
		//기업정보 모조리 불러다 노출
		//YET 리스트 
		List<ComImgInfoVO> comImgListYet=comImgInfoService.selectAllYetImg(searchVo);
		logger.info("기업이미지 승인요청건 조회 결과, comListYet.size={}", comImgListYet.size());
		int totalRecord=comImgInfoService.selectYetTotalRecord(searchVo);
		
		//PASSED 리스트 
		List<ComImgInfoVO> comImgListPassed=comImgInfoService.selectAllPassedImg(searchVo2);
		logger.info("기업이미지 승인완료건 조회 결과, comListPassed.size={}", comImgListPassed.size());
		int totalRecord2=comImgInfoService.selectPassedTotalRecord(searchVo2);
		
		logger.info("승인요청 건 개수={}, 승인완료 개수={}", totalRecord, totalRecord2);
		pagingInfoYet.setTotalRecord(totalRecord);
		pagingInfoPassed.setTotalRecord(totalRecord2);
		
		model.addAttribute("comImgListYet", comImgListYet);
		model.addAttribute("comImgListPassed", comImgListPassed);
		model.addAttribute("pagingInfoYet", pagingInfoYet);
		model.addAttribute("pagingInfoPassed", pagingInfoPassed);
		
		return "admin/companyService/comImgPermission";
	}
	
	/* //이미지 승인 페이지
	@RequestMapping("/comImgPermission.do")
	public String adminImgPermission(Model model, HttpSession session) {
		logger.info("위니드 관리자 페이지 - 이미지 등록 승인 요청 조회");
		
		//이미지 전체조회.. 인데 passed 아닌 것들만
		List<ComImgInfoVO> comImgList=comImgInfoService.selectAllImage();
		logger.info("승인대상 이미지 전부 조회 결과, comImgList.size={}", comImgList.size());
		
		model.addAttribute("comImgList", comImgList);
		
		return "admin/companyService/comImgPermission";
	} */
	
	//이미지 승인 전 목록 조회 페이지 
	@ResponseBody
	@RequestMapping("/comImgPermissionYet.do")
	public PaginationInfoJsonImgVO adminImgPermissionY(@RequestParam int curPage) {
		logger.info("위니드 관리자 페이지 - 이미지 등록 승인 요청 조회");
		
		SearchVO searchVo=new SearchVO();
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(curPage);
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//YET 리스트 
		List<ComImgInfoVO> comImgList=comImgInfoService.selectAllYetImg(searchVo);
		logger.info("기업이미지 승인요청건 조회 결과, comListYet.size={}", comImgList.size());
	
		int totalRecord=comInfoService.selectYetTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		PaginationInfoJsonImgVO imgVo=new PaginationInfoJsonImgVO();
		imgVo.setComImgList(comImgList);
		imgVo.setPagingInfo(pagingInfo);
		
		return imgVo;
	}
	
	//이미지 승인 후 목록 조회 페이지 
	@ResponseBody
	@RequestMapping("/comImgPermissionPassed.do")
	public PaginationInfoJsonImgVO adminImgPermissionP(@RequestParam int curPage) {
		logger.info("위니드 관리자 페이지 - 이미지 등록 승인 완료 조회");
		
		SearchVO searchVo=new SearchVO();
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(curPage);
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<ComImgInfoVO> comImgList=comImgInfoService.selectAllPassedImg(searchVo);
		logger.info("기업이미지 승인완료건 조회 결과, comImgList.size={}", comImgList.size());
	
		int totalRecord=comInfoService.selectPassedTotalRecord(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		PaginationInfoJsonImgVO imgVo=new PaginationInfoJsonImgVO();
		imgVo.setComImgList(comImgList);
		imgVo.setPagingInfo(pagingInfo);
		
		return imgVo;
	}
	
	@ResponseBody
	@RequestMapping("/comImgStatustoPass.do")
	public List<ComImgInfoVO> adminComImgStatustoPass(@RequestParam(value="comImgNoArr[]") List<Integer> comImgNoArr) {
		
		logger.info("기업정보등록 승인 처리, 파라미터 기업이미지 배열 comImgNoArr.size={}", comImgNoArr.size());
		int cnt=0;
		for(int imgNo:comImgNoArr) {
			cnt+=comImgInfoService.changeStatustoPass(imgNo);
		}
		logger.info("이미지 승인 처리 결과 cnt={}", cnt);
		//통째로 넘겨서 승인처리 해줍니다
		List<ComImgInfoVO> changedComImgList=comImgInfoService.selectAllImage();
	//	List<ComImgInfoVO> changedComImgList=null;
		//결과값은 다시 컴인포 목록입니다.
		return changedComImgList;
	}
}
