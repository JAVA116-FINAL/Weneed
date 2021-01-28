package com.it.wanted.achievement.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AchievementServiceImpl implements AchievementService{
	@Autowired
	private AchievementDAO achievementDao;

	@Override
	public int insertAch(AchievementVO aVo) {
		return achievementDao.insertAch(aVo);
	}

	@Override
	public AchievementVO selectAch(int careerNo) {
		return achievementDao.selectAch(careerNo);
	}

	@Override
	public int deleteAch(int achNo) {
		return achievementDao.deleteAch(achNo);
	}

}
