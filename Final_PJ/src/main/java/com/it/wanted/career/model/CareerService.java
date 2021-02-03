package com.it.wanted.career.model;

public interface CareerService {
	
	public int insertCareer(CareerVO careerVo);
	public CareerVO selectCareer(int resumeNo);
	public int deleteCareer(int careerNo);
}
