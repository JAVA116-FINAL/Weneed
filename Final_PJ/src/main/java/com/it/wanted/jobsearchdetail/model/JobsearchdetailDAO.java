package com.it.wanted.jobsearchdetail.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.position.model.PositionVO;

public interface JobsearchdetailDAO {

	/* 지원 0215 */
	public PositionVO selectPositionInfoJobSearch(int posNo);
	public ComInfoVO selectComNameByComNo(int posNo);
	public String selectComImage(int posNo);
	public List<Map<String, Object>> selectAllRecruites(int posNo);
	public String selectMemberName(String email);	
	
	/*유정 추가*/
	public Map<String, Object> selectComNameByComNo_2(int posNo);
}
