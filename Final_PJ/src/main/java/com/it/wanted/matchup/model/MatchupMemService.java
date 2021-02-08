package com.it.wanted.matchup.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeVO;

public interface MatchupMemService {

	/* 자연 */
	public int isMatchupMem(int memNo);
	public int selectmcuResumeNo(int memNo);
	public int hasMcuResumeNo(int memNo);
	public int insertMcuMem(MatchupAllVO mmAllVo);
	public MatchupMemVO selectMcuMem(int memNo);
	public int insertMcuMem2(ResumeAllVO rAllVo,MatchupMemVO mcuVo);//이력서 등록 후 mcu에 업뎃
	
	/* 현빈 */
	List<MatchupMemVO> selectOpen();
	List<Map<String, Object>> selectTenMem(int firstRecord);
	int selectMcumemNo(int resumeNo);
	List<Map<String, Object>> selectSearchedMemList(MatchupMemSearchVO mcuMemSearchVo);
}
