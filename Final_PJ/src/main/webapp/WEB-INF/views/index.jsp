<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp" %>

<!-- 로그인 전 메인 -->
<c:if test="${empty sessionScope.email }">
<%@ include file="main/beforeLoginMain.jsp" %>
</c:if>

<!-- 로그인 후 메인 -->
<c:if test="${!empty sessionScope.email }">
<%@ include file="main/afterLoginMain.jsp" %>
</c:if>

<%@ include file="inc/bottom.jsp" %>