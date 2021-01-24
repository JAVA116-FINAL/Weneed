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
<title>원티드 긱스</title>
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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jumi.css">
  
  <script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
  <!-- font awesome 아이콘 사용을 위한 킷 https://fontawesome.com/ -->
  <script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>
</head>

<body id="top">

<header>
   <div class="header-div" >
      <nav class="navbar navbar-expand-lg navigation navbar-border" id="navbar">
         <div class="container container-top" style="margin-bottom: 10px">
              <a class="navbar-logo" href="${pageContext.request.contextPath}/freelancer/freelancerMain.do">
                 <img src="${pageContext.request.contextPath}/resources/images/freelancer/wantedgigsLogo.png" 
                       alt="" class="img-fluid top-logo" style="margin-top: 10px">
              </a>
   
            <aside class="beforeLoginAside">
               <ul>
                  <li><a href="#">
                        <button class="grayButton">전문가 등록</button>
                     </a>
                  </li>
                  <li><a href="${pageContext.request.contextPath}/freelancer/projectRegister/projectRegister1.do">
                        <button class="blueButton">프로젝트 등록</button>
                     </a>
                  </li>
                  <li><button class="grayButton">회원가입/로그인</button></li>
               </ul>
            </aside>
         </div>
      </nav>
   </div>
</header>