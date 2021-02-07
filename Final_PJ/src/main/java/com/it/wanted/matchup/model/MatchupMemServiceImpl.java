package com.it.wanted.matchup.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.career.model.CareerDAO;
import com.it.wanted.education.model.EducationDAO;
import com.it.wanted.expertise.model.ExpertiseDAO;

@Service
public class MatchupMemServiceImpl implements MatchupMemService{
	
	@Autowired 	private MatchupMemDAO matchupMemDao;
	@Autowired EducationDAO educationDao;
	@Autowired CareerDAO careerDao;
	@Autowired ExpertiseDAO expertDao;
	
	/* 자연 */
	@Override
	public int selectmcuResumeNo(int memNo) {
		return matchupMemDao.selectmcuResumeNo(memNo);
	}

	@Override
	public int isMechupMem(int memNo) {
		return matchupMemDao.isMechupMem(memNo);
	}

	
	
	/* 현빈 */
	@Override
	public List<MatchupMemVO> selectOpen() {
		return matchupMemDao.selectOpen();
	}
	
	@Override
	public List<Map<String, Object>> selectTenMem(int firstRecord) {
		return matchupMemDao.selectTenMem(firstRecord);
	}

	@Override
	public int selectMcumemNo(int resumeNo) {
		return matchupMemDao.selectMcumemNo(resumeNo);
	}
	
	//일단 서비스를 만들어보자
	//커리어, 에듀, 엑스퍼타이즈에서 매치업번호 리스트를 받아오고, 그걸로 다시 뷰를 셀렉하는 함수 
	public List<Map<String, Object>> selectSearchedMemList(MatchupMemSearchVO mcuMemSearchVo){ 
		//매치업번호 리스트 합칠 것 
		List<Integer> mcumemNoList=new ArrayList<Integer>();
		
		//커리어의 매치업번호 리스트 
		List<Integer> careerMcumemNoList=careerDao.selectMcumemNo(mcuMemSearchVo.getSearchKeyword());
		System.out.println("커리어 검색결과 careerMcumemNoList.size="+careerMcumemNoList.size());

		//에듀의 매치업번호 리스트
		List<Integer> eduMcumemNoList=educationDao.selectMcumemNo(mcuMemSearchVo.getSearchKeyword());
		System.out.println("에듀 검색결과 eduMcumemNoList.size="+eduMcumemNoList.size());
		
		//익스퍼트의 매치업번호 리스트
		List<Integer> expertMcumemNoList=expertDao.selectMcumemNo(mcuMemSearchVo.getSearchKeyword());
		System.out.println("익스퍼트 검색결과 expertMcumemNoList.size="+expertMcumemNoList.size());
		
		//중복되는 매치업번호가 있을까? 커리어와 에듀와 익스퍼트 스킬에 비슷한 이름이 섞여있을 가능성 있는데 이렇게 하면 되려나
		for(Integer no : careerMcumemNoList) {
			if(!mcumemNoList.contains(no)) mcumemNoList.add(no);
		}
		for(Integer no : eduMcumemNoList) {
			if(!mcumemNoList.contains(no)) mcumemNoList.add(no);
		}
		for(Integer no : expertMcumemNoList) {
			if(!mcumemNoList.contains(no)) mcumemNoList.add(no);
		}
		System.out.println("중복확인이 끝난 매치업멤넘 리스트 길이="+mcumemNoList.size());
		System.out.println("중복확인이 끝난 매치업멤넘 리스트 길이="+mcumemNoList);
		List<Map<String, Object>> mcumemSearchResultList=new ArrayList<Map<String,Object>>();
		
		if(mcumemNoList.size()<1) { //검색결과가 없으면
			Map<String, Object> emptyMap=new HashMap<String, Object>();
			mcumemSearchResultList.add(emptyMap);
			return mcumemSearchResultList;
		}
		
		mcuMemSearchVo.setMcumemNoList(mcumemNoList);
		//이제 매치업넘버리스트는 완성됐어 이거에 대한 이력서리스트를 가져와야 해
		
		//한번만 찍어보자 
		System.out.println("searchMinCareer"+mcuMemSearchVo.getSearchMinCareer());
		System.out.println("searchMaxCareer"+mcuMemSearchVo.getSearchMaxCareer());
		mcumemSearchResultList=matchupMemDao.selectMcumemSearchList(mcuMemSearchVo);
		
		System.out.println("매치업넘버리스트에 해당하는 매치업멤버 뷰 조회 결과, mcumemSearchResultList.size="+mcumemSearchResultList.size());
	
		/*
		 //이제 경력 계산을 하는 거예요 근데 케이스를 여기서 바꾼
		 
		for(int i=0; i<mcumemSearchResultList.size(); i++) {
			Map<String,Object> map=mcumemSearchResultList.get(i);
			
			//신입부터 뽑는거면 아무것도 제외할 필요가 없네
			if(mcuMemSearchVo.getSearchMinCareer().equals("신입") || mcuMemSearchVo.getSearchMaxCareer().equals("신입")) {
				continue;
			}
			//신입부터 n년차까지 뽑는거면 n년차 이상은 제외. 미니멈은 신입이고 맥시멈은 신입이 아니고 전체도 아니고 10도 아닐 때
			if(mcuMemSearchVo.getSearchMinCareer().equals("신입") || !mcuMemSearchVo.getSearchMaxCareer().equals("신입") ||
					!mcuMemSearchVo.getSearchMaxCareer().equals("전체") || !mcuMemSearchVo.getSearchMaxCareer().equals("10") ) {
				
				
			}
		}
		*/
		return mcumemSearchResultList;
	}
	
	//검색결과중에 찜한 멤버 리스트를 골라보자!
	public List<Map<String, Object>> MatchupZzimedList(List<Map<String, Object>> mcumemSearchResultList) {
		List<Map<String, Object>> zzimedList=null;
		zzimedList=matchupMemDao.selectZzimedList(mcumemSearchResultList);
		
		return zzimedList;
	}
	
}
