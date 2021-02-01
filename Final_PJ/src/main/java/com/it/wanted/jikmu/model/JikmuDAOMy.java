package com.it.wanted.jikmu.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JikmuDAOMy implements JikmuDAO {

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.jikgunJikmu.";
}
