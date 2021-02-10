<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 문의내역 리스트 상세보기 -->
<%@ include file="../../notice/notice_inc/notice_top.jsp"%><!-- 관리자 페이지 include로 바꾸기 -->
<div class="qnaTable">
	<div class="userDetail">
		<c:forEach var="map" items="${userDetail }">
		dd
		</c:forEach>
	</div>
<hr class="hr1">
	<div class="adminDetail">
		<c:if test="${!empty adminDetail }">
			<c:forEach var="map" items="${adminDetail }">
				<h1>등록된 답변 있음</h1>
			</c:forEach>
		</c:if>
		<c:if test="${empty adminDetail }">
			<h1>등록된 답변 없음</h1> <!-- 입력 폼 추가 -->
		</c:if>
	</div>
</div>

<%@ include file="../../notice/notice_inc/notice_bottom.jsp"%>