package com.it.wanted.companyservice.controller;


import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.wanted.cominfo.model.ComInfoService;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.cominfo.model.NationVO;
import com.it.wanted.commemlist.model.ComMemListService;
import com.it.wanted.jikgun.model.JikgunService;
import com.it.wanted.jikgun.model.JikgunVO;
import com.it.wanted.jikmu.model.JikmuVO;
import com.it.wanted.position.model.PosJikmuVO;
import com.it.wanted.position.model.PositionService;
import com.it.wanted.position.model.PositionVO;

@Controller
@RequestMapping("/company")
public class PositionController {
	private static final Logger logger=LoggerFactory.getLogger(PositionController.class);
	@Autowired JikgunService jkService;
	@Autowired ComInfoService comInfoService;
	@Autowired ComMemListService comMemListService;
	@Autowired PositionService posService;
	
	@RequestMapping("/positionList.do")
	public void positionList(Model model, HttpSession session) {
		String comCode=((ComInfoVO)session.getAttribute("comInfoVo")).getComCode();
		logger.info("포지션목록 조회, 파라미터 comCode={}", comCode);
		
		List<PositionVO> posList=posService.selectPositionByComcode(comCode);
		logger.info("기업코드에 대한 포지션 목록 조회 결과, posList.size={}", posList.size());
		model.addAttribute("posList", posList);
	}
	
	//포지션 등록 페이지 조회
	@RequestMapping(value="/positionAdd.do", method=RequestMethod.GET)
	public void positionAdd_get(Model model) {
		logger.info("포지션등록 페이지 조회");
		
		//직군 테이블 끌어오기
		List<JikgunVO> jkList=jkService.selectAllJikgun();
		logger.info("직군리스트 조회 결과, jkList.size={}", jkList.size());
		
		//직무 테이블 끌어오기
		String basicCode=jkService.selectBasicJikgunCode();
		logger.info("직군 기본코드 조회 결과, basicCode={}", basicCode);
		List<JikmuVO> jmList=jkService.selectJikmuByJikgunCode(basicCode);
		logger.info("직무리스트 조회 결과, jmList.size={}", jmList.size());
		
		List<NationVO> nationList=comInfoService.selectNationList();
		logger.info("국가리스트 조회 결과, nationList.size={}", nationList.size());
				
		model.addAttribute("jkList", jkList);
		model.addAttribute("jmList", jmList);
		model.addAttribute("nationList", nationList);
	}
	
	//포지션 등록 승인 요청, 임시저장
	@RequestMapping(value="/positionAdd.do", method=RequestMethod.POST)
	public String positionAdd_post(@ModelAttribute PositionVO posVo, 
			@RequestParam(value="posJikmus", required=true) List<String> jikmus, HttpSession session,
			Model model) {
		logger.info("포지션 등록 승인 요청 또는 임시 저장, 파라미터 posVo={} jikmus={}", posVo, jikmus);
		//필수값 아닌 것 전부 널 처리 해줘야 함, 임시저장을 위해...
		
		//직무선택 개수에 따른 후처리.. ConcurrentModificationException 나면 이터레이터로 처리해야 함.
		//이터레이터로 처리하려다가 NoSuchElement 떠서 람다식을 사용해보았다.
		jikmus.removeIf(jikmu -> (jikmu == null || jikmu.isEmpty()));
		logger.info("후처리가 끝난 직무 목록 조회 jikmus={}", jikmus);
		
		//승인요청일 때 신입/경력 후처리
		if(posVo.getPosStatus().equals("2")) {
			if((posVo.getMinYear()==null || posVo.getMinYear().isEmpty())) {
				posVo.setMinYear("0");
			}
			if((posVo.getMaxYear()==null || posVo.getMaxYear().isEmpty())) {
				posVo.setMaxYear("0");
			}
		}else if(posVo.getPosStatus().equals("1")) {
			if((posVo.getMinYear()==null || posVo.getMinYear().isEmpty())) {
				posVo.setMinYear("");
			}
			if((posVo.getMaxYear()==null || posVo.getMaxYear().isEmpty())) {
				posVo.setMaxYear("");
			}
		}
		
		//연봉 후처리
		if( posVo.getPosMinSal() == null || posVo.getPosMinSal().isEmpty()) {
			posVo.setPosMinSal("");
		}
		if( posVo.getPosMaxSal() == null || posVo.getPosMaxSal().isEmpty()) {
			posVo.setPosMaxSal("");
		}
		
		//마감일 후처리
		if( posVo.getEndDate() == null || posVo.getEndDate().isEmpty()) {
			posVo.setEndDate("");
		}
		
		//포지션 공고 서론 후처리 
		if( posVo.getPosContext() == null || posVo.getPosContext().isEmpty()) {
			posVo.setPosContext("");
		}
		
		//주요업무
		if( posVo.getPosCareer() == null || posVo.getPosCareer().isEmpty()) {
			posVo.setPosCareer("");
		}
		
		//자격요건
		if( posVo.getQualification() == null || posVo.getQualification().isEmpty()) {
			posVo.setQualification("");
		}
		
		//우대사항
		if( posVo.getPreferentialTreatment() == null || posVo.getPreferentialTreatment().isEmpty()) {
			posVo.setPreferentialTreatment("");
		}
		
		//자격요건
		if( posVo.getWelfareBenefits() == null || posVo.getWelfareBenefits().isEmpty()) {
			posVo.setWelfareBenefits("");
		}
		
		//해외채용
		if( posVo.getOverseas() == null ) {
			posVo.setOverseas("X");
		}else {
			posVo.setOverseas("O");
		}
		
		//지역은 왜 들어갔는지 모르겠는데.. 일단 널처리
		if( posVo.getRegion() == null || posVo.getRegion().isEmpty() ) {
			posVo.setRegion("");
		}
		
		String comMemId=(String) session.getAttribute("comMemId");
		String comCode=comMemListService.selectComCode(comMemId);
		posVo.setComCode(comCode);
		logger.info("포지션 등록 처리 전 posVo={}", posVo);
		
		int cnt=posService.insertPosition(posVo, jikmus);
		logger.info("포지션등록 처리 및 포지션별 직무리스트 인서트 결과 cnt={}", cnt);
		
		String url="/company/positionAdd.do", msg="포지션 등록 실패!";
		if(cnt>0) {
			url="/company/positionList.do";
			msg="포지션 등록 성공!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
