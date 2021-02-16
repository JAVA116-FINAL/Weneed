package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.SqlSessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.SearchVO;

@Repository
public class ApplicantsDAOMybatis implements ApplicantsDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final static String namespace ="com.mybatis.mapper.oracle.applicants.";

//	@Override
//	public List<Map<String, Object>> selectApplicants(String comCode) {
//		return sqlSession.selectList(namespace+"selectApplicants",comCode);
//	}
//	@Override
//	public List<Map<String, Object>> selectApplicants(ApplicantsVO appliVo) {
//		return sqlSession.selectList(namespace+"selectApplicants",appliVo);
//	}
	@Override
	public List<Map<String, Object>> selectApplicants(int statusFlag) {
		return sqlSession.selectList(namespace+"selectApplicants",statusFlag);
	}

	@Override
	public List<ApplicantsVO> selectAllPositions() {
		return sqlSession.selectList(namespace+"selectAllPositions");
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}

	@Override
	public ApplicantsVO selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo",  no);
	}

	@Override
	public List<Map<String, Object>> selectApplicants2() {
		return sqlSession.selectList(namespace+"selectApplicants2");
	}

	/* 자연 */
	@Override
	public int insertApply(ApplicantsVO applyVo) {
		return sqlSession.insert(namespace+"insertApply",applyVo);
	}

	/* 가은 */
	@Override
	public int selectApplyComplete(int memNo) {
		return sqlSession.selectOne(namespace+"selectApplyComplete", memNo);
	}

	@Override
	public int selectDocumentPass(int memNo) {
		return sqlSession.selectOne(namespace +"selectDocumentPass", memNo);
	}

	@Override
	public int selectFinalAccept(int memNo) {
		return sqlSession.selectOne(namespace+"selectFinalAccept", memNo);
	}

	@Override
	public int selectFinalFail(int memNo) {
		return sqlSession.selectOne(namespace+"selectFinalFail", memNo);
	}

//	@Override
//	public int updatePeriod(ApplicantsVO appliVo) {
//		return sqlSession.update(namespace+"updatePeriod",  appliVo);
//	}

}
