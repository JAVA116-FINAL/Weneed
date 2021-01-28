package com.it.wanted.jikgun.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.jikmu.model.JikmuVO;

@Repository
public class JikgunDAOMy implements JikgunDAO {

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.jikgunJikmu.";
	@Override
	public List<JikgunVO> selectAllJikgun() {
		return sqlSession.selectList(namespace+"selectAllJikgun");
	}
	
	@Override
	public String selectBasicJikgunCode() {
		return sqlSession.selectOne(namespace+"selectBasicJikgunCode");
	}

	@Override
	public List<JikmuVO> selectJikmuByJikgunCode(String basicCode) {
		return sqlSession.selectList(namespace+"selectJikmuByJikgunCode", basicCode);
	}
}
