package com.it.wanted.common;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;

@Controller
public class FileDownload {

	private static Logger logger=LoggerFactory.getLogger(FileDownload.class);
	
	@RequestMapping("/company/matchupServiceFileDownload.do")
	public void matchupServfileDownload(HttpServletRequest request, HttpServletResponse response) {
		String saveDir= request.getSession().getServletContext().getRealPath("/resources/file");
		String fileName="wanted_employers_guide_ko.pdf";
		
		File file = new File(saveDir+"/"+fileName);
		
		FileInputStream fis=null;
		BufferedInputStream bis=null;
		ServletOutputStream sos=null;
		
		try {
			fis=new FileInputStream(file);
			bis=new BufferedInputStream(fis);
			sos=response.getOutputStream();
			
			String reFileName="";
			//boolean isMSIE=request.getHeader("user-agent").indexOf("MSIE") != -1  
				//			|| request.getHeader("user-agent").indexOf("Trident") != -1;
			
			//if(isMSIE) {
				//reFileName=URLEncoder.encode("wanted_employers_guide_ko.pdf", "utf-8");
				//reFileName=reFileName.replace("\\+", "%20");
			//}else {
				reFileName=new String("wanted_employers_guide_ko.pdf".getBytes("utf-8"), "ISO-8859-1");
			//}
			
			response.setContentType("application/octet-stream;charset=utf-8");
			response.addHeader("Content-Disposition", "attatchment;filename=\""+reFileName+"\"");
			response.setContentLength((int)file.length());
			
			int read=0;
			while ((read = bis.read()) != -1) {
				sos.write(read);
			}
		}catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				sos.close();
				bis.close();
			}catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
}
