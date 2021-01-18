<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%-- 
  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/bootstrap/css/bootstrap.min.css">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/icofont/icofont.min.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/icofont/icomoon.css">
  <!-- Slick Slider  CSS -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/slick-carousel/slick/slick.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/plugins/slick-carousel/slick/slick-theme.css">

  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/style.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/clear.css">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/gaeun.css"> 
  --%>
  
<!-- footer Start -->
<footer class="footer section" style="background-color:#2b2d2e; padding:30px 0 70px;">
	<div class="container">
		<div class="footer-top">
			<div class="footer-top-left">
				<div class="wantedLogo_white">
					<img src="${pageContext.request.contextPath}/resources/images/wantedLogo_white.png" alt="">
				</div>
				<div>
					<div class="wanted-info">
						<span><a href="#">이용약관</a></span>
						<span><a href="#">개인정보 처리방침</a></span>
						<span><a href="#">고객센터</a></span>
					</div>
				</div>
			</div>
			<div class="footer-top-right">
				<img src="${pageContext.request.contextPath}/resources/images/ico_KR.png" alt="">
				<select>
					<option value="KR">한국 (한국어)</option>
					<option value="JP">日本 (日本語)</option>
					<option value="TW">台灣 (繁體中文)</option>
					<option value="WW">Worldwide (English)</option>
					<option value="HK">Hong Kong (English)</option>
					<option value="SG">Singapore (English)</option>
				</select>
				<i class="icon-arrow_bottom_fill"></i>
			</div>
		</div>
		
		<div class="footer-bottom">
			<p>
				(주)원티드랩 (대표이사:이복기) | 서울특별시 송파구 올림픽로 300 | 통신판매번호 : 2016-서울강남-00207
				<br>
				유료직업소개사업등록번호 : (국내) 제2016-3220163-14-5-00001호 | (국외) F1201020170005 | 사업자등록번호 : 299-86-00021
				<br>
				© Wantedlab, Inc.
			</p>
		</div>
	</div>
</footer>

   

    <!-- 
    Essential Scripts
    =====================================-->

    
    <!-- Main jQuery -->
    <script src="<%=request.getContextPath() %>/resources/plugins/jquery/jquery.js"></script>
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

  </body>
  </html>