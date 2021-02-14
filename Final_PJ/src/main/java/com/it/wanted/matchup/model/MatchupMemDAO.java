package com.it.wanted.matchup.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.matchupCom.model.MatchupZzimVO;

public interface MatchupMemDAO {

	/* 자연 */
	public int isMatchupMem(int memNo);
	public int hasMcuResumeNo(int memNo);
	public int selectmcuResumeNo(int mcuNo);
	public int insertMcuMem(MatchupMemVO mcuVo);
	public MatchupMemVO selectMcuMem(int memNo);
	public int updateMCUResume(MatchupMemVO mcuVo);
	public List<MatchupDetailAllVO> selectMatchupDetails(int mcumemNo);
	public List<Map<String, Object>> selectMcuExListView(int mcumemNo);
	public int updateMatchupResume(MatchupMemVO mcuVo);
	public MatchupDetailsViewVO selectMatchupDetailsView(int memNo);
	public int updateMatchupRefName(MatchupMemVO mcumemVo);
	public MatchupMemVO selectOnebymatchupMemNo(int mcumemNo);
	public int updateMatchupjobFlag(MatchupMemVO mcuVo);
	public int deleteMatchupmembyResumeNo(int resumeNo);
	
	/* 현빈 */
	List<MatchupMemVO> selectOpen();
	List<Map<String, Object>> selectTenMem(int firstRecord);
	public int selectMcumemNo(int resumeNo);
	public List<Map<String, Object>> selectMcumemSearchList(MatchupMemSearchVO mcuMemSearchVo);
	public List<Map<String, Object>> selectZzimedList(MatchupMemSearchVO searchVo);
	public int isZzimed(MatchupZzimVO zzimVo);

}
