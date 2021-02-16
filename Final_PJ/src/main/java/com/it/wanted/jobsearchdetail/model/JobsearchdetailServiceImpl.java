package com.it.wanted.jobsearchdetail.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.comimginfo.model.ComImgInfoVO;
import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.position.model.PositionVO;



@Service
public class JobsearchdetailServiceImpl implements JobsearchdetailService{
	@Autowired JobsearchdetailDAO jobsearchdetailDao;

	
	/* 지원 0215 */

	@Override
	public PositionVO selectPositionInfoJobSearch(int posNo) {
		return jobsearchdetailDao.selectPositionInfoJobSearch(posNo);
	}

	@Override
	public ComInfoVO selectComNameByComNo(int posNo) {
		return jobsearchdetailDao.selectComNameByComNo(posNo);
	}

	@Override
	public String selectComImage(int posNo) {
		return jobsearchdetailDao.selectComImage(posNo);
	}

	@Override
	public List<Map<String, Object>> selectAllRecruites(int posNo) {
		return jobsearchdetailDao.selectAllRecruites(posNo);
	}

	@Override
	public String selectMemberName(String email) {
		return jobsearchdetailDao.selectMemberName(email);
	}
	
}
