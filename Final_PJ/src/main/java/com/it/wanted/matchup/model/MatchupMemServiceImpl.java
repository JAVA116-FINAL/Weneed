package com.it.wanted.matchup.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.wanted.career.model.CareerDAO;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.education.model.EducationDAO;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.expertise.model.ExpertiseDAO;
import com.it.wanted.expertise.model.ExpertiseVO;
import com.it.wanted.matchupCom.model.MatchupZzimVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemJikmuVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemjikmuDAO;
import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeDAO;
import com.it.wanted.resume.model.ResumeVO;

@Service
public class MatchupMemServiceImpl implements MatchupMemService{
	
	@Autowired private MatchupMemDAO matchupMemDao;
	@Autowired private EducationDAO educationDao;
	@Autowired private CareerDAO careerDao;
	@Autowired private ExpertiseDAO expertDao;
	@Autowired private ResumeDAO resumeDao;
	@Autowired private MatchupMemjikmuDAO mmjikmuDao;
	
	private static final Logger logger=LoggerFactory.getLogger(MatchupMemServiceImpl.class);
	
	/* 자연 */
	@Override
	public int selectmcuResumeNo(int memNo) {
		return matchupMemDao.selectmcuResumeNo(memNo);
	}

	@Override
	public int isMatchupMem(int memNo) {
		return matchupMemDao.isMatchupMem(memNo);
	}
	
	@Override
	public int hasMcuResumeNo(int memNo) {
		return matchupMemDao.hasMcuResumeNo(memNo);
	}
	
	@Transactional
	@Override
	public int insertMcuMem(MatchupAllVO mcuAllVo) {
		ExpertiseVO expertVo = mcuAllVo.getExpertVo();
		List<MatchupMemJikmuVO> mmjikmuList = mcuAllVo.getMcujikmuList();
		MatchupMemVO mmVo = mcuAllVo.getMcumemVo();
		
		int cnt=0;
		int expertNo=0;
		
		try {
		//전문가 등록
			logger.info("expertVo={}",expertVo);
			cnt=expertDao.insertExpertise(expertVo);
			if(cnt>0) {
				expertNo=expertDao.selectUptodateExpertNo();
						logger.info("expertiseNo={}",expertNo);
				//직무리스트 등록
				if(mmjikmuList!=null&& !mmjikmuList.isEmpty()) {
					for( MatchupMemJikmuVO mmjikmuVo:mmjikmuList) {
						mmjikmuVo.setExpertiseNo(expertNo);
						if(mmjikmuVo!=null) {
							cnt=mmjikmuDao.insertMatchupMemJikmu(mmjikmuVo);
						}
						
					}//for
				}
				
				//매치업 회원등록
				mmVo.setExpertiseNo(expertNo);
				cnt=matchupMemDao.insertMcuMem(mmVo);
				logger.info("파라미터 mmVo={}, 결과 cnt={}",mmVo,cnt);
			}//if
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	
	@Override
	public MatchupMemVO selectMcuMem(int memNo) {
		return matchupMemDao.selectMcuMem(memNo);
	}
	//2/8 mcu이력서 등록
	@Transactional
	@Override
	public int insertMcuMem2(ResumeAllVO rAllVo, MatchupMemVO mcuVo) {
		ResumeVO resumeVo = rAllVo.getResumeVo();
		List<CareerVO> crrList = rAllVo.getCrrList();
		CareerVO crrVo = crrList.get(0);
		List<EducationVO> eduList = rAllVo.getEduList();
		EducationVO eduVo=eduList.get(0);

		int cnt=0;
		try {
			//1이력서 등록
			cnt=resumeDao.insertMcuResume(resumeVo);
			if(cnt>0) {
				resumeVo=resumeDao.selectResume(resumeVo.getMemNo());
				logger.info("방금 입력한 이력서 resumeVO={}",resumeVo);
				//2.학교 등록
				eduVo.setResumeNo(resumeVo.getResumeNo());
				cnt=educationDao.insertMcuEdu(eduVo);
				
				//3.회사등록
				crrVo.setResumeNo(resumeVo.getResumeNo());
				cnt=careerDao.insertMcuCareer(crrVo);
				
				//4.매치업업뎃!
				mcuVo.setResumeNo(resumeVo.getResumeNo());
				logger.info("매치업 업뎃 매개변수 mcuVo={}", mcuVo);
				cnt=matchupMemDao.updateMCUResume(mcuVo);
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
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
		List<Map<String, Object>> mcumemSearchResultList=new ArrayList<Map<String,Object>>();
		
		//검색어에 대한 멤버번호목록 확보
		mcumemNoList=getMcuMemNoList(mcumemNoList, mcuMemSearchVo);
		
		if(mcumemNoList.size()<1) { //검색결과가 없으면 빈 맵 더해서 리턴(앞단에서 null이면 안됨)
			Map<String, Object> emptyMap=new HashMap<String, Object>();
			mcumemSearchResultList.add(emptyMap);
			return mcumemSearchResultList;
		}
		
		//이제 매치업넘버리스트는 완성됐어 이거에 대한 이력서리스트를 가져와야 해
		mcuMemSearchVo.setMcumemNoList(mcumemNoList);
		
		//한번만 찍어보자 
		System.out.println("searchMinCareer: "+mcuMemSearchVo.getSearchMinCareer());
		System.out.println("searchMaxCareer: "+mcuMemSearchVo.getSearchMaxCareer());
		
		mcumemSearchResultList=matchupMemDao.selectMcumemSearchList(mcuMemSearchVo);
		System.out.println("매치업넘버리스트에 해당하는 매치업멤버 뷰 조회 결과, mcumemSearchResultList.size="+mcumemSearchResultList.size());
	
		return mcumemSearchResultList;
	}

	//검색한 매치업멤버 번호 목록을 확보하는 메소드
	private List<Integer> getMcuMemNoList(List<Integer> mcumemNoList, MatchupMemSearchVO mcuMemSearchVo) {
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
		
		return mcumemNoList;
	}

	/*
	//검색결과중에 찜한 멤버 리스트를 골라보자!
	public List<Map<String, Object>> MatchupZzimedList(List<Map<String, Object>> mcumemSearchResultList) {
		List<Map<String, Object>> zzimedList=null;
		zzimedList=matchupMemDao.selectZzimedList(mcumemSearchResultList);
		
		return zzimedList;
	}
	 */
	
	@Override
	public List<Map<String, Object>> selectZzimedList(MatchupMemSearchVO searchVo) {
		List<Integer> mcumemNoList=new ArrayList<Integer>();
		List<Map<String, Object>> zzimedList=new ArrayList<Map<String,Object>>();
		
		//검색어로 검색하고 중복을 제거한 결과
		mcumemNoList=getMcuMemNoList(mcumemNoList, searchVo);
		searchVo.setMcumemNoList(mcumemNoList);

		zzimedList=matchupMemDao.selectZzimedList(searchVo);
		System.out.println("찜한 목록 서칭 결과, zzimedList.size="+zzimedList.size());
		
		return zzimedList;
	}

	@Override
	public int isZzimed(int resumeNo, String comCode) {
		int cnt=0;
		
		int mcumemNo=matchupMemDao.selectMcumemNo(resumeNo);
		MatchupZzimVO zzimVo=new MatchupZzimVO();
		zzimVo.setComCode(comCode);
		zzimVo.setMcumemNo(mcumemNo);
		
		cnt=matchupMemDao.isZzimed(zzimVo);
		
		return cnt;
	}
	
}
