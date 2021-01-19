<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">
<title>커리어 여정을 행복하게, 원티드</title>
</head>
<body>

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
  
</head>

<body id="top">

<header>
	<div class="header-div">
		<nav class="navbar navbar-expand-lg navigation navbar-border" id="navbar">
			<div class="container container-top">
			 	 <a class="navbar-logo" href="index.html">
				  	<img src="${pageContext.request.contextPath}/resources/images/wantedLogo.png" alt="" class="img-fluid top-logo">
				  </a>
	
			  	<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarmain" aria-controls="navbarmain" aria-expanded="false" aria-label="Toggle navigation">
				<span class="icofont-navigation-menu"></span>
			  	</button>
		  
				<ul class="navbar-nav">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="department.html" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">탐색 </a>
						<ul class="dropdown-menu" aria-labelledby="dropdown02" style="top:100%; border-top:none; line-height:17px;">
							<li><a class="dropdown-item" href="department.html" style="border-bottom:none;">개발<i class="icon-arrow_right" style="float:right; color:#999; font-size:16px;"></i></a></li>
							<li><a class="dropdown-item" href="department-single.html" style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">서버 개발자</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">웹 개발자</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">프론트엔드 개발자</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">자바 개발자</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">안드로이드 개발자</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">iOS 개발자</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">데이터 엔지니어</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px;font-size:13px;border-bottom:none;">파이썬 개발자</a></li>
							<li><a class="dropdown-item" href="department-single.html"style="color:#999;padding:5px 20px 15px 20px;font-size:13px;border-bottom:none;">더보기<i class="icon-arrow_right" style="float:right; color:#999; font-size:16px;"></i></a></li>
						</ul>	
				  	</li>
				  	<li class="nav-item active"><a class="nav-link" href="index.html">커리어 성장</a></li>
				  	<li class="nav-item"><a class="nav-link" href="about.html">직군별 연봉</a></li>
				  	<li class="nav-item"><a class="nav-link" href="service.html">이력서</a></li>
				   	<li class="nav-item"><a class="nav-link" href="contact.html">매치업</a></li>
				   	<li class="nav-item"><a class="nav-link" href="contact.html">프리랜서</a></li>
				</ul>
			  
				<aside class="beforeLoginAside">
					<ul>
						<li><button class="searchBtn" style="outline:none;"><i class="icon-search"></i></button></li>
						<li><button class="signUpButton" data-toggle="modal" data-target=".docs-example-modal-sm" style="outline:none;">회원가입/로그인</button></li>
						<!-- 회원가입/로그인 modal 시작-->
						<div class="modal fade docs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
						  <div class="modal-dialog" style="padding-left:45px; top:8%;">
						    <div class="modal-content" style="width:400px; overflow-y:auto;">
						      <div class="modal-header gaeun-modal-header">
						        <h5 class="modal-title h6 modal-wanted-title" id="mySmallModalLabel"><img src="${pageContext.request.contextPath}/resources/images/wantedLogo.png" alt="" class="img-fluid modalLogin-logo"></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline:none;">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body gaeun-modal-body">
						        <div class="gaeun-modal-body-con1">
						        	<h1>직장인을 위한<br>커리어 플랫폼, 원티드!</h1>
						        	<h2>커리어 성장과 행복을 위한 여정<br>지금 원티드에서 시작하세요.</h2>
						        </div>
						        <div class="gaeun-modal-body-con2">
						        	<div class="gaeun-login-emailBox">
						        		<label for="email" class="ge-labelEmail">이메일</label>
						        		<div class="ge-emailBox">
						        			<input type="email" placeholder="이메일을 입력해주세요." id="email" class="ge-inputEmail" value="">
						        		</div>
						        	</div>
						        	<div class="other-login">
						        		<button class="email-login-btn" style="outline:none;">이메일로 시작하기</button>
						        		<div class="or"></div>
						        		<button class="facebook-login-btn social-login-btn" style="outline:none;"><i class="fab fa-facebook"></i>페이스북으로 시작하기</button>
						        		<button class="apple-login-btn social-login-btn" style="outline:none;">Apple로 시작하기</button>
						        		<button class="google-login-btn social-login-btn" style="outline:none;">Google로 시작하기</button>
						        	</div>
						        	<p class="login-modal-desc">
						        		걱정마세요! 여러분의 지원 활동은 SNS에 노출되지 않습니다.<br>
						        		회원가입 시 <a class="login-modal-anchor" href="#">개인정보 처리방침</a>과
						        		<a class="login-modal-anchor" href="#">이용약관</a>을 확인하였으며, 동의합니다.
						        	</p>
						        </div>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- 회원가입/로그인 modal 끝-->
						<li><a href="#" class="dashboardButton">기업 서비스</a></li>
					</ul>
				</aside>
			</div>
		</nav>
	</div>
</header>