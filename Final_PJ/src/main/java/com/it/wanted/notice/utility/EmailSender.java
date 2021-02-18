package com.it.wanted.notice.utility;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;

@Component
public class EmailSender {
	@Autowired private JavaMailSender mailSender;
	
	public void sendEmail(String subject, String content, String receiver, 
			String sender) throws MessagingException {
		MimeMessage mimeMsg=mailSender.createMimeMessage();
		
	      mimeMsg.setSubject(subject);
	      //이메일 내용에 태그 적용
	      mimeMsg.setText(content, "utf-8", "html");
	      mimeMsg.setRecipient(RecipientType.TO, new InternetAddress(receiver));
	      mimeMsg.setFrom(new InternetAddress(sender));
	      
	      mailSender.send(mimeMsg);
	}
}
