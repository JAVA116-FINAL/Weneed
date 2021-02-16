package com.it.wanted.notice.admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.notice.model.NoticeVO;
import com.it.wanted.notice.model.QnaReplyVO;
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

	@Override
	public int insertQnaReply(QnaReplyVO qnaReplyVo) {
		return sqlSession.insert(namespace+"insertQnaReply", qnaReplyVo);
	}

	@Override
	public List<Map<String, Object>> selectNoticeAll(NoticeSearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectNoticeAll", searchVo);
	}

	@Override
	public int selectNoticeAll_cnt(NoticeSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectNoticeAll_cnt", searchVo);
	}

	@Override
	public int deleteNotice(int notice_no) {
		return sqlSession.delete(namespace+"deleteNotice", notice_no);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return sqlSession.update(namespace+"updateNotice", noticeVo);
	}

	@Override
	public List<Map<String, Object>> selectByDept1(int notice_dept1) {
		return sqlSession.selectList(namespace+"selectByDept1", notice_dept1);
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return sqlSession.insert(namespace+"insertNotice", noticeVo);
	}

	@Override
	public int updateReply_mute(int qna_no) {
		return sqlSession.update(namespace+"updateReply_mute", qna_no);
	}



}
