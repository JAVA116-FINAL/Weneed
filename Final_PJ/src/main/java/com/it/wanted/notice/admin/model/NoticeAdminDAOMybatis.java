package com.it.wanted.notice.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.notice.utility.NoticeSearchVO;

@Repository
public class NoticeAdminDAOMybatis implements NoticeAdminDAO{

	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.noticeAdmin.";

	@Override
	public List<Map<String, Object>> selectQnaList() {
		return sqlSession.selectList(namespace+"selectQnaList");
	}

	@Override
	public List<Map<String, Object>> selectQnaDetail_admin(int qna_no) {
		return sqlSession.selectList(namespace+"selectQnaDetail_admin", qna_no);
	}

	@Override
	public List<Map<String, Object>> selectQnaDetail_user(int qna_no) {
		return sqlSession.selectList(namespace+"selectQnaDetail_user", qna_no);
	}
	
	@Override
	public int updateReply(int qna_no) {
		int cnt=sqlSession.update(namespace+"updateReply", qna_no);
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectQnaList_search(NoticeSearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectQnaList_search", searchVo);
	}

	@Override
	public int selectQnaList_cnt(NoticeSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectQnaList_cnt", searchVo);
	}

	@Override
	public int selectReply_cnt(NoticeSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectReply_cnt", searchVo);
	}



}
