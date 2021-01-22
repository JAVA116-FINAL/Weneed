<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../inc/top.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta namae="viewport" content="width=device-width, initial-scale=1">
  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.ico'/>" />

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/bootstrap/css/bootstrap.min.css'/>">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/icofont/icofont.min.css'/>">
<%--   <!-- Slick Slider  CSS -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
 --%>
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
  
  <!-- 커리어성장 카테고리메뉴 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
    
  <!-- 커리어성장 필터 팝업창 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jiwonPopup.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">
  
     <!-- 
    Essential Scripts
    =====================================-->

    <!-- Main jQuery -->
    <!-- Bootstrap 4.3.2 -->
    <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/popper.js"></script>
    <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/plugins/counterup/jquery.easing.js"></script>
    <!-- Slick Slider -->
    <script src="<%=request.getContextPath() %>/resources/plugins/slick-carousel/slick/slick.min.js"></script>
    <!-- Counterup -->
    <script src="<%=request.getContextPath() %>/resources/plugins/counterup/jquery.waypoints.min.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/plugins/shuffle/shuffle.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/plugins/counterup/jquery.counterup.min.js"></script>
    <!-- Google Map -->
    <script src="<%=request.getContextPath() %>/resources/plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
    
    <script src="<%=request.getContextPath() %>/resources/js/script.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/contact.js"></script>
    
    
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
$( document ).ready( function() {
	  var Offset = $( '.jbMenu' ).offset();
	  $( window ).scroll( function() {
	   if ( $( document ).scrollTop() > Offset.top ) {
	      $( '.jbMenu' ).addClass( 'fixed' );
	    }
	    else {
	      $( '.jbMenu' ).removeClass( 'fixed' );
	    }
	  });
	});
</script>

	
<title>Insert title here</title>
<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>
</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");  //userID에 해당 세션 사용자의 값을 스트링 형식으로 바꿔서 넣어줌으로써 해당 사용자의 접속 유무를 알 수 있음
	}
	%>
	
<!-- 메뉴 부분!!!!! -->
<div class="jbMenu" style="width:100%;">
    	<nav class="navbar navbar-expand-lg navigation" id="navbar" style="background-color:#f8f8fa;">
		<div class="container" >
		 	 <div class="navbar-brand">
				<div class="myNav" style="width:100%;">
			  <ul class="navbar-nav ml-auto">
			  <li class="nav-item active"><a class="nav-link" href="#title">프로그램 등록</a></li>
			   <li class="nav-item"><a class="nav-link" href="#title1">프로그램 조회</a></li>
			    <li class="nav-item"><a class="nav-link" href="#title2">Wanted+ 조회</a></li>
			    <li class="nav-item"><a class="nav-link" href="#title3">Notice</a></li>				
			    <a name="title"></a>   
			  </ul>	
			</div>
			</div>
		</div>
		</nav>
</div>
<!-- 메뉴 탑부분 끝!! -->


<!-- 몸통부분!!! -->
<section class="section blog-wrap">

<div class="subscribeBody">
<div class="img_admin_career2">
	<img alt="등록된 프로그램 조회 페이지로 이동" src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/118121468_1722859387865670_6932201002241137751_o.jpg?_nc_cat=105&ccb=2&_nc_sid=dd9801&_nc_ohc=EkvV99Ynvb0AX9KlL8X&_nc_ht=scontent-ssn1-1.xx&oh=15778fa29a00b4a694b1a9b123fca561&oe=602EFE6A" class="campus-recruit-img"  style="width:100%;">
</div>

<div class="img_admin_career">
	<a href="programWrite.do"><img alt="프로그램 등록" src="<c:url value='/resources/images/career/wantedwanted.png'/>" class="campus-recruit-img" style="width:100%;"></a>
</div>



<div class="img_admin_career">
	<a href="programList.do"><img alt="등록된 프로그램 조회 페이지로 이동" src="<c:url value='/resources/images/career/programList.JPG'/>" class="campus-recruit-img" style="width:100%;"></a>
</div>

<!-- 프로그램 등록 페이지로 이동 -->
<a name="title1"></a>
<div class="img_admin_career">
	<a href="programWrite.do"><img alt="프로그램 등록" src="<c:url value='/resources/images/career/keyboard-backlight-keys-mechanical-wallpaper-preview.jpg'/>" class="campus-recruit-img" style="width:100%;"></a>
</div>

<!-- 원티드플러스 구독자 조회 페이지로 이동 -->
<a name="title2"></a>
<div class="img_admin_career">
	<a href="wantedPlusSelect.do"><img alt="Wanted+ 회원" src="<c:url value='/resources/images/career/wantedPlus.JPG'/>" class="campus-recruit-img" style="width:100%;"></a>
</div>

<!-- 채팅 섹션 -->
<a name="title3"></a>
<div class="img_admin_career">
	<a href="wantedChat.do"><img alt="" src="<c:url value='/resources/images/career/wantedbal.JPG'/>" class="campus-recruit-img" style="width:100%; margin-top:-40px;"></a>
</div>


</div> <!-- subscribeBody 디브끝 -->
</section>

<!-- 푸터부분!!!!! -->
	<%@ include file="../../inc/bottom.jsp" %>

	</body>
	</html>