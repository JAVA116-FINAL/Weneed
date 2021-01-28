package com.it.wanted.jikgun.model;

import java.util.List;

public interface JikgunDAO {

	List<JikgunVO> selectAllJikgun();

	String selectBasicJikgunCode();

}
