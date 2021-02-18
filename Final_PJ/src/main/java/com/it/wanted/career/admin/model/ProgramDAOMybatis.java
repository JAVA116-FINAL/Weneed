package com.it.wanted.career.admin.model;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.career.cate.model.CareerCategoryVO;
import com.it.wanted.common.SearchVO;


@Repository
public class ProgramDAOMybatis implements ProgramDAO{
	private static final Logger logger = LoggerFactory.getLogger(ProgramServiceImpl.class);

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

	public List<ProgramVO> selectAllprogram(SearchVO searchVo) { 
		return sqlSession.selectList(namespace+"selectAllprogram", searchVo); 
	}

	public int selectListTotalRecord(SearchVO searchVo) { 
		return sqlSession.selectOne(namespace+"selectListTotalRecord", searchVo); 
	}

	@Override
	public int deleteProgram(int programNo) {
		return sqlSession.delete(namespace+"deleteProgram", programNo);
	}

	@Override
	public int insertProgram2(ProgramVO2 proVo2) {
		return sqlSession.insert(namespace+"insertProgram2", proVo2);
	}

	@Override
	public int updateProgramEdit1(ProgramVO proVo) {
		return sqlSession.update(namespace+"updateProgramEdit1", proVo);
	}

	/*
	 * @Override public List<Map<String, Object>>
	 * selectProgramDetailsView(ProgramVO2 proVo2) { return
	 * sqlSession.selectList(namespace+"selectProgramDetailsView", proVo2); }
	 */

	@Override
	public int insertIntoProgramContents(ProgramVO2 proVo2Con) {
        	int cnt = sqlSession.insert(namespace+"insertIntoProgramContents", proVo2Con);
		return cnt;
    }

	@Override
	public List<ProgramVO2> selectProgramContentsView(int programNo) {
		return sqlSession.selectList(namespace+"selectProgramContentsView", programNo);
	}

	@Override
	public ProgramVO selectProgramView(int programNo) {
		return sqlSession.selectOne(namespace+"selectProgramView", programNo);
	}

	@Override
	public int updateProgramEditTotal(ProgramVO2 proVo2Con) {
		int cnt = sqlSession.update(namespace+"updateProgramEditTotal", proVo2Con);
		return cnt;
	}

	@Override
	public int deleteOneProgram(int programNo) {
		return sqlSession.delete(namespace+"deleteOneProgram", programNo);
	}

	@Override
	public String selectMembersName(String email) {
		return sqlSession.selectOne(namespace+"selectMembersName", email);
	}

	@Override
	public List<ProgramVO> selectSimilarProgram() {
		return sqlSession.selectList(namespace+"selectSimilarProgram");
	}

	@Override
	public List<ProgramVO> selectAllProgramsForMain() {
		return sqlSession.selectList(namespace+"selectAllProgramsForMain");
	}

	@Override
	public List<CareerCategoryVO> selectMatchCategoryNameMain() {
		return sqlSession.selectList(namespace+"selectMatchCategoryNameMain");
	}	
				

}


	 
	
