package com.it.wanted.resume.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.wanted.achievement.model.AchievementDAO;
import com.it.wanted.achievement.model.AchievementVO;
import com.it.wanted.addinformatiod.model.AddinformatiodDAO;
import com.it.wanted.addinformatiod.model.AddinformatiodVO;
import com.it.wanted.career.model.CareerDAO;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.education.model.EducationDAO;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.languages.model.LanguagesDAO;
import com.it.wanted.languages.model.LanguagesVO;
import com.it.wanted.languagestest.model.LanguagestestDAO;
import com.it.wanted.languagestest.model.LanguagestestVO;
import com.it.wanted.link.model.LinkDAO;
import com.it.wanted.link.model.LinkVO;

@Service
public class ResumeServiceImpl implements ResumeService{
	@Autowired 
	private ResumeDAO resumeDao;
	@Autowired 
	private CareerDAO careerDao;
	@Autowired
	private AchievementDAO achievmentDao;
	@Autowired
	private EducationDAO educationDao;
	@Autowired
	private AddinformatiodDAO addinformatiodDao;
	@Autowired
	private LanguagesDAO languagesDao;
	@Autowired
	private LanguagestestDAO languagestestDao;
	@Autowired
	private LinkDAO linkDao;
	
	
	private static final Logger logger= LoggerFactory.getLogger(ResumeServiceImpl.class);
	
	@Override
	public int insertResume(ResumeVO vo) {
		return resumeDao.insertResume(vo);
	}

	@Override
	public ResumeVO selectResume(int memNo) {
		return resumeDao.selectResume(memNo);
	}

	@Override
	@Transactional
	public int updateResume(ResumeAllVO resumeAllVo) {
		ResumeVO rVo= resumeAllVo.getResumeVo();
		List<CareerVO>crrList=resumeAllVo.getCrrList();
		List<AchievementVO>achList=resumeAllVo.getAchList();
		List<EducationVO>eduList=resumeAllVo.getEduList();
		List<AddinformatiodVO>addList=resumeAllVo.getAddList();
		List<LanguagesVO>langList=resumeAllVo.getLangList();
		List<LanguagestestVO>testList=resumeAllVo.getTestList();
		List<LinkVO>linkList=resumeAllVo.getLinkList();
				
		int cnt=0;
		
		try {
			//이력서 등록
			cnt=resumeDao.updateResume(rVo);
			logger.info("이력서 등록={}",rVo);
			
			//경력 List등록
			if(crrList!=null&& !crrList.isEmpty()) {
				for(CareerVO crrVo:crrList) {
					cnt=careerDao.updateCareer(crrVo);
					logger.info("커리어 등록crrVo={}",crrVo);
				}
				//성과List등록
				if(achList!=null&&!achList.isEmpty()) {
					for(AchievementVO achVo:achList) {
						cnt=achievmentDao.updateAch(achVo);
						logger.info("성과 등록achVo={}",achVo);
					}//for
				}//if
			 }//바깥 if
			
			//교육
			if(eduList!=null&& !eduList.isEmpty()) {
				for(EducationVO eduVo:eduList) {
					cnt=educationDao.updateEdu(eduVo);
					logger.info("교육사항등록eduVo={}",eduVo);
				}
			}
			
			//기타활동
			if(addList!=null&& !addList.isEmpty()) {
				for(AddinformatiodVO addVo:addList) {
					cnt=addinformatiodDao.updateAdd(addVo);
					logger.info("기타활동사항 등록 addVo={}",addVo);
				}
			}
			
			//언어
			if(langList!=null&& !langList.isEmpty()) {
				for(LanguagesVO langVo:langList) {
					cnt=languagesDao.updateLang(langVo);
					logger.info("외국어사항 등록langVo={}",langVo);
				}
				//어학
				for(LanguagestestVO testVo:testList) {
					cnt=languagestestDao.updateLangtest(testVo);
					logger.info("어학시험 등록 testVo={}",testVo);
				}
			}
			
			//링크
			if(linkList!=null&& !linkList.isEmpty()) {
				for(LinkVO linkVo:linkList) {
					cnt=linkDao.updateLink(linkVo);
					logger.info("기타활동사항 등록 linkVo={}",linkVo);
				}
			}
				
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	
	
}
