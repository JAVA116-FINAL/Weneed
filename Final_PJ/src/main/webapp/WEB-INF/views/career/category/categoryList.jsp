<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


	      <c:forEach var="ccgVo" items="${ccgList }"> 
			<label class="btn ">
	        	<input type="radio" name="shuffle-filter" value="${ccgVo.proCateName }" style="width:0px;"/>${ccgVo.proCateName }
	        </label>	
	        <h1>카테고리후</h1>      
	      </c:forEach>