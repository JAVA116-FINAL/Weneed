package com.it.wanted.notice.model;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {
	//main
	public List<Map<String, Object>> selectMain1(); //개인회원 자주 묻는 질문
	public List<Map<String, Object>> selectMain2(); //기업회원 자주 묻는 질문
	public List<Map<String, Object>> selectMain3(); //원티드 소식 상위 N건 출력
	
	//이 섹션의 문서 include
	public List<Map<String, Object>> selectOther(int notice_dept2);
	
	//dept1에서 소분류별 최대 6건씩 출력
	public List<Map<String, Object>> selectByDept2(int notice_dept2);
	
	public List<NoticeVO> select_dept1(int notice_dept1);
	public List<NoticeVO> select_dept2(int notice_dept2);
	public Map<String, Object> selectDetail(int notice_no);
	
	//검색관련
	public List<Map<String, Object>> noticeSearch(String keyword);
	public Map<String, Object> noticeSearchCnt(String keyword);
}
