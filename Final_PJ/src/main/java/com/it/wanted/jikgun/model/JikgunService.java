package com.it.wanted.jikgun.model;

import java.util.List;

public interface JikgunService {

	List<JikgunVO> selectAllJikgun();
	String selectBasicJikgunCode();

}
