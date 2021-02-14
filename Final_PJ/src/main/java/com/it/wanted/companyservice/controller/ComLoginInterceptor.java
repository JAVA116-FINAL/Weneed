package com.it.wanted.companyservice.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.it.wanted.cominfo.model.ComInfoVO;

@Component
public class ComLoginInterceptor extends HandlerInterceptorAdapter{

	private final Logger logger=LoggerFactory.getLogger(ComLoginInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session=request.getSession();
		String comMemId = (String) session.getAttribute("comMemId");
		ComInfoVO comInfoVo = (ComInfoVO) session.getAttribute("comInfoVo");
		logger.info("Company Login 인터셉터 comMemId={}, comInfoVo={}", comMemId, comInfoVo);
		
		if(comMemId==null || comInfoVo==null) {
			response.setContentType("text/html;charset=utf-8");
			
			session.removeAttribute("comMemId");
			session.removeAttribute("comInfoVo");
			PrintWriter out=response.getWriter();
			out.print("<script>");
			out.print("location.href='"+request.getContextPath()+"/company/welcome.do';");
			out.print("</script>");
			
			return false;
		}
		
		return true;
	}

	
}
