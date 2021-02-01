package com.it.wanted.commemlist.model;

public interface ComMemListService {
	public final static int REGED_COMPANY=1;
	public final static int INFO_NOT_REGED=2;
	public final static int IMG_NOT_REGED=3;
	
	int checkComReged(String comMemId);
	String selectComCode(String comMemId);

}
