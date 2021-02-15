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
		if($('#notice_dept1').val()==""){
			alert('분류1을 선택하세요');
			$('#notice_dept1').focus();
			event.preventDefault();	
		}else if($('#notice_dept2').val()==""){
			alert('분류2를 선택하세요');
			$('#notice_dept2').focus();
			event.preventDefault();
		}else if($('#notice_title').val().length < 1){
			alert('제목을 입력하세요');
			$('#notice_title').focus();
			event.preventDefault();
		}else if($('#notice_content').val().length < 1){
			content();
			event.preventDefault();
		}
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
});

function getDept1(param){
	var $target = $("select[name='notice_dept2']");
	
	if($('#notice_dept1').val()!=""){ //분류1을 선택하지 않을 경우에만 실행하도록
		//selectbox
		$.ajax({
			url : "<c:url value='/admin/noticeService/selectByDept1.do'/>",
			type : "POST",
			data : {notice_dept1 : param},
			dataType : "json",
			success: function(res){
				if(res.length > 0){
					//alert(res);
					$(res).each(function(i){
						$target.append("<option value="+res[i].NOTICE_DEPT2+">"+res[i].NOTICE_DEPT2_INFO+"</option>");
					});
				}
			},
			error:function(xhr, status, error){
				alert("오류로 인해 요청하신 작업을 처리할 수 없습니다. : "+error);
			}
		});
	}
}
</script>

<div>
<h1>이용안내 등록</h1>
	<form name="frmWrite" action="<c:url value='/admin/noticeService/notice_write.do'/>" method="post">
		<div class="frmDiv">
			<select class="select" id="notice_dept1" name="notice_dept1" onchange="getDept1(this.value)">
				<option value="">분류1</option>				
				<option value="1">개인회원</option>				
				<option value="2">기업회원</option>				
				<option value="3">위니드 소식</option>				
				<option value="4">이용약관</option>				
				<option value="5">개인정보처리방침</option>				
			</select>
			<select class="select" id="notice_dept2" name="notice_dept2">
				<option value="">분류2</option>
			</select>
			<input type="text" name="notice_title" id="notice_title">
		</div>
		<div class="frmDiv">
			<textarea rows="5" cols="60" name="notice_content" id="notice_content"></textarea>
			<script type="text/javascript">
				CKEDITOR.replace("notice_content", {
					height : 400
				});
			</script>
		</div>
		<div>
			<input class="frmBtn" id="submit" type="submit" value="등록">
			<input class="frmBtn" id="button" type="button" value="목록으로"
				onClick="location.href='<c:url value="/admin/noticeService/notice_list.do"/>'">
		</div>
	</form>
</div>

<%@ include file="../../inc/admin_bottom.jsp"%>