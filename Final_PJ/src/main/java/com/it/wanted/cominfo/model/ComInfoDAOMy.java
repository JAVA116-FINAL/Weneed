package com.it.wanted.cominfo.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComInfoDAOMy implements ComInfoDAO{
	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.comInfo.";
	
	@Override
	public ComInfoVO selectCompany(int comMemNo) {
		return sqlSession.selectOne(namespace+"selectCompany", comMemNo);
	}

	@Override
	public List<IndustryVO> selectIndustryList() {
		return sqlSession.selectList(namespace+"selectIndustryList");
	}

	@Override
	public List<NationVO> selectNationList() {
		return sqlSession.selectList(namespace+"selectNationList");
	}

	@Override
	public List<RegionVO> selectRegionList(String nationCode) {
		return sqlSession.selectList(namespace+"selectRegionList", nationCode);
	}

	@Override
	public List<ComSizeInfoVO> selectComSizeList() {
		return sqlSession.selectList(namespace+"selectComSizeList");
	}

	@Override
	public int insertComInfo(ComInfoVO comInfoVo) {
		return sqlSession.insert(namespace+"insertComInfo", comInfoVo);
	}

	@Override
	public List<ComInfoVO> selectAllCompany() {
		return sqlSession.selectList(namespace+"selectAllCompany");
	}

	@Override
	public int changeStatusYettoPass(String comCode) {
		return sqlSession.update(namespace+"changeStatusYettoPass", comCode);
	}
	
	
}
