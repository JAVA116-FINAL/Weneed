package com.it.wanted.expertise.model;

import java.util.List;

public interface ExpertiseDAO {

	/* 현빈 */
	List<Integer> selectMcumemNo(String keyword);

	/* 자연 */
	public int insertExpertise(ExpertiseVO expertiseVO);
	public int selectUptodateExpertNo();
	public ExpertiseVO selectExpertise(int expertiseNo);
	public int updateMatchupExpertise(ExpertiseVO expertiseVo);
	public int deleteExpertise(int expertiseNo);
}
