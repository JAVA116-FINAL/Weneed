<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 문의내역 리스트 상세보기 -->
<%@ include file="../../inc/admin_top.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/noticeService.css'/>">
<div>
	<div class="userDiv">
	<h1>1:1문의 상세보기</h1>
		<c:forEach var="map" items="${userDetail }">
			<!-- 등록된 문의 출력 -->
			<table class="detailTable">
				<colgroup>
					<col width="15%">
					<col width="35%">
					<col width="15%">
					<col width="35%">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row">문의번호</th>
						<td>No. ${map['QNA_NO'] }</td>
						<th scope="row">답변여부</th>
						<c:if test="${map['QNA_REPLY'] == 'Y'}">
							<td style="color: #0000bb">답변완료</td>
						</c:if>
						<c:if test="${map['QNA_REPLY'] == 'N'}">
							<td style="color: #ff3a3a">미답변</td>
						</c:if>
					</tr>
					<tr>
						<th scope="row">이메일</th>
						<td>${map['QNA_EMAIL'] }</td>
						<th scope="row">연락처</th>
						<td>${map['QNA_PHONE'] }</td>
					</tr>
						<tr>
							<th scope="row">작성일</th>
							<td colspan="4">
								<fmt:formatDate value="${map['QNA_REGDATE'] }" pattern="yyyy/MM/dd HH:ss"/>
							</td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="4">
								${map['QNA_TITLE'] }
							</td>
						</tr>
					<tr>
						<td colspan="4" class="lastTd">
							${map['QNA_CONTENT'] }
						</td>
					</tr>
				</tbody>
			</table>
		</c:forEach>
	</div>

	<div class="adminDiv">
		<c:if test="${!empty adminDetail }">
		<h1>1:1문의 답변</h1>
			<c:forEach var="map" items="${adminDetail }">
				<!-- 등록된 답변 출력 -->
				<table class="detailTable">
					<colgroup>
						<col width="15%">
						<col width="35%">
						<col width="15%">
						<col width="35%">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">관리자</th>
							<td>${map['ADMIN_NO'] }</td>
							<th scope="row">작성일</th>
							<td><fmt:formatDate value="${map['QNA_R_REGDATE'] }" pattern="yyyy/MM/dd HH:ss"/></td>
						</tr>
						<tr>
							<th scope="row">제목</th>
							<td colspan="4">
								${map['QNA_R_TITLE'] }
							</td>
						</tr>
						<tr>
							<td colspan="4" class="lastTd">
								${map['QNA_R_CONTENT'] }
							</td>
						</tr>
					</tbody>
				</table>
			</c:forEach>
		</c:if>
		<c:if test="${empty adminDetail }">
			<!-- 입력 폼 추가 -->
			<form name="frmWrite" action="<c:url value='/admin/noticeService/noticeQna_write.do'/>" method="post">
				<div>
					<input type="text" name="qna_r_title" id="qna_r_title" placeholder="제목을 입력하세요">
				</div>
				<div>
					<input type="submit" value="등록">
				</div>
			</form>
		</c:if>
	</div>
</div>

<%@ include file="../../inc/admin_bottom.jsp"%>