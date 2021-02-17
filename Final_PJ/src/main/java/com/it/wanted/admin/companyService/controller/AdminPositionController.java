package com.it.wanted.admin.companyService.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.common.PaginationInfo;
import com.it.wanted.common.PaginationInfoJsonImgVO;
import com.it.wanted.common.PaginationInfoJsonPositionVO;
import com.it.wanted.common.SearchVO;
import com.it.wanted.common.Utility;
import com.it.wanted.position.model.PositionService;

@RequestMapping("/admin")
@Controller
public class AdminPositionController {

	public final static Logger logger=LoggerFactory.getLogger(AdminPositionController.class);
	@Autowired PositionService posService;
	
	@RequestMapping("/positionPermission.do")
	private String posPermission(SearchVO searchVo, SearchVO searchVo2,
			Model model){
		logger.info("adminPosition 조회 파라미터 searchVo={}",searchVo);
		
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
		List<Map<String, Object>> posListYet=posService.selectAllYetPosition(searchVo);
		int totalRecord=posService.selectYetTotalRecord();
		logger.info("포지션 승인요청건 조회 결과, comListYet.size={}, 토탈레코드={}", posListYet.size(), totalRecord);
		
		//PASSED 리스트 
		List<Map<String, Object>> posListPassed=posService.selectAllPassedPosition(searchVo2);
		int totalRecord2=posService.selectPassedTotalRecord();
		logger.info("포지션 승인완료건 조회 결과, comListPassed.size={}, 토탈레코드2={}", posListPassed.size(), totalRecord2);
		
		pagingInfoYet.setTotalRecord(totalRecord);
		pagingInfoPassed.setTotalRecord(totalRecord2);
		
		model.addAttribute("posListYet", posListYet);
		model.addAttribute("posListPassed", posListPassed);
		model.addAttribute("pagingInfoYet", pagingInfoYet);
		model.addAttribute("pagingInfoPassed", pagingInfoPassed);
		
		return "admin/companyService/positionPermission";
	}
	
	@ResponseBody
	@RequestMapping("/positionStatustoPass.do")
	public int positionStatustoPass(@RequestParam(value="posNoList[]") List<Integer> posNoList) {
		logger.info("승인할 포지션 번호 목록, posNoList={}", posNoList);

		int count=posService.changeStatustoPass(posNoList);
		logger.info("승인 결과, count={}", count);
		
		return count;
	}
	
	@ResponseBody
	@RequestMapping("/positionPermissionYet.do")
	public PaginationInfoJsonPositionVO positionPermissionYet(@RequestParam int curPage) {
		logger.info("위니드 승인 요청 포지션 조회, 파라미터 curPage={}", curPage);
		
		SearchVO searchVo=new SearchVO();
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(curPage);
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//YET 리스트 
		List<Map<String, Object>> posList=posService.selectAllYetPosition(searchVo);
		logger.info("기업이미지 승인요청건 조회 결과, posList.size={}", posList.size());
	
		int totalRecord=posService.selectYetTotalRecord();
		pagingInfo.setTotalRecord(totalRecord);
		
		PaginationInfoJsonPositionVO posVo=new PaginationInfoJsonPositionVO();
		posVo.setPosList(posList);
		posVo.setPagingInfo(pagingInfo);
		
		return posVo;
	}
	
	@ResponseBody
	@RequestMapping("/positionPermissionPassed.do")
	public PaginationInfoJsonPositionVO positionPermissionPassed(@RequestParam int curPage) {
		logger.info("위니드 승인 완료 포지션 조회, 파라미터 curPage={}", curPage);
		
		SearchVO searchVo=new SearchVO();
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(curPage);
		
		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//YET 리스트 
		List<Map<String, Object>> posList=posService.selectAllPassedPosition(searchVo);
		logger.info("기업이미지 승인완료건 조회 결과, posList.size={}", posList.size());
	
		int totalRecord=posService.selectPassedTotalRecord();
		pagingInfo.setTotalRecord(totalRecord);
		
		PaginationInfoJsonPositionVO posVo=new PaginationInfoJsonPositionVO();
		posVo.setPosList(posList);
		posVo.setPagingInfo(pagingInfo);
		
		return posVo;
	}
	
}
