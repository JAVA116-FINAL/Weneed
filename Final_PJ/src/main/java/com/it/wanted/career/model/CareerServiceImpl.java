package com.it.wanted.career.model;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.it.wanted.achievement.model.AchievementDAO;

@Service
public class CareerServiceImpl implements CareerService{
	@Autowired
	private CareerDAO careerDao;
	@Autowired
	private AchievementDAO achDao;

	@Override
	public int insertCareer(CareerVO careerVo) {
		return careerDao.insertCareer(careerVo);
	}

	@Override
	public CareerVO selectCareer(int resumeNo) {
		return careerDao.selectCareer(resumeNo);
	}

	//커리어 1개 지우고 커리어 관련 성과도 지우기 
	@Transactional
	@Override
	public int deleteCareer(int careerNo) {
		int cnt=0;
			//1
			cnt=achDao.deleteAchbyCareerNo(careerNo);
			//2
			cnt=careerDao.deleteCareer(careerNo);
		return cnt;
	}
	//0210
	@Override
	public CareerVO selectCareerOne(int careerNo) {
		return careerDao.selectCareerOne(careerNo);
	}

}
