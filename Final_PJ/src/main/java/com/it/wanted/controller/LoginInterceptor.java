package com.it.wanted.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.it.wanted.cominfo.model.ComInfoVO;
import com.it.wanted.member.model.MemberVO;

@Component
public class LoginInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		String email = (String) request.getSession().getAttribute("email");
		logger.info("Login 인터셉터 email={}", email);
		
		if(email==null || email.isEmpty()) {
			response.setContentType("text/html;charset=utf-8");
			
			PrintWriter out=response.getWriter();
			out.print("<script>");
			out.print("alert('먼저 로그인하세요!');");
			out.print("location.href='"+request.getContextPath()+"/index.do';");
			out.print("</script>");
			
			return false;
		}
		
		return true;
	}

	
}
