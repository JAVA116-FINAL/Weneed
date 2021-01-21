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
  <!-- font awesome 아이콘 사용을 위한 킷 https://fontawesome.com/ -->
  <script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>
</head>
<body id="onboardingBody">
	<div class="ob-wrapper">
		<div class="ob-content">
			<div class="ob-con-logo"><img src="${pageContext.request.contextPath}/resources/images/wantedLogo.png"></div>
			<div class="ob-con-box">
				<div class="ob-con-box-top">
					<p>인사담당자에게 제안받고 싶다면,<br>아래 정보를 추가해주세요!</p>
				</div>
				<!-- 학교 -->
				<div class="ob-matching-wrapper" style="padding-bottom:15px;">
					<label for="ob-category_id" class="ob-matching-label">학교</label>
					<div class="ob-matching-selectBox-wrapper">
						<div class="ob-matching-selectBox">
							<input type="text" placeholder="검색해주세요." class="ob-category-id-select"><i class="icon-search" style="display:inline-block; margin-top:15px;"></i>
						</div>
					</div>
				</div>
				<!-- 직장 -->
				<div class="ob-matching-wrapper" style="padding-bottom:15px;">
					<label for="ob-category_id" class="ob-matching-label">직장</label>
					<div class="ob-matching-selectBox-wrapper">
						<div class="ob-matching-selectBox">
							<input type="text" placeholder="검색해주세요." class="ob-category-id-select"><i class="icon-search" style="display:inline-block; margin-top:15px;"></i>
						</div>
					</div>
				</div>
				<!-- 원티드 시작하기 버튼 -->
				<div class="ob-button-wrapper">
					<button type="button" class="ob-next-btn" style="outline:none;">원티드 시작하기</button>
				</div>
			</div>
			<div class="ob-after-input-wrapper">
				<button type="button" class="ob-after-input-btn">나중에 입력할게요<i class="icon-arrow_right" style="float:right; color:#767676; font-size:20px;"></i></button>
			</div>
		</div>
	</div>


</body>
</html>