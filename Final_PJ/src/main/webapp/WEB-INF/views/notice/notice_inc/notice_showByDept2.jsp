<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="notice_dept1" value="0"/>
<c:set var="notice_dept2" value="0"/>

<c:forEach var="map" items="${listByDept2 }">
	<c:set var="notice_dept1" value="${map['NOTICE_DEPT1'] }"/>
	<c:set var="notice_dept2" value="${map['NOTICE_DEPT2'] }"/>
<ul class="article-list">
	<li class="article">
		<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
			${map['NOTICE_TITLE'] }
		</a>
	</li>
</ul>
</c:forEach>
<c:if test="${6 eq listByDept2Count }">
	<a href="<c:url value='/notice/notice_dept2.do?notice_dept1=${notice_dept1}&notice_dept2=${notice_dept2}'/>" 
		class="see-all-articles btn" style="font-size: 1.1em;">
		+ 모두 보기 
	</a>
</c:if>