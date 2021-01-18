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
 <style>
 
 .em-header-div{
 	background-color: black;
 }
 .navbar {
 	height: 50px;
 	align: center;
 }
 
 .navbar-brand{
 	color: #b5b5b5;
 	font-size: 1em;
 	margin: 0px;
 	float: left;
 }
 
 .navbar-nav{
 	height: inherit;
 }
 
 .nav-link{
 	color: #999999;
 }
 
 </style>
  </head>
<body id="top">
	<header>
		<div class="em-header-div">
			<div class="container">
			<nav class="navbar">
					<a class="navbar-brand" href="#">Wanted for Employer</a>
					<div class="collapse navbar-collapse" id="navbarmain">
						<ul class="navbar-nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="#">지원자</a></li>
							<li class="nav-item"><a class="nav-link" href="#">포지션</a></li>
							<li class="nav-item"><a class="nav-link" href="#">매치업</a></li>
							<li class="nav-item"><a class="nav-link" href="#">기업정보</a></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>
