package com.it.wanted.career.model;

public interface CareerDAO {
	
	public int insertCareer(CareerVO careerVo);
	public CareerVO selectCareer(int resumeNo);
	public int updateCareer(CareerVO careerVo);
	public int deleteCareer(int careerNo);
}
