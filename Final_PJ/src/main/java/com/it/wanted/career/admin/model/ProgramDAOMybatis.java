package com.it.wanted.career.admin.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.NoticeSearchVO;


@Repository
public class ProgramDAOMybatis implements ProgramDAO{

	@Autowired 
	private SqlSessionTemplate sqlSession; 
	private String namespace="com.mybatis.mapper.oracle.program.";

	
	public int insertProgram(ProgramVO proVo) {
		return sqlSession.insert(namespace+"insertProgram", proVo);

	}
	
	public ProgramVO selectByProgramNo(int programNo) {
		ProgramVO proVo = sqlSession.selectOne(namespace + "selectByProgramNo", programNo);
		return proVo;
	}

	public List<ProgramVO> selectAllprogram(NoticeSearchVO searchVo) { 
		return sqlSession.selectList(namespace+"selectAllprogram", searchVo); 
	}

	public int selectListTotalRecord(NoticeSearchVO searchVo) { 
		return sqlSession.selectOne(namespace+"selectListTotalRecord", searchVo); 
	}

	@Override
	public int deleteProgram(int programNo) {
		return sqlSession.delete(namespace+"deleteProgram", programNo);
	}

	@Override
	public List<ProgramVO2> insertProgram2(ProgramVO2 proVo2) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * @Override public List<ProgramVO2> insertProgram2(ProgramVO2 proVo2) { return
	 * sqlSession.insert(namespace+"insertProgram2", proVo2); }
	 */
	 
	
}