package com.it.wanted.jikmu.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JikmuServiceImpl implements JikmuService{

	@Autowired JikmuDAO jikmuDao;
}
