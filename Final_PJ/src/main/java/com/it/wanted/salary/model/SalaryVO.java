package com.it.wanted.salary.model;

public class SalaryVO {
	private int salaryNo;
	private String career;
	private String salary;
	private String jikgunCode;
	private String jikmuCode;
	public int getSalaryNo() {
		return salaryNo;
	}
	public void setSalaryNo(int salaryNo) {
		this.salaryNo = salaryNo;
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
	public String getJikgunCode() {
		return jikgunCode;
	}
	public void setJikgunCode(String jikgunCode) {
		this.jikgunCode = jikgunCode;
	}
	public String getJikmuCode() {
		return jikmuCode;
	}
	public void setJikmuCode(String jikmuCode) {
		this.jikmuCode = jikmuCode;
	}
	@Override
	public String toString() {
		return "SalaryVO [salaryNo=" + salaryNo + ", career=" + career + ", salary=" + salary + ", jikgunCode="
				+ jikgunCode + ", jikmuCode=" + jikmuCode + "]";
	}
	
	
}
