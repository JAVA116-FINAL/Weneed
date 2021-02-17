package com.it.wanted.applicants.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


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

}
