package com.it.wanted.position.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.wanted.common.SearchVO;

@Service
public class PositionServiceImpl implements PositionService{
	
	@Autowired PositionDAO positionDao;

	@Transactional
	@Override
	public int insertPosition(PositionVO posVo, List<String> jikmus) {
		int cnt= positionDao.insertPosition(posVo);
		System.out.println("포지션 인서트 결과 cnt="+cnt);
		
		//posVo의 no가 필요한디... 포지션명으로 불러와볼까
		int posNo=positionDao.selectPosNo(posVo);
		System.out.println("포지션 번호 조회 결과 posNo="+posNo);
		System.out.println("직무목록 조회 결과 jikmus.size="+jikmus.size());
		System.out.println("직무목록 조회 결과 jikmus="+jikmus);
		
		//직무 잘라주기 
		List<String> cutJm=new ArrayList<String>();
		for(int i=0; i<jikmus.size(); i++) {
			System.out.println(jikmus.get(i).length());
			String jmjm=jikmus.get(i);
			jmjm=jmjm.substring(23);
			cutJm.add(jmjm);
		}
		int resultCnt=0;
		//선택한 jm들에 대해 하나씩 posNo와 매핑해서 넣어 준다
		for(String cutjm : cutJm) {
			PosJikmuVO vo=new PosJikmuVO();	
			vo.setPosNo(posNo);
			vo.setJikmuCode(cutjm);
			resultCnt+=positionDao.insertPosJikmu(vo);
		}
		return resultCnt;
	}

	@Override
	public List<Map<String, Object>> selectJobsearchList() {
		return positionDao.selectJobsearchList();
	}

	@Override
	public List<PositionVO> selectPositionByComcode(String comCode) {
		return positionDao.selectPositionByComcode(comCode);
	}

	@Override
	public List<Map<String, Object>> selectPositionAllbyAdmin(SearchVO searchVo) {
		return positionDao.selectPositionAllbyAdmin(searchVo);
	}

	@Override
	public int selectTotalRecordbyAdmin(SearchVO searchVo) {
		return positionDao.selectTotalRecordbyAdmin(searchVo);
	}

}
