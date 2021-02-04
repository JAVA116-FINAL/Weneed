package com.it.wanted.common;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.it.wanted.achievement.model.AchievementVO;
import com.it.wanted.addinformatiod.model.AddinformatiodVO;
import com.it.wanted.career.model.CareerVO;
import com.it.wanted.education.model.EducationVO;
import com.it.wanted.languages.model.LanguagesVO;
import com.it.wanted.languagestest.model.LanguagestestVO;
import com.it.wanted.link.model.LinkVO;
import com.it.wanted.resume.model.ResumeAllVO;
import com.it.wanted.resume.model.ResumeService;
import com.it.wanted.resume.model.ResumeVO;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;

@Component
public class PdfFileUtil {

	@Autowired
	private ResumeService resumeService;

	public void createPdf(ResumeVO rVo) throws DocumentException, IOException {
		//파일 사이즈 여백설정
		Document document = new Document(PageSize.A4,50,50,50,50);
		
		PdfWriter writer= PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\user\\Downloads\\"+rVo.getResumeTitle()+".pdf"));
		writer.setInitialLeading(12.5f);
		document.open();
		
		BaseFont baseFont=BaseFont.createFont("C:\\Windows\\Fonts\\malgun.TTF",BaseFont.IDENTITY_H,BaseFont.EMBEDDED);
		Font font= new Font(baseFont,12);
		
		Chunk chunc = new Chunk(rVo.getResumeName(),new Font(baseFont,20));//타이틀객체생성
		Paragraph ph= new Paragraph(chunc);
		ph.setAlignment(Element.ALIGN_LEFT);
		document.add(ph); //문단 생성 후 타이틀 가운데 정렬
		document.add(chunc.NEWLINE);
		
		document.add(new Paragraph("Email: "+rVo.getResumeEmail(),font));
		document.add(new Paragraph("Contact: "+rVo.getResumeHp(),font));
		document.add(new Paragraph(rVo.getResumeIntroduce(),font));
		
		document.close();
		
	}
	

