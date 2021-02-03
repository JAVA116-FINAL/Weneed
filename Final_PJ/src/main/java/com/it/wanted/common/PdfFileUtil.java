package com.it.wanted.common;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

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

}
