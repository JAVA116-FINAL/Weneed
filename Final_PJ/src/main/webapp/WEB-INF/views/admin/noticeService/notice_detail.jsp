<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/admin_top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/noticeService.css'/>">

<script type="text/javascript">
	var notice_no
	function delete_confirm(notice_no){
		if(confirm("해당 이용안내를 삭제하시겠습니까?")==true){
			location.href="<c:url value='/admin/noticeService/notice_delete.do?notice_no='/>"+notice_no;
		}
	}
</script>

<div id="noticeDiv">
	<h1 class="detailH1">이용안내 상세보기</h1>
		<table class="detailTable">
			<colgroup>
				<col width="15%">
				<col width="35%">
				<col width="15%">
				<col width="35%">
			</colgroup>
			<tbody>
				<tr>
					<th scope="row">안내번호</th>
					<td>No. ${listDetail['notice_no'] }</td>
					<th scope="row">등록일</th>
					<td>${listDetail['notice_regdate'] }</td>
				</tr>
				<tr>
					<th scope="row">분류1</th>
					<td>${listDetail['notice_dept1_info'] }</td>
					<th scope="row">분류2</th>
					<td>${listDetail['notice_dept2_info'] }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="4">${listDetail['notice_title'] }</td>
				</tr>
				<tr>
					<td colspan="4">${listDetail['notice_content'] }</td>
				</tr>
			</tbody>
		</table>
		<div class="btnDiv">
			<input class="frmBtn" id="button" type="button" value="수정"
				onClick="location.href='<c:url value="/admin/noticeService/notice_update.do?notice_no="/>${listDetail['notice_no'] }'">
			<input class="frmBtn" id="button" type="button" value="삭제" onClick="delete_confirm(${listDetail['notice_no'] });">
			<input class="frmBtn" id="button" type="button" value="목록으로" onClick="location.href='<c:url value="/admin/noticeService/notice_list.do"/>'">
		</div>
</div>

<%@ include file="../../inc/admin_bottom.jsp"%>