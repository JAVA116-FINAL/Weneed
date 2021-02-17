package com.it.wanted.mybookmark.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybookmarkDAOMybatis implements MybookmarkDAO{
	@Autowired SqlSessionTemplate sqlsession;
	private static final String namespace="config.mybatis.mapper.oracle.mybookmark.";
	@Override
	public int isBookmark(MybookmarkVO mybookmarkVo) {
		return sqlsession.selectOne(namespace+"isBookmark",mybookmarkVo);
	}
	@Override
	public int insertBookmark(MybookmarkVO mybookmarkVo) {
		return sqlsession.insert(namespace+"insertBookmark",mybookmarkVo);
	}
	@Override
	public int deleteBookmark(MybookmarkVO mybookmarkVo) {
		return sqlsession.delete(namespace+"deleteBookmark",mybookmarkVo);
	}
	
	
	
}
