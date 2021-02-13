package com.it.wanted.notice.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


}
