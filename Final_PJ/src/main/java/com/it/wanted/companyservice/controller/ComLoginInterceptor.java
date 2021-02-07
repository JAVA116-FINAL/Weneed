package com.it.wanted.companyservice.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

@Component
public class ComLoginInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger=LoggerFactory.getLogger(ComLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session=request.getSession();
		String comMemId = (String) session.getAttribute("comMemId");
		logger.info("Company Login 인터셉터 comMemId={}", comMemId);
		
		if(comMemId==null) {
			response.setContentType("text/html;charset=utf-8");
			
			PrintWriter out=response.getWriter();
			out.print("<script>");
			out.print("alert('로그인하세요');");
			out.print("location.href='"+request.getContextPath()+"/company/welcome.do';");
			out.print("</script>");
			
			return false;
		}
		
		return true;
	}

	
}
