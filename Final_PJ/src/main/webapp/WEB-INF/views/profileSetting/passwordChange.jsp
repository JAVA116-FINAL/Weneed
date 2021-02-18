<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[위니드]비밀번호 재설정</title>
</head>
<!-- bootstrap.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/resources/css/profileSetting.css'/>">

<script type="text/javascript">
	$(function(){
		$('.resetPwdOkBox').css('display','none');
		
		$('.resetPwdOkBtn').click(function(){
			$.ajax({
  				url:"<c:url value='/resetPwdOk.do'/>",
  				type:"POST",
  				data:{
  					'pwd':$("#new-pwd-text-field").val()
  				},
  				success:function(res){
  					var msg ="비밀번호 재설정 성공!";
  	  				alert(msg);
  	  				$('.resetPwdBox').css('display','none');
  	  				$('.resetPwdOkBox').css('display','block');
  				},
  				error:function(xhr, status, error){
  					alert('error! : ' + error);
  				}  				
  			});
		});
		
		
		$('.mainBtn').click(function(){
			$.ajax({
  				url:"<c:url value='/goMain.do'/>",
  				type:"POST",
  				data:"",
  				success:function(res){
  					location.href="<c:url value='/index.do'/>";
  				},
  				error:function(xhr, status, error){
  					alert('error! : ' + error);
  				}  				
  			});
		});
	});
</script>
<body>
	<div class="resetPwdWrapper" style="background:url('<c:url value="/resources/images/pwdChange_back_img.jpg"/>')">
		<div class="resetPwdBox">
			<div class="resetPwdTitle">비밀번호 재설정</div>
			<div class="resetPwdInputWrap">
				<input type="password" id="new-pwd-text-field" name="password" placeholder="새로운 비밀번호를 입력하세요.">
				<input type="password" id="confirm-pwd-text-field" name="confirmPassword" placeholder="비밀번호 재입력">
				<span class="resetPwdError"></span>
				<button type="button" class="resetPwdOkBtn" style="outline:0;">완료</button>
			</div>
		</div>
		<div class="resetPwdOkBox">
			<header>비밀번호 재설정이 완료되었습니다.</header>
			<button type="button" class="mainBtn" style="outline:0;">로그인 페이지로 이동</button>
		</div>
	</div>
</body>
</html>