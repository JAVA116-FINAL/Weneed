package com.it.wanted.jikgun.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.wanted.jikmu.model.JikmuVO;

@Service
public class JikgunServiceImpl implements JikgunService{

	@Autowired JikgunDAO jikgunDao;

	@Override
	public List<JikgunVO> selectAllJikgun() {
		return jikgunDao.selectAllJikgun();
	}

	@Override
	public String selectBasicJikgunCode() {
		return jikgunDao.selectBasicJikgunCode();
	}

	@Override
	public List<JikmuVO> selectJikmuByJikgunCode(String basicCode) {
		return jikgunDao.selectJikmuByJikgunCode(basicCode);
	}
}
