<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/admin_top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/noticeService.css'/>">
<script src="<c:url value='/resources/js/ckeditor/ckeditor.js'/>"></script>

<script type="text/javascript">
	$(function(){
		$('form[name=frmWrite]').submit(function(){
			if($('#notice_title').val().length < 1){
				alert('제목을 입력하세요');
				$('#notice_title').focus();
				event.preventDefault();
			}else if($('#notice_content').val().length < 1){
				content();
				event.preventDefault();
			}
		});
	});
	
	function content(){
		var ckeditor = CKEDITOR.instances['notice_content'];
		if(ckeditor.getData() == ""){
			alert('내용을 입력하세요');
			ckeditor.focus();
			return;
		}else{
			document.in_form.submit();
		}
	}
</script>

<div>
<h1>이용안내 수정</h1>
	<form name="frmWrite" action="<c:url value='/admin/noticeService/notice_update.do'/>" method="post">
		<div class="frmDiv">
			<input type="text" name="notice_title" id="notice_title" value="${listDetail['notice_title'] }">
			<input type="hidden" name="notice_no" id="notice_no" value="${listDetail['notice_no'] }">
		</div>
		<div class="frmDiv">
			<textarea rows="5" cols="60" name="notice_content" id="notice_content">${listDetail['notice_content'] }</textarea>
			<script type="text/javascript">
				CKEDITOR.replace("notice_content", {
					height : 400
				});
			</script>
		</div>
		<div class="frmDiv">
			<input class="frmBtn" id="submit" type="submit" value="수정">
			<input class="frmBtn" id="button" type="button" value="목록으로"
				onClick="location.href='<c:url value="/admin/noticeService/notice_list.do"/>'">
		</div>
	</form>
</div>

<%@ include file="../../inc/admin_bottom.jsp"%>