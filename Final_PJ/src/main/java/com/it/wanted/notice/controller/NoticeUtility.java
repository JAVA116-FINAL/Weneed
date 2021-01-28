package com.it.wanted.notice.controller;

public class NoticeUtility {
	
	public String splitContent(String notice_content, String notice_keyword) {
			
		//</p>단위로 문자열 자름
		String[] str1=notice_content.split("<br>");
		
		int arrCnt=0;
		for(int i=0;i<str1.length;i++) {
			if(0<(str1[i].indexOf(notice_keyword))) {
				arrCnt=i; //keyword가 존재하는 배열의 인덱스를 출력, 모든 배열에 keyword가 존재하더라도 첫번째 배열만 사용할 것임
				break; //i에 값 들어가면 멈춤 (다른 인덱스가 들어가지 않도록)
			}
		}
				
		//replaceAll에 정규식 적용, h2태그 포함 제거
		notice_content=str1[arrCnt].replaceAll("<(/)?([a-zA-Z0-9]*)(\\\\s[a-zA-Z0-9]*=[^>]*)?(\\\\s)*(/)?>", "");
		
		//insert위한 StringBuilder객체생성
		StringBuilder sb=new StringBuilder(notice_content);
		
		int insertCnt1=notice_content.indexOf(notice_keyword); //em태그 시작할 index
		int insertCnt2=insertCnt1+notice_keyword.length(); //em태그 닫을 index
		
		if(insertCnt1!=-1 && insertCnt2!=-1) {
			sb.insert(insertCnt2, "</i></em>"); //닫는 태그를 먼저 insert해야 index에 영향이 없음
			sb.insert(insertCnt1, "<em><i>");
			return sb.toString();
		}else {
			return notice_content; //keyword가 제목에만 존재해 인덱스값이 -1일 때는 태그만 제거한 content 리턴(em태그 적용 전)
		}
	}
}
