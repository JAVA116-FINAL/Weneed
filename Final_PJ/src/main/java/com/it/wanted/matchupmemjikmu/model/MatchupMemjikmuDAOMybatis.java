package com.it.wanted.matchupmemjikmu.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MatchupMemjikmuDAOMybatis implements MatchupMemjikmuDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private static final String namespace="config.mybatis.mapper.oracle.matchupmemjikmu.";
	
	@Override
	public int insertMatchupMemJikmu(MatchupMemJikmuVO mmjikmuVo) {
		return sqlSession.insert(namespace+"insertMatchupMemJikmu",mmjikmuVo);
	}

	@Override
	public List<MatchupMemJikmuVO> selectMcuMemjikmubyexpertiseNo(int expertiseNo) {
		return sqlSession.selectList(namespace+"selectMcuMemjikmubyexpertiseNo", expertiseNo);
	}

	@Override
	public List<Map<String, Object>> selectMjikmuView(int expertiseNo) {
		return sqlSession.selectList(namespace+"selectMjikmuView",expertiseNo);
	}

	@Override
	public int deleteMatchupJikmu(int expertiseNo) {
		return sqlSession.delete(namespace+"deleteMatchupJikmu",expertiseNo);
	}

	@Override
	public List<Integer> selectMcumemNo(String searchJikmu) {
		return sqlSession.selectList(namespace+"selectMcumemNo", searchJikmu);
	}
	
	
	
}
