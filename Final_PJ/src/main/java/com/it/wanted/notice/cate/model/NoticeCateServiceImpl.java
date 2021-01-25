package com.it.wanted.notice.cate.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeCateServiceImpl implements NoticeCateService{
	@Autowired NoticeCateDAO noticeCateDao;
	
	@Override
	public String selectCate1(int notice_dept1) {
		return noticeCateDao.selectCate1(notice_dept1);
	}

	@Override
	public String selectCate2(int notice_dept2) {
		return noticeCateDao.selectCate2(notice_dept2);
	}
	
	@Override
	public List<Map<String, Object>> selectDept2Count(int notice_dept1) {
		return noticeCateDao.selectDept2Count(notice_dept1);
	}


}
