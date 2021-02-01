package com.it.wanted.comimginfo.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComImgInfoDAOMy implements ComImgInfoDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.comImgInfo.";
	
	@Override
	public int selectRegedImgCnt(String comCode) {
		return sqlSession.selectOne(namespace+"selectRegedImgCnt", comCode);
	}

	@Override
	public List<ComImgInfoVO> selectAllImg(String comCode) {
		return sqlSession.selectList(namespace+"selectAllImg", comCode);
	}

	@Override
	public int insertImg(ComImgInfoVO imgVo) {
		return sqlSession.insert(namespace+"insertImg", imgVo);
	}

	@Override
	public int deleteImg(String imgFileName) {
		return sqlSession.delete(namespace+"deleteImg", imgFileName);
	}

	@Override
	public List<ComImgInfoVO> selectAllImage() {
		return sqlSession.selectList(namespace+"selectAllImage");
	}
	
}
