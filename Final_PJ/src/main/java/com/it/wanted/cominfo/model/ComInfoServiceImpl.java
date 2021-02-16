package com.it.wanted.cominfo.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.wanted.commemlist.model.ComMemListDAO;
import com.it.wanted.commemlist.model.ComMemListVO;
import com.it.wanted.common.SearchVO;

@Service
public class ComInfoServiceImpl implements ComInfoService {
	@Autowired ComInfoDAO comInfoDao;
	@Autowired ComMemListDAO comMemListDao;

	@Override
	public ComInfoVO selectCompany(int comMemNo) {
		return comInfoDao.selectCompany(comMemNo);
	}

	@Override
	public List<IndustryVO> selectIndustryList() {
		return comInfoDao.selectIndustryList();
	}

	@Override
	public List<NationVO> selectNationList() {
		return comInfoDao.selectNationList();
	}

	@Override
	public List<RegionVO> selectRegionList(String nationCode) {
		return comInfoDao.selectRegionList(nationCode);
	}

	@Override
	public List<ComSizeInfoVO> selectComSizeList() {
		return comInfoDao.selectComSizeList();
	}

	@Override
	public int insertComInfo(ComInfoVO comInfoVo) {
		//comCode 처리를 서비스에서 해줍시다..가 아니고 mapper에서 해줘보자
		return comInfoDao.insertComInfo(comInfoVo);
	}

	@Override
	@Transactional
	public List<ComInfoVO> changeStatustoPass(List<String> comCodeArr, List<String> comMemNoArr) {
		List<ComInfoVO> changedComList=new ArrayList<ComInfoVO>();
		
		for(int i=0; i<comCodeArr.size(); i++) {
			//컴코드에 대한 기업정보를 YET->PASSED로 바꿔주고요 
			int cnt=0;
			cnt=comInfoDao.changeStatusYettoPass(comCodeArr.get(i));
			System.out.println("comCodeArr.get(i)="+comCodeArr.get(i));
			//바꾼애 도로 받아서 넣어요 (update문이라 한번에 처리가 안되네..)
			System.out.println("comMemNoArr.get(i)="+comMemNoArr.get(i));
			ComInfoVO comInfoVo=comInfoDao.selectCompany(Integer.parseInt(comMemNoArr.get(i)));
			changedComList.add(comInfoVo);
			
			//컴코드와 comMemNo를 comMemList에 추가도 해줍니다 (얘는 리턴은 안해줌)
			ComMemListVO comMemListVo=new ComMemListVO();
			comMemListVo.setComCode(comCodeArr.get(i));
			comMemListVo.setComMemNo(Integer.parseInt(comMemNoArr.get(i)));
			
			int comMemListCnt=0;
			comMemListCnt=comMemListDao.insertComMemList(comMemListVo);
		}
		
		return changedComList;
	}

	@Override
	public List<ComInfoVO> selectAllCompany(SearchVO searchVo) {
		return comInfoDao.selectAllCompany(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return comInfoDao.selectTotalRecord(searchVo);
	}

	@Override
	public List<ComInfoVO> selectAllYetCompany(SearchVO searchVo) {
		return comInfoDao.selectAllYetCompany(searchVo);
	}

	@Override
	public int selectYetTotalRecord(SearchVO searchVo) {
		return comInfoDao.selectYetTotalRecord(searchVo);
	}

	@Override
	public List<ComInfoVO> selectAllPassedCompany(SearchVO searchVo2) {
		return comInfoDao.selectAllPassedCompany(searchVo2);
	}

	@Override
	public int selectPassedTotalRecord(SearchVO searchVo2) {
		return comInfoDao.selectPassedTotalRecord(searchVo2);
	}
	
	
	
}
