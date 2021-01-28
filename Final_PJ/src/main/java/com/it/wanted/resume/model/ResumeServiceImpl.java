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
import com.it.wanted.career.model.CareerDAO;
import com.it.wanted.career.model.CareerVO;

@Service
public class ResumeServiceImpl implements ResumeService{
	@Autowired 
	private ResumeDAO resumeDao;
	@Autowired 
	private CareerDAO careerDao;
	@Autowired
	private AchievementDAO achievmentDao;
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
		List<CareerVO>cList=resumeAllVo.getCrrList();
		List<AchievementVO>aList=resumeAllVo.getAchList();
		int cnt=0;
		try {
			//이력서 등록
			cnt=resumeDao.updateResume(rVo);
			logger.info("이력서 등록={}",rVo);
			//경력 List등록
			if(cList!=null&& !cList.isEmpty()) {
				for(CareerVO cVo:cList) {
					cnt=careerDao.updateCareer(cVo);
					logger.info("커리어 등록={}",cVo);
				}
				//성과List등록
				if(aList!=null&&!aList.isEmpty()) {
					for(AchievementVO aVo:aList) {
						cnt=achievmentDao.updateAch(aVo);
						logger.info("성과 등록={}",aVo);
					}//for
				}//if
				
			 }//바깥 if
		} catch (RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}

	
	
}
