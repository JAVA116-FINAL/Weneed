package com.it.wanted.notice.cate.model;

import java.util.List;
import java.util.Map;

public interface NoticeCateDAO {
	public String selectCate1(int notice_dept1);
	public String selectCate2(int notice_dept2);
	public List<Map<String, Object>> selectDept2Count(int notice_dept1);
}
