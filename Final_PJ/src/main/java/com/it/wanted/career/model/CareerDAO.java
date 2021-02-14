package com.it.wanted.career.model;

import java.util.List;

public interface CareerDAO {
	
	public int insertCareer(CareerVO careerVo);
	public CareerVO selectCareer(int resumeNo);
	public int updateCareer(CareerVO careerVo);
	public int deleteCareer(int careerNo);
	public List<CareerVO> selectCareerbyResumeNo(int resumeNo);
	public int insertMcuCareer(CareerVO careerVo);
	public CareerVO selectCareerOne(int careerNo);
	public int updateCareerNameAndDateAndCurVal(CareerVO careerCo);
	/* 현빈 */
	public List<Integer> selectMcumemNo(String searchKeyword);
}
