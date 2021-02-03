package com.it.wanted.achievement.model;

import java.util.List;

public interface AchievementDAO {

	public int insertAch(AchievementVO aVo);
	public AchievementVO selectAch(int careerNo);
	public int updateAch(AchievementVO aVo);
	public int deleteAch(int achNo);
	public int deleteAchbyCareerNo(int careerNo);
	public List<AchievementVO>selectAchbyCareerNo(int CareerNo);
}
