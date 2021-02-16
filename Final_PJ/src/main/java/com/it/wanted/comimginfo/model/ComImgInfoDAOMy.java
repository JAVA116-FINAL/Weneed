package com.it.wanted.comimginfo.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.common.SearchVO;

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

	@Override
	public int changeStatustoPass(int comImgNo) {
		return sqlSession.update(namespace+"changeStatustoPass", comImgNo);
	}

	@Override
	public List<ComImgInfoVO> selectAllYetImg(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAllYetImg", searchVo);
	}

	@Override
	public int selectYetTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectYetTotalRecord", searchVo);
	}

	@Override
	public List<ComImgInfoVO> selectAllPassedImg(SearchVO searchVo2) {
		return sqlSession.selectList(namespace+"selectAllPassedImg", searchVo2);
	}

	@Override
	public int selectPassedTotalRecord(SearchVO searchVo2) {
		return sqlSession.selectOne(namespace+"selectPassedTotalRecord", searchVo2);
	}
	
}
