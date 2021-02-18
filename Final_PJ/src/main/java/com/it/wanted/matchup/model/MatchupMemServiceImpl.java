package com.it.wanted.matchup.model;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.Iterator;
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
import com.it.wanted.common.SearchVO;
import com.it.wanted.education.model.EducationDAO;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.expertise.model.ExpertiseDAO;
import com.it.wanted.expertise.model.ExpertiseVO;
import com.it.wanted.matchupCom.model.MatchupZzimVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemJikmuVO;
import com.it.wanted.matchupmemjikmu.model.MatchupMemjikmuDAO;
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
						if(mmjikmuVo!=null) {
							mmjikmuVo.setExpertiseNo(expertNo);
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
	public int insertMcuMem2(MatchupAllVO mAllVo) {
		ResumeVO resumeVo = mAllVo.getResumeVo();
		EducationVO eduVo = mAllVo.getEduVo();
		CareerVO crrVo = mAllVo.getCareerVo();
		MatchupMemVO mcuVo = mAllVo.getMcumemVo();

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
	//0209
	@Override
	public List<MatchupDetailAllVO> selectMatchupDetails(int mcumemNo) {
		return matchupMemDao.selectMatchupDetails(mcumemNo);
	}
	@Override
	public List<Map<String, Object>> selectMcuExListView(int mcumemNo) {
		return matchupMemDao.selectMcuExListView(mcumemNo);
	}
	
	//0210
	@Override
	public int updateMatchupResume(MatchupMemVO mcuVo) {
		return matchupMemDao.updateMatchupResume(mcuVo);
	}
	
	@Override
	public MatchupDetailsViewVO selectMatchupDetailsView(int memNo) {
		return matchupMemDao.selectMatchupDetailsView(memNo);
	}
	
	@Transactional
	@Override
	public int updateMatcupInfo2(MatchupAllVO mAllVo) {
		ResumeVO resumeVo = mAllVo.getResumeVo();
		EducationVO eduVo = mAllVo.getEduVo();
		CareerVO careerVo = mAllVo.getCareerVo();
		int cnt=0;
		try {
			//1.
			cnt=resumeDao.updateResumeIntroduce(resumeVo);
			//2
			cnt=educationDao.updateEduName(eduVo);
			//3
			cnt=careerDao.updateCareerNameAndDateAndCurVal(careerVo);
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	//0211
	@Transactional
	@Override
	public int updateMatcupInfo1(MatchupAllVO mAllVo) {
		int cnt=0;
		try {
			ExpertiseVO expertiseVo = mAllVo.getExpertVo();
			List<MatchupMemJikmuVO> mjikmuList = mAllVo.getMcujikmuList();
			cnt=expertDao.updateMatchupExpertise(expertiseVo);
			
			if(mjikmuList!=null&& !mjikmuList.isEmpty()) {
				cnt=mmjikmuDao.deleteMatchupJikmu(expertiseVo.getExpertiseNo());
				for( MatchupMemJikmuVO mjikmuVo:mjikmuList) {
					if(mjikmuVo!=null) {
						mjikmuVo.setExpertiseNo(expertiseVo.getExpertiseNo());
						cnt=mmjikmuDao.insertMatchupMemJikmu(mjikmuVo);
					}
				}//for
			}//if
		}catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	@Override
	public int updateMatchupRefName(MatchupMemVO mcuVo) {
		return matchupMemDao.updateMatchupRefName(mcuVo);
	}
	

	@Override
	public MatchupMemVO selectOnebymatchupMemNo(int mcumemNo) {
		return matchupMemDao.selectOnebymatchupMemNo(mcumemNo);
	}
	
	@Override
	public int updateMatchupjobFlag(MatchupMemVO mcuVo) {
		return matchupMemDao.updateMatchupjobFlag(mcuVo);
	}
	
	/* 2/15 */
	@Override
	public List<Map<String, Object>> selectMatchupMemAllbyAdmin(SearchVO searchVo) {
		return matchupMemDao.selectMatchupMemAllbyAdmin(searchVo);
	}
	
	@Override
	public int totalRecordbyAdmin(SearchVO searchVo) {
		return matchupMemDao.totalRecordbyAdmin(searchVo);
	}
	
	/* 0218자연 */
	@Override
	public int matchupLikeCountbyMemNo(int memNo) {
		return matchupMemDao.matchupLikeCountbyMemNo(memNo);
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
		System.out.println("mcumemNoList.size(): "+mcumemNoList.size());
		System.out.println("mcumemNoList: "+mcumemNoList);
		
		//System.out.println("searchMinCareer: "+mcuMemSearchVo.getSearchMinCareer());
		//System.out.println("searchMaxCareer: "+mcuMemSearchVo.getSearchMaxCareer());
		
		mcumemSearchResultList=matchupMemDao.selectMcumemSearchList(mcuMemSearchVo);
		System.out.println("매치업넘버리스트에 해당하는 매치업멤버 뷰 조회 결과, mcumemSearchResultList.size="+mcumemSearchResultList.size());
		System.out.println("매치업넘버리스트에 해당하는 매치업멤버 뷰 조회 결과, mcumemSearchResultList="+mcumemSearchResultList);
	
		return mcumemSearchResultList;
	}

	@Override
	public List<Map<String, Object>> selectZzimedList(MatchupMemSearchVO searchVo) {
		List<Integer> mcumemNoList=new ArrayList<Integer>();
		List<Map<String, Object>> zzimedList=new ArrayList<Map<String,Object>>();
		
		//검색어로 검색하고 중복을 제거한 결과
		mcumemNoList=getMcuMemNoList(mcumemNoList, searchVo);
		searchVo.setMcumemNoList(mcumemNoList);
		System.out.println("찜한 목록 서칭용 searchVo 세팅값: "+searchVo);

		zzimedList=matchupMemDao.selectZzimedList(searchVo);
		System.out.println("찜한 목록 서칭 결과, zzimedList.size="+zzimedList.size());
		
		return zzimedList;
	}

	@Transactional
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
	
	//검색한 매치업멤버 번호 목록을 확보하는 메소드
	@Transactional
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
		
		//직무가 전체가 아닐 때는 직무번호랑 겹치는것만 보내야 함
		System.out.println("직무 검색어: "+mcuMemSearchVo.getSearchJikmu());
		String jikmu=mcuMemSearchVo.getSearchJikmu().trim();
		
		if(!jikmu.equals("") ) {
			System.out.println("1번 if문 통과");
		}
		if(!jikmu.equals("all")) { //true
			System.out.println("2번 if문 통과");
		}
		if(!jikmu.isEmpty()) {
			System.out.println("3번 if문 통과");
		}
		if(jikmu != null) { //true
			System.out.println("4번 if문 통과");
		}
		
		if(jikmu.equals("") ) { //true
			System.out.println("5번 if문 통과");
		}
		if(jikmu.equals("all")) {
			System.out.println("6번 if문 통과");
		}
		if(jikmu.isEmpty()) { //true
			System.out.println("7번 if문 통과");
		}
		
		//직무를 선택한 경우에만 확인하고 싶어.
		if( !jikmu.equals("") && !jikmu.isEmpty() && !jikmu.equals("all")) { //앞에서 디폴트값 작업을 해줌
			System.out.println("직무를 선택한 경우, if문 안에 들어왔다!");
			//멤버직무에 해당하는 매치업번호 리스트.. 를 보고 이거랑 검색결과가 일치하는 애들만 보내면 돼 
			List<Integer> jikmuMcumemNoList=mmjikmuDao.selectMcumemNo(mcuMemSearchVo.getSearchJikmu());
			System.out.println("직무 검색결과 jikmuMcumemNoList.size="+jikmuMcumemNoList.size());
			
			//모든 검색결과에 대해, 직무로 서치한 리스트에 중복값이 없다면 제거해야 함.. 
			//iterator 써보기
			Iterator<Integer> iter=mcumemNoList.iterator();
			while(iter.hasNext()) {
				if(!jikmuMcumemNoList.contains(iter.next())) {
					iter.remove();
				}
			}
			
		}
		
		System.out.println("검색결과 매치업멤넘 리스트 길이="+mcumemNoList.size());
		
		return mcumemNoList;
	}

	@Override
	public int selectMemNo(int resumeNo) {
		return matchupMemDao.selectMemNo(resumeNo);
	}

	/* 0218 현빈 추가 */
	@Override
	@Transactional
	public List<Map<String, Object>> selectDidntReadList(MatchupMemSearchVO searchVo) {
		List<Integer> mcumemNoList=new ArrayList<Integer>();
		List<Map<String, Object>> didntReadList=new ArrayList<Map<String,Object>>();
		
		//검색어로 검색하고 중복을 제거한 결과
		mcumemNoList=getMcuMemNoList(mcumemNoList, searchVo);
		searchVo.setMcumemNoList(mcumemNoList);
		System.out.println("미열람한 목록 서칭용 searchVo 세팅값: "+searchVo);

		didntReadList=matchupMemDao.selectDidntReadList(searchVo);
		System.out.println("미열람한 목록 서칭 결과, didntReadList.size="+didntReadList.size());
		
		return didntReadList;
	}

	@Override
	@Transactional
	public List<Map<String, Object>> selectReadList(MatchupMemSearchVO searchVo) {
		List<Integer> mcumemNoList=new ArrayList<Integer>();
		List<Map<String, Object>> ReadList=new ArrayList<Map<String,Object>>();
		
		//검색어로 검색하고 중복을 제거한 결과
		mcumemNoList=getMcuMemNoList(mcumemNoList, searchVo);
		searchVo.setMcumemNoList(mcumemNoList);
		System.out.println("열람한 목록 서칭용 searchVo 세팅값: "+searchVo);

		ReadList=matchupMemDao.selectReadList(searchVo);
		System.out.println("열람한 목록 서칭 결과, ReadList.size="+ReadList.size());
		
		return ReadList;
	}

	@Override
	public List<Map<String, Object>> selectProposedList(MatchupMemSearchVO searchVo) {
		List<Integer> mcumemNoList=new ArrayList<Integer>();
		List<Map<String, Object>> PropoList=new ArrayList<Map<String,Object>>();
		
		//검색어로 검색하고 중복을 제거한 결과
		mcumemNoList=getMcuMemNoList(mcumemNoList, searchVo);
		searchVo.setMcumemNoList(mcumemNoList);
		System.out.println("열람한 목록 서칭용 searchVo 세팅값: "+searchVo);

		PropoList=matchupMemDao.selectProposedList(searchVo);
		System.out.println("열람한 목록 서칭 결과, PropoList.size="+PropoList.size());
		
		return PropoList;
	}
	
}
