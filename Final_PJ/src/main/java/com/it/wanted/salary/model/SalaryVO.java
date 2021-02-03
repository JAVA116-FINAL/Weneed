package com.it.wanted.salary.model;

public class SalaryVO {
	private int salary_no;
	private String career;
	private String salary;
	private String jikgun_code;
	private String jikmu_code;
	
	public int getSalary_no() {
		return salary_no;
	}
	public void setSalary_no(int salary_no) {
		this.salary_no = salary_no;
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
	public String getJikgun_code() {
		return jikgun_code;
	}
	public void setJikgun_code(String jikgun_code) {
		this.jikgun_code = jikgun_code;
	}
	public String getJikmu_code() {
		return jikmu_code;
	}
	public void setJikmu_code(String jikmu_code) {
		this.jikmu_code = jikmu_code;
	}
	
	@Override
	public String toString() {
		return "SalaryVO [salary_no=" + salary_no + ", career=" + career + ", salary=" + salary + ", jikgun_code="
				+ jikgun_code + ", jikmu_code=" + jikmu_code + "]";
	}
	
	
}
