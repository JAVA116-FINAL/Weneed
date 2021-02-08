package com.it.wanted.matchupmemjikmu.model;

public class MatchupMemJikmuVO {
	
	private int mcumemJikmuNo;//MCUMEM_JIKMU_NO NUMBER PRIMARY KEY, /* 매치업 직무 번호 */
	private String jikmuCode;//JIKMU_CODE VARCHAR2(50) REFERENCES JIKMU(JIKMU_CODE)ON DELETE CASCADE, /* 직무코드 */
	private int expertiseNo;//EXPERTISE_NO NUMBER REFERENCES EXPERTISE(EXPERTISE_NO)ON DELETE CASCADE/* 전문분야 번호 */
	
	public int getMcumemJikmuNo() {
		return mcumemJikmuNo;
	}
	public void setMcumemJikmuNo(int mcumemJikmuNo) {
		this.mcumemJikmuNo = mcumemJikmuNo;
	}
	public String getJikmuCode() {
		return jikmuCode;
	}
	public void setJikmuCode(String jikmuCode) {
		this.jikmuCode = jikmuCode;
	}
	public int getExpertiseNo() {
		return expertiseNo;
	}
	public void setExpertiseNo(int expertiseNo) {
		this.expertiseNo = expertiseNo;
	}
	@Override
	public String toString() {
		return "MatchupMemJikmuVO [mcumemJikmuNo=" + mcumemJikmuNo + ", jikmuCode=" + jikmuCode + ", expertiseNo="
				+ expertiseNo + "]";
	}
	
	
	
	
}
