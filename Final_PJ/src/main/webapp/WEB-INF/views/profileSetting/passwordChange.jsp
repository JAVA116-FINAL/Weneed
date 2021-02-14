<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/profileSetting.css'/>">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/clear.css">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('.pwdChangeBox').css('display','block');
		$('.afterPwdChangeBox').css('display','none');
		$('#pwdChangeOkBtn').click(function(){
			$('.pwdChangeBox').css('display','none');
			$('.afterPwdChangeBox').css('display','block');
		});
	});
</script>

<title>Insert title here</title>
</head>
<body>
<div class="back" style="background:url('${pageContext.request.contextPath}/resources/images/mypage/pwdChange_back_img.jpg') center/cover no-repeat;">
	<div class="pwdChangeBox">
		<div class="pwdChangeTitle">비밀번호 재설정</div>
		<div class="pwdChangeCon">
			<input type="password" id="new-pwd-text-field" class="pwdInput" value="" placeholder="새로운 비밀번호 입력">
			<input type="password" id="confirm-pwd-text-field" class="pwdInput" value="" placeholder="비밀번호 재입력">
			<span class="pwdOkError"></span>
			<button type="button" class="pwdChangeOkBtn" id="pwdChangeOkBtn">완료</button>
		</div>
	</div>
	<div class="afterPwdChangeBox" >
		<header>비밀번호 변경이 완료되었습니다.</header>
		<button type="button" class="goMain" onclick="location.href='<c:url value='/index.do'/>' ">로그인 페이지로 이동</button>
	</div>
</div>
</body>
</html>