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
					<h1>Welcome 원티드</h1>
					<p>아래 정보를 입력하면,<br>홍길동님에게 찰떡궁합 회사를 매칭해드려요!</p>
				</div>
				<!-- 직군 -->
				<div class="ob-matching-wrapper">
					<label for="ob-category_id" class="ob-matching-label">직군</label>
					<div class="ob-matching-selectBox-wrapper">
						<div class="ob-matching-selectBox">
							<select name="ob-category-id" class="ob-category-id-select">
								<option value="" disabled hidden>선택해 주세요.</option>
								<option value="develope">개발</option>
							</select>
						</div>
					</div>
				</div>
				<!-- 직무 -->
				<div class="ob-matching-wrapper">
					<label for="ob-category_id" class="ob-matching-label">직무</label>
					<div class="ob-matching-selectBox-wrapper">
						<div class="ob-matching-selectBox">
							<select name="ob-category-id" class="ob-category-id-select">
								<option value="" disabled hidden>선택해 주세요.</option>
								<option value="develope">서버 개발자</option>
								<option value="develope">웹 개발자</option>
								<option value="develope">프론트엔드 개발자</option>
								<option value="develope">안드로이드 개발자</option>
								<option value="develope">iOS 개발자</option>
								<option value="develope">데이터 엔지니어</option>
								<option value="develope">파이썬 개발자</option>
								<option value="develope">소프트웨어 엔지니어</option>
								<option value="develope">DevOps / 시스템 관리자 </option>
								<option value="develope">Node.js 개발자</option>
								<option value="develope">개발 매니저</option>
								<option value="develope">데이터 사이언티스트</option>
								<option value="develope">머신러닝 엔지니어</option>
								<option value="develope">시스템, 네트워크 관리자</option>
								<option value="develope">C, C++개발자</option>
								<option value="develope">빅데이터 엔지니어</option>
								<option value="develope">QA, 테스트 엔지니어</option>
								<option value="develope">PHP 개발자</option>
								<option value="develope">프로덕트 매니저</option>
								<option value="develope">웹퍼블리셔</option>
								<option value="develope">보안엔지니어</option>
								<option value="develope">.NET 개발자</option>
								<option value="develope">루비온레일즈 개발자</option>
								<option value="develope">임베디드 개발자</option>
								<option value="develope">CTO, Chief Technology Officer</option>
								<option value="develope">블록체인 플랫폼 엔지니어</option>
								<option value="develope">영상, 음성 엔지니어</option>
								<option value="develope">크로스플랫폼 앱 개발자</option>
								<option value="develope">BI 엔지니어</option>
								<option value="develope">그래픽스 엔지니어</option>
								<option value="develope">VR 엔지니어</option>
								<option value="develope">CIO, Chief Information Officer</option>
							</select> 
						</div>
					</div>
				</div>
				<!-- 경력 -->
				<div class="ob-matching-wrapper">
					<label for="ob-category_id" class="ob-matching-label">경력</label>
					<div class="ob-matching-selectBox-wrapper">
						<div class="ob-matching-selectBox">
							<select name="ob-category-id" class="ob-category-id-select">
								<option value="" disabled hidden>선택해 주세요.</option>
								<option value="develope">신입</option>
								<option value="develope">1년</option>
								<option value="develope">2년</option>
								<option value="develope">3년</option>
								<option value="develope">4년</option>
								<option value="develope">5년</option>
								<option value="develope">6년</option>
								<option value="develope">7년</option>
								<option value="develope">8년 </option>
								<option value="develope">9년 </option>
								<option value="develope">10년 이상 </option>
							</select> 
						</div>
					</div>
				</div>
				<!-- 스킬 -->
				<div class="ob-matching-wrapper" style="padding-bottom:15px;">
					<label for="ob-category_id" class="ob-matching-label">스킬</label>
					<div class="ob-matching-selectBox-wrapper">
						<div class="ob-matching-selectBox">
							<input type="text" placeholder="보유 스킬을 검색해주세요." class="ob-category-id-select"><i class="icon-search" style="display:inline-block; margin-top:15px;"></i>
						</div>
					</div>
				</div>
				<!-- 알림체크 -->
				<div class="ob-evnet-wrapper">
					<div class="gaeun-agreeBox" style="margin-top:0; margin-bottom:0; border:none;">
						<div class="all-agree">
							<input type="checkbox" name="chkAll" class="ge-chkAll" style="margin-right:5px;">
							<span style="color:#939393; font-size:14px;">이벤트 소식 알림 정보 수신 거부</span>
							<a href="#" style="float:right; font-size:13px; color:#767676; padding-top:2px;">자세히</a>
						</div>
					</div>
				</div>
				<!-- 다음 or 내이력서 업로드하기 버튼 -->
				<div class="ob-button-wrapper">
					<button type="button" class="ob-next-btn" style="outline:none;">다음</button>
					<div class="ob-or">or</div>
					<button type="button" class="ob-upload-btn" style="outline:none;">내 이력서 업로드하기</button>
				</div>
			</div>
			<div class="ob-after-input-wrapper">
				<button type="button" class="ob-after-input-btn">나중에 입력할게요<i class="icon-arrow_right" style="float:right; color:#767676; font-size:20px;"></i></button>
			</div>
		</div>
	</div>


</body>
</html>