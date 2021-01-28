package com.it.wanted.achievement.model;

public interface AchievementService {

	public int insertAch(AchievementVO aVo);
	public AchievementVO selectAch(int careerNo);
	public int deleteAch(int achNo);
}
