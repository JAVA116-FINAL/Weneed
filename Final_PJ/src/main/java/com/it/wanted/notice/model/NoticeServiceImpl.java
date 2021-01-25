package com.it.wanted.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired NoticeDAO noticeDao;
	
	@Override
	public List<NoticeVO> select_dept1(int notice_dept1) {
		return noticeDao.select_dept1(notice_dept1);
	}

	@Override
	public List<NoticeVO> select_dept2(int notice_dept2) {
		return noticeDao.select_dept2(notice_dept2);
	}

	@Override
	public List<Map<String, Object>> selectMain1() {
		return noticeDao.selectMain1();
	}

	@Override
	public List<Map<String, Object>> selectMain2() {
		return noticeDao.selectMain2();
	}

	@Override
	public List<Map<String, Object>> selectMain3() {
		return noticeDao.selectMain3();
	}

	@Override
	public Map<String, Object> selectDetail(int notice_no) {
		return noticeDao.selectDetail(notice_no);
	}

	@Override
	public List<Map<String, Object>> selectOther(int notice_dept2) {
		return noticeDao.selectOther(notice_dept2);
	}

	@Override
	public List<Map<String, Object>> selectByDept2(int notice_dept2) {
		return noticeDao.selectByDept2(notice_dept2);
	}

}
