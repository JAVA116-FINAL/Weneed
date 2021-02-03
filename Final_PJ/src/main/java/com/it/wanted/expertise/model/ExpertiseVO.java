package com.it.wanted.expertise.model;

public class ExpertiseVO {
	private int expertiseNo;
	private String jikgunCode;
	private String career;
	private String salary;
	private String skill;
	
	public int getExpertiseNo() {
		return expertiseNo;
	}
	public void setExpertiseNo(int expertiseNo) {
		this.expertiseNo = expertiseNo;
	}
	public String getJikgunCode() {
		return jikgunCode;
	}
	public void setJikgunCode(String jikgunCode) {
		this.jikgunCode = jikgunCode;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getSkill() {
		return skill;
	}
	public void setSkill(String skill) {
		this.skill = skill;
	}
	
	@Override
	public String toString() {
		return "ExpertiseVO [expertiseNo=" + expertiseNo + ", jikgunCode=" + jikgunCode + ", career=" + career
				+ ", salary=" + salary + ", skill=" + skill + "]";
	}
	
}
