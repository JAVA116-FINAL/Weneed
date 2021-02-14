package com.it.wanted.notice.admin.model;

import java.util.List;
import java.util.Map;

import com.it.wanted.notice.model.QnaReplyVO;
import com.it.wanted.notice.utility.NoticeSearchVO;

public interface NoticeAdminDAO {
	//등록된 1:1문의 전체 조회
	public List<Map<String, Object>> selectQnaList();
	//1:1문의 상세보기 - 유저
	public List<Map<String, Object>> selectQnaDetail_user(int qna_no);
	//1:1문의 상세보기 - 관리자
	public List<Map<String, Object>> selectQnaDetail_admin(int qna_no);
	//미답변 1:1문의 갯수
	public int selectReply_cnt(NoticeSearchVO searchVo);
	//답변여부 'Y'로 업데이트
	public int updateReply(int qna_no);
	
	public List<Map<String, Object>> selectQnaList_search(NoticeSearchVO searchVo);
	public int selectQnaList_cnt(NoticeSearchVO searchVo);
	
	public int insertQnaReply(QnaReplyVO qnaReplyVo);
}
