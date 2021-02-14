<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">
<title>위니드 고객센터</title>

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
	  
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/yujeong.css">
	  
	<!-- notice Stylesheet -->
	<link rel="stylesheet" media="all" href="//static.zdassets.com/hc/assets/application-ee975b5feb03f314da5c0cb5d1476896.css" id="stylesheet">
	<link rel="stylesheet" type="text/css" href="//p25.zdassets.com/hc/theming_assets/9309779/360002516992/style.css?digest=900045233163">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
	<script src="https://kit.fontawesome.com/25b3da3ff3.js"></script>
	
</head>

<body id="top">
<header class="header ">
  <div class="header-inner container clearfix">
    <div class="row">
      <div class="col-md-3 col-sm-4 col-xs-12">
          <div class="logo">
          	<!-- 원티드 메인 로고 -->
             <a href="<c:url value='/index.do'/>">
             <img src="<c:url value='/resources/images/notice/weneed_notice.png'/>" alt="원티드로고" id="heder_logo_image">
            </a>
            <!-- 고객센터 로고 -->
             <a href="<c:url value='/notice/notice.do'/>">
             <img src="//theme.zdassets.com/theme_assets/9309779/e5142629ce02b25eae55476f21e3ad5525958812.png" alt="고객센터로고" id="heder_logo_image">
            </a>
          </div>
      </div>
      <div class="col-md-9 col-sm-8 col-xs-12" id="header-request-btn">
        <nav class="primary-menu menu">
          <div class="container-menu">
            <div class="row">
              <div class="navbar-collapse navbar-mind-collapse main-menu collapse pull-right" style="padding-right: 13px;">
                <ul id="drophover" class="nav navbar-nav primary-menu-list-wrap">
                  <li style="border:1px solid #f5f5f5; border-radius:30px; text-align: center; background-color:#3366FF">
                    <a href="<c:url value='/notice/notice_qna.do'/>" 
                    	style="padding:11px 40px 10px 40px;color: #FFFFFF !important;font-weight: 600;">
						문의하기
                      <img src="//theme.zdassets.com/theme_assets/9309779/e1f05b9e24e2a981e19c74b2536ade47ef1cde7d.png">
                    </a>
                  </li>
                </ul>
              </div>
            </div>  
          </div>          
        </nav>
      </div>
    </div>  
  </div>
</header>