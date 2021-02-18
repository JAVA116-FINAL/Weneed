package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.SearchVO;


@Repository
public class ApplicantsDAOMybatis implements ApplicantsDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final static String namespace ="com.mybatis.mapper.oracle.applicants.";

	@Override
	public List<Map<String, Object>> selectApplicants(AppliPagingVO appliPagingVo) {
		return sqlSession.selectList(namespace+"selectApplicants",appliPagingVo);
	}

	@Override
	public List<ApplicantsVO> selectAllPositions(String comCode) {
		return sqlSession.selectList(namespace+"selectAllPositions",comCode);
	}

	@Override
	public int selectTotalRecord(AppliPagingVO appliPagingVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", appliPagingVo);
	}

	@Override
	public ApplicantsVO selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo",  no);
	}

	@Override
	public int updateByNo(int no) {
		return sqlSession.update(namespace+"updateByNo", no);
	}

	@Override
	public List<Map<String, Object>> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public int updateStatus(ApplicantsVO applicantsVo) {
		return sqlSession.update(namespace+"updateStatus", applicantsVo);
	}

	@Override
	public int countBunmo(AppliPagingVO appliPagingVo) {
		return sqlSession.selectOne(namespace+"countBunmo",appliPagingVo);
	}

	@Override
	public int countBunja(AppliPagingVO appliPagingVo) {
		return sqlSession.selectOne(namespace+"countBunja",appliPagingVo);
	}

	/* 자연 */
	@Override
	public int insertApply(ApplicantsVO applyVo) {
		return sqlSession.insert(namespace+"insertApply",applyVo);
	}
 
	@Override
	public List<Map<String, Object>> selectApplyAllbyAdmin(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectApplyAllbyAdmin",searchVo);
	}

	@Override
	public int selectTotalRecordbyAdmin(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecordbyAdmin",searchVo);
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

	@Override
	public int selectApplyTotal(int memNo) {
		return sqlSession.selectOne(namespace+"selectApplyTotal", memNo);
	}

	@Override
	public List<Map<String, Object>> selectApplyList(int memNo) {
		return sqlSession.selectList(namespace+"selectApplyList", memNo);
	}
}
