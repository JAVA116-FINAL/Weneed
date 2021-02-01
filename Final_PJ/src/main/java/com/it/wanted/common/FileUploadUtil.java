package com.it.wanted.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadUtil {
	//자료실에서 사용하는지, 상품 등록에서 사용하는지 구분하는 상수
	public static final int PDS_TYPE=1;  //자료실에서 사용
	public static final int IMAGE_TYPE=2; //상품등록에서 사용
	public static final int RESUME_UP_TYPE=3; //이력서등록에서 사용
	
	@Resource(name="fileUploadProperties")
	private Properties fileUploadProps;
	
	private static final Logger logger
		=LoggerFactory.getLogger(FileUploadUtil.class);
	
	public List<Map<String, Object>> fileUplaod(HttpServletRequest request, 
			int type) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multiRequest 
			= (MultipartHttpServletRequest) request;
		
		//결과를 저장할 리스트
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map<String, MultipartFile> filesMap=multiRequest.getFileMap();
		
		Iterator<String> keyIter=filesMap.keySet().iterator();
		while(keyIter.hasNext()) {
			String key=keyIter.next();
			MultipartFile tempFile =filesMap.get(key);
			//=> 업로드된 파일을 임시파일 형태로 제공
			
			if(!tempFile.isEmpty()) { //업로드된 경우
				//파일 크기
				long fileSize = tempFile.getSize();
				String originName = tempFile.getOriginalFilename();
				
				//변경된 파일 이름 구하기
				String fileName = getUniqueFileName(originName); 
						
				//파일 전송-업로드 처리
				String upPath = getUploadPath(type, request);				
				File file = new File(upPath, fileName);
				tempFile.transferTo(file);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("originalFileName", originName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
			}
		}//while
		
		return list;
	}

	private String getUniqueFileName(String originName) {
		//파일명이 중복될 경우 파일명 변경하기
		//파일명에 현재시간을 붙여서 변경된 파일명 구한다
		//abc.txt => abc_20201230123456789.txt
		int idx=originName.lastIndexOf(".");
		String fName = originName.substring(0,idx);  //abc
		String ext = originName.substring(idx); //.txt
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String today =sdf.format(d);
		
		String result = fName+"_"+today+ext;
		logger.info("변경된 파일명 : {}", result);
		
		return result;
	}
	
	public String getUploadPath(int type, HttpServletRequest request) {
		String testGb=fileUploadProps.getProperty("file.upload.type");
		
		String upPath="";
		if(type==PDS_TYPE) { //자료실일 때
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("file.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("file.upload.path");
				// => pds_upload
			}
		}else if(type==IMAGE_TYPE) { //이미지일 때
			if(testGb.equals("test")) { 
				upPath=fileUploadProps.getProperty("imageFile.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("imageFile.upload.path");
			}
		}else if(type==RESUME_UP_TYPE) {//이력서 등록일 때 
			if(testGb.equals("test")) {
				upPath=fileUploadProps.getProperty("resumeFile.upload.path.test");
			}else {
				upPath=fileUploadProps.getProperty("resumeFile.upload.path");
			}
			
		}
		
		if(!testGb.equals("test")) {
			upPath=request.getSession().getServletContext().getRealPath(upPath);
		} //테스트가 아닐때는 물리적 경로를 구해야 한다. 배포시에도? 
		
		logger.info("파일 업로드 경로: {}", upPath);
		return upPath;
	}
	
	public List<Map<String, Object>> fileUplaod_comImg(HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
		
		//결과를 저장할 리스트
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		
		Map<String, MultipartFile> filesMap=multiRequest.getFileMap();
		
		Iterator<String> keyIter=filesMap.keySet().iterator();
		while(keyIter.hasNext()) {
			String key=keyIter.next();
			MultipartFile tempFile =filesMap.get(key);
			//=> 업로드된 파일을 임시파일 형태로 제공
			
			if(!tempFile.isEmpty()) { //업로드된 경우
				//파일 크기
				long fileSize = tempFile.getSize();
				String originName = tempFile.getOriginalFilename();
				
				//변경된 파일 이름 구하기
				String fileName = getUniqueFileName(originName); 
						
				//파일 전송-업로드 처리
				String upPath = getUploadPath_comImg(multiRequest);				
				File file = new File(upPath, fileName);
				tempFile.transferTo(file);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("originalFileName", originName);
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				list.add(map);
			}
		}//while
		
		return list;
	}
	
	public String getUploadPath_comImg(HttpServletRequest request) {
		String testGb=fileUploadProps.getProperty("file.upload.type");
		
		String upPath="";
		if(testGb.equals("test")) {
			upPath=fileUploadProps.getProperty("comImgFile.upload.path.test");
		}else {
			upPath=fileUploadProps.getProperty("comImgFile.upload.path");
			//회사이미지 업로드
		}
		
		if(!testGb.equals("test")) {
			upPath=request.getSession().getServletContext().getRealPath(upPath);
		} //테스트가 아닐때는 물리적 경로를 구해야 한다. 배포시에도? 
		
		logger.info("파일 업로드 경로: {}", upPath);
		
		return upPath;
	}
	
}