	public void createPdf(ResumeAllVO rAllVo) throws DocumentException, IOException {
		
		//rAllVo에서 모든것을 꺼낸다.
		ResumeVO rVo = rAllVo.getResumeVo();
		List<CareerVO> crrList = rAllVo.getCrrList();
		List<AchievementVO> achList = rAllVo.getAchList();
		List<EducationVO> eduList = rAllVo.getEduList();
		List<AddinformatiodVO> addList = rAllVo.getAddList();
		List<LanguagesVO> langList = rAllVo.getLangList();
		List<LanguagestestVO> testList = rAllVo.getTestList();
		List<LinkVO> linkList = rAllVo.getLinkList();
		
		//파일 사이즈 여백설정
		Document document = new Document(PageSize.A4,50,50,50,50);
		
		//파일저장경로에서 파일이 있는 겨우 이름 변경하기!!
		PdfWriter writer= PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\user\\Downloads\\"+rVo.getResumeTitle()+".pdf"));
		writer.setInitialLeading(12.5f);
		document.open();
		
		BaseFont baseFont=BaseFont.createFont("C:\\Windows\\Fonts\\malgun.TTF",BaseFont.IDENTITY_H,BaseFont.EMBEDDED);
		Font font= new Font(baseFont,12);
		
		Chunk chunc = new Chunk(rVo.getResumeName(),new Font(baseFont,20));//타이틀객체생성
		Paragraph ph= new Paragraph(chunc);
		ph.setAlignment(Element.ALIGN_LEFT);
		document.add(ph); //문단 생성 후 타이틀 가운데 정렬
		document.add(chunc.NEWLINE);
		
		document.add(new Paragraph("Email: "+rVo.getResumeEmail(),font));
		document.add(new Paragraph("Contact: "+rVo.getResumeHp(),font));
		document.add(new Paragraph(rVo.getResumeIntroduce(),font));
		
		//줄긋고싶어 hr검정
		//경력
		document.add(chunc.NEWLINE);
		Chunk chuncCrr = new Chunk("경력",new Font(baseFont,15));//타이틀객체생성
		Paragraph phCrr= new Paragraph(chuncCrr);
		phCrr.setAlignment(Element.ALIGN_LEFT);
		document.add(phCrr);
 
		if(crrList!=null || !crrList.isEmpty()) {
			for (int i=0;i<crrList.size();i++) {
				CareerVO crrVo = crrList.get(i);
				
				String cName=crrVo.getCareerName();
				String cDep=crrVo.getCareerDep();
				String sYear= crrVo.getStartYear();
				String sMonth=crrVo.getStartMonth();
				String eYear=crrVo.getEndYear();
				String eMonth=crrVo.getEndMonth();
				
				document.add(new Paragraph("\n"+cName,font));
				document.add(new Paragraph(cDep,new Font(baseFont,11)));
				//document.add(new Paragraph(crrVo.getCurEmployed()));//N으로 나옴
				//document.add(new Paragraph("· "+sYear+"."+sMonth+"-"+eYear+"."+eMonth, new Font(baseFont,8)));
				//document.add(chuncCrr.NEWLINE);
		  //줄긋고싶어 hr검정	
				if(achList!=null && !achList.isEmpty()) {
					for(int j=0; j<achList.size();j++) {
						AchievementVO achVo = achList.get(j);
						if(achVo.getCareerNo()==crrVo.getCareerNo()) {
			//들여쓰기.. 회색 hr
							document.add(new Paragraph("\t\t·주요성과: "+achVo.getAchName()+"\t"+achVo.getStartYear()+"."+achVo.getStartMonth()+"-"+achVo.getEndYear()+"."+achVo.getEndMonth(),new Font(baseFont,10)));
							document.add(new Paragraph("\t\t"+achVo.getAchDetails(),new Font(baseFont,10)));
							//document.add(chunc.NEWLINE);
						}//if
					}//for
				}//if
				
			}//바깥for career
		}//if 바깥 if career
		
		//학력
		document.add(chuncCrr.NEWLINE);
		Chunk chuncEdu = new Chunk("학력",new Font(baseFont,15));//타이틀객체생성
		Paragraph phEdu= new Paragraph(chuncEdu);
		phCrr.setAlignment(Element.ALIGN_LEFT);
		document.add(phEdu);
		if(eduList!=null&& !eduList.isEmpty()) {
			for (int i = 0; i < eduList.size(); i++) {
				EducationVO eduVo = eduList.get(i);
				document.add(new Paragraph(eduVo.getStartYear()+"."+eduVo.getStartMonth()+"-"+eduVo.getEndYear()+"."+eduVo.getEndMonth(),new Font(baseFont,10)));
				document.add(new Paragraph(eduVo.getEduName(),font));
				document.add(new Paragraph(eduVo.getEduMajor(),new Font(baseFont,10)));
				
			}//for
		}//if
		
		//기타활동사항
		document.add(chuncEdu.NEWLINE);
		Chunk chuncAdd = new Chunk("수상 및 기타",new Font(baseFont,15));//타이틀객체생성
		Paragraph phAdd= new Paragraph(chuncAdd);
		phAdd.setAlignment(Element.ALIGN_LEFT);
		document.add(phAdd);
		if(addList!=null&& !addList.isEmpty()) {
			for (int i = 0; i < addList.size(); i++) {
				 AddinformatiodVO addVo = addList.get(i);
				document.add(new Paragraph(addVo.getGetYear()+"."+addVo.getGetMonth(),new Font(baseFont,10)));
				document.add(new Paragraph(addVo.getAddName(),font));
				document.add(new Paragraph(addVo.getAddDetails(),new Font(baseFont,10)));
				
			}//for
		}//if
		
		//외국어
		document.add(chuncAdd.NEWLINE);
		Chunk chuncLang = new Chunk("기타활동사항",new Font(baseFont,15));//타이틀객체생성
		Paragraph phLang= new Paragraph(chuncLang);
		phLang.setAlignment(Element.ALIGN_LEFT);
		document.add(phLang);
		if(addList!=null&& !langList.isEmpty()) {
			for (int i = 0; i < langList.size(); i++) {
				  LanguagesVO langVo = langList.get(i);
				document.add(new Paragraph(langVo.getLangName(),font));
				
				String langLevel=null;
				if(langVo.getLangLevel()==1) {
					langLevel="유창함";
				}else if(langVo.getLangLevel()==2) {
					langLevel="비즈니스 가능";
				}else if(langVo.getLangLevel()==3) {
					langLevel="일상생활 가능";
				}	
						
				document.add(new Paragraph(langLevel,new Font(baseFont,10)));
				
				if(testList!=null&&testList.isEmpty()) {
					for(int j=0; j<testList.size();j++) {
						 LanguagestestVO testVo = testList.get(j);
						if(testVo.getLangNo()==langVo.getLangNo()) {
			//들여쓰기.. 회색 hr
							document.add(new Paragraph("\t\t·"+testVo.getLangtestName()+"\t"+testVo.getGetYear()+"."+testVo.getGetMonth(),new Font(baseFont,10)));
							document.add(new Paragraph("\t\t"+testVo.getLangtestScore(),new Font(baseFont,10)));
							
						}//if
					}//for
					
					
				}
				
				
			}//for
		}//if
		
		//링크
		document.add(chuncLang.NEWLINE);
		Chunk chuncLink = new Chunk("링크",new Font(baseFont,15));//타이틀객체생성
		Paragraph phLink= new Paragraph(chuncLink);
		phLink.setAlignment(Element.ALIGN_LEFT);
		document.add(phLink);
		if(linkList!=null&& !linkList.isEmpty()) {
			for (int i = 0; i < linkList.size(); i++) {
				LinkVO linkVo = linkList.get(i);
				document.add(new Paragraph(linkVo.getLinkUrl(),new Font(baseFont,10)));
				
			}//for
		}//if

		
		
		
		
		
		
		document.close();
		
	}

}
