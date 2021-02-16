package com.it.wanted.cominfo.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.wanted.common.SearchVO;

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
	public List<ComInfoVO> selectAllCompany(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAllCompany", searchVo);
	}

	@Override
	public int changeStatusYettoPass(String comCode) {
		return sqlSession.update(namespace+"changeStatusYettoPass", comCode);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}

	@Override
	public List<ComInfoVO> selectAllYetCompany(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAllYetCompany", searchVo);
	}

	@Override
	public int selectYetTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectYetTotalRecord", searchVo);
	}

	@Override
	public List<ComInfoVO> selectAllPassedCompany(SearchVO searchVo2) {
		return sqlSession.selectList(namespace+"selectAllPassedCompany", searchVo2);
	}

	@Override
	public int selectPassedTotalRecord(SearchVO searchVo2) {
		return sqlSession.selectOne(namespace+"selectPassedTotalRecord", searchVo2);
	}
	
}
