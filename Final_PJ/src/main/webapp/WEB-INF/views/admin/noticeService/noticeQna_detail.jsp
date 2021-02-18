<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 문의내역 리스트 상세보기 -->
<%@ include file="../../inc/admin_top.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/noticeService.css'/>">
<script src="//cdn.ckeditor.com/4.16.0/basic/ckeditor.js"></script>
<script type="text/javascript">
	$(function(){
		$('form[name=frmWrite]').submit(function(){
			if($('#qna_r_title').val().length < 1){
				alert('제목을 입력하세요');
				$('#qna_r_title').focus();
				event.preventDefault();
			}else if($('#qna_r_content').val().length < 1){
				content();
				event.preventDefault();
			}
		});
	});
	
	function content(){
		var ckeditor = CKEDITOR.instances['qna_r_content'];
		if(ckeditor.getData() == ""){
			alert('내용을 입력하세요');
			ckeditor.focus();
			return;
		}else{
			document.in_form.submit();
		}
	}
	
	var qnq_no
	function mute_confirm(qna_no){
		if(confirm("악성 문의 또는 위니드와 관계없는 문의일 경우 무시할 수 있습니다. 무시하시겠습니까?")==true){
			location.href="<c:url value='/admin/noticeService/noticeQna_mute.do?qna_no='/>"+qna_no;
		}
	}
</script>

<div id="noticeDiv">
	<div class="userDiv">
	<h1 class="detailH1">1:1문의 상세보기</h1>
		<c:forEach var="map" items="${userDetail }">
		
			<c:set var="qna_no" value="${map['QNA_NO'] }"/>
			<c:set var="qna_reply" value="${map['QNA_REPLY'] }"/>
			<c:set var="qna_email" value="${map['QNA_EMAIL'] }"/>
			<c:set var="qna_content" value="${map['QNA_CONTENT'] }"/>
			
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
						<c:if test="${map['QNA_REPLY'] == 'M'}">
							<td>무시</td>
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
	<c:if test="${qna_reply != 'M' }">
		<c:if test="${!empty adminDetail }">
		<h1 class="detailH1">1:1문의 답변</h1>
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
			<div style="margin-top: 30px;">
				<input class="frmBtn" id="button" type="button" value="목록으로" onClick="location.href='<c:url value="/admin/noticeService/noticeQna_list.do"/>'">
			</div>
		</c:if>
		<c:if test="${empty adminDetail }">
		<h1 class="detailH1">1:1문의 등록</h1>
			<form name="frmWrite" action="<c:url value='/admin/noticeService/noticeQna_write.do'/>" method="post">
				<div class="frmDiv">
					<input type="text" name="qna_r_title" id="qna_r_title" placeholder="제목을 입력하세요">
					
					<input type="hidden" name="qna_no" id="qna_no" value="${qna_no }">
					<input type="hidden" name="qna_email" id="qna_email" value="${qna_email }">
					<input type="hidden" name="qna_content" id="qna_content" value="${qna_content }">
				</div>
				<div class="frmDiv">
					<textarea rows="5" cols="60" name="qna_r_content" id="qna_r_content"></textarea>
					<script type="text/javascript">
						CKEDITOR.replace("qna_r_content", {height : 400});
					</script>  
				</div>
				<div>
					<input class="frmBtn" id="submit" type="submit" value="등록">
					<input class="frmBtn" id="button" type="button" value="무시" onClick="mute_confirm(${qna_no });">
					<input class="frmBtn" id="button" type="button" value="목록으로" onClick="location.href='<c:url value="/admin/noticeService/noticeQna_list.do"/>'">
				</div>
			</form>
		</c:if>
	</c:if>
	<c:if test="${qna_reply == 'M' }">
		<div>
			<input class="frmBtn" id="button" type="button" value="목록으로" onClick="location.href='<c:url value="/admin/noticeService/noticeQna_list.do"/>'">
		</div>
	</c:if>
	</div>
</div>

<%@ include file="../../inc/admin_bottom.jsp"%>