<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>
<!-- qna등록 성공시 출력될 view -->
<style>
.content{
	text-align: center;
    padding-top: 200px;
    padding-bottom: 200px;
}

h1{
	margin-bottom: 30px;
    font-size: 40px;
    font-weight: 600;
    line-height: 1.2;
}

h4{
	margin-bottom: 30px;
}
</style>

<div class="block regist">
	<div class="content">
		<h1>1:1문의가 등록되었습니다.</h1>
		<h4>문의번호: No. ${no }</h4>
		<button class="registerBtn" type="button" onclick="location.href='<c:url value="/notice/notice.do"/>'" style="width: 15%">
			고객센터로 이동
		</button>
	</div>
</div>
<%@ include file="notice_inc/notice_bottom.jsp"%>