package com.it.wanted.jikmu.model;

import java.util.List;

public class JikmuListVO {
	/* 자연 */
	private List<JikmuVO> jikmuItems;

	public List<JikmuVO> getJikmuItems() {
		return jikmuItems;
	}

	public void setJikmuItems(List<JikmuVO> jikmuItems) {
		this.jikmuItems = jikmuItems;
	}

	@Override
	public String toString() {
		return "JikmuListVO [jikmuItems=" + jikmuItems + "]";
	}
	

}
