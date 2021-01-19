<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">

<title>WANTED</title>
 <!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />

<!-- bootstrap.min css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/icofont/icofont.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/icofont/icomoon.css">
<!-- Slick Slider  CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/plugins/slick-carousel/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/clear.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gaeun.css">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<!-- font awesome 아이콘 사용을 위한 킷 -->
<script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/welcome.css">
</head>
<body>
	<header>
		<div class="header-wrapper1">
			<div class="container">
				<div class="header-wrapper2">
				<!-- 로그인 전 -->
				
				<!-- 로그인 후 -->
				
					<div class="header-logo">
						<a class="comServNavbar-logo-link" href="#">Wanted for Employer</a>
					</div>
					<nav class="comServNavbar">
						<ul class="comServNavs ml-auto">
							<li class="comServNav-item">
								<a class="comServNav-item-link" href="#">지원자</a></li>
							<li class="comServNav-item">
								<a class="comServNav-item-link" href="#">포지션</a></li>
							<li class="comServNav-item">
								<a class="comServNav-item-link" href="#">매치업</a></li>
							<li class="comServNav-item">
								<a class="comServNav-item-link" href="#">기업정보</a></li>
						</ul>
					</nav>
					<div class="comServHeaderBtns">
						<button class="comServBtn comServLoginBtn">채용담당자 로그인</button>
						<button class="comServBtn comServJoinBtn">관리자 가입</button>
						<button class="comServBtn gotoWantedMain">원티드 홈</button>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>