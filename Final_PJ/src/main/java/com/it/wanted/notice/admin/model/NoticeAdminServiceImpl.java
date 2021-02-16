package com.it.wanted.notice.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.notice.model.NoticeVO;
import com.it.wanted.notice.model.QnaReplyVO;
import com.it.wanted.notice.utility.NoticeSearchVO;

@Service
public class NoticeAdminServiceImpl implements NoticeAdminService{
	@Autowired private NoticeAdminDAO noticeAdminDao;

	@Override
	public List<Map<String, Object>> selectQnaList() {
		return noticeAdminDao.selectQnaList();
	}

	@Override
	public List<Map<String, Object>> selectQnaDetail_admin(int qna_no) {
		return noticeAdminDao.selectQnaDetail_admin(qna_no);
	}
	
	@Override
	public int updateReply(int qna_no) {
		return noticeAdminDao.updateReply(qna_no);
	}

	@Override
	public List<Map<String, Object>> selectQnaDetail_user(int qna_no) {
		return noticeAdminDao.selectQnaDetail_user(qna_no);
	}

	@Override
	public List<Map<String, Object>> selectQnaList_search(NoticeSearchVO searchVo) {
		return noticeAdminDao.selectQnaList_search(searchVo);
	}

	@Override
	public int selectQnaList_cnt(NoticeSearchVO searchVo) {
		return noticeAdminDao.selectQnaList_cnt(searchVo);
	}

	@Override
	public int selectReply_cnt(NoticeSearchVO searchVo) {
		return noticeAdminDao.selectReply_cnt(searchVo);
	}

	@Override
	public int insertQnaReply(QnaReplyVO qnaReplyVo) {
		return noticeAdminDao.insertQnaReply(qnaReplyVo);
	}

	@Override
	public List<Map<String, Object>> selectNoticeAll(NoticeSearchVO searchVo) {
		return noticeAdminDao.selectNoticeAll(searchVo);
	}

	@Override
	public int selectNoticeAll_cnt(NoticeSearchVO searchVo) {
		return noticeAdminDao.selectNoticeAll_cnt(searchVo);
	}

	@Override
	public int deleteNotice(int notice_no) {
		return noticeAdminDao.deleteNotice(notice_no);
	}

	@Override
	public int updateNotice(NoticeVO noticeVo) {
		return noticeAdminDao.updateNotice(noticeVo);
	}

	@Override
	public List<Map<String, Object>> selectByDept1(int notice_dept1) {
		return noticeAdminDao.selectByDept1(notice_dept1);
	}

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		return noticeAdminDao.insertNotice(noticeVo);
	}

	@Override
	public int updateReply_mute(int qna_no) {
		return noticeAdminDao.updateReply_mute(qna_no);
	}


}
