package com.it.wanted.career.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.SearchVO;


@Repository
public class ProgramDAOMybatis implements ProgramDAO{

	@Autowired 
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.mybatis.mapper.oracle.program.";
	
	public int insertProgram(ProgramVO proVo) {
		int cnt = sqlSession.insert(namespace+"insertProgram", proVo);
		return cnt;
	}
	
	public ProgramVO selectByProgramNo(int programNo) {
		ProgramVO proVo = sqlSession.selectOne(namespace + "selectByProgramNo", programNo);
		return proVo;
	}

	@Override
	public List<ProgramVO> selectAll(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAll", searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", searchVo);
	}
	
}
