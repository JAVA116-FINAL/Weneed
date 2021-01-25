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
<%@ include file="cssJsImports.jsp" %>
</head>
<body>
	<header>
		<div class="header-wrapper1">
			<div class="container">
				<!-- 로그인 전, 기업서비스 상단-1번 바 -->
				<div class="header-wrapper21" id="comServHeader1st">
					<div class="header-logo" id="comServHeaderLogo">
						<!-- 로그인 후 기업로고 + 기업명으로 변경? -->
						<c:if test="${empty comMemId}">
							<a class="comServNavbar-logo-link" href="#">Wanted for Employer</a>
						</c:if>
						<c:if test="${!empty comMemId}">
							<c:if test="${empty comInfoVo.comName }">
								<img src="#">
								<span class="comServNavbar-logo-link">
									소속기업명		
								</span>
							</c:if>
							<c:if test="${!empty comInfoVo.comName }">
								<img src="#">
								<span class="comServNavbar-logo-link">
									${comInfoVo.comName}	
								</span>
							</c:if>
						</c:if>
					</div>
					<div class="comServHeaderBtns">
						<c:if test="${empty comMemId}">
							<!-- 기업서비스 로그인 -->
							<button class="comServBtn comServLoginBtn"
								data-toggle="modal" data-target=".comServLoginMD" style="outline:none;">채용담당자 로그인</button>
							<%@include file="../company/modal/login.jsp" %>
							<!-- 기업서비스 관리자 회원가입 -->
							<button class="comServBtn comServJoinBtn"
								data-toggle="modal" data-target=".comServJoinMD" style="outline:none;">관리자 가입</button>
							<%@include file="../company/modal/join.jsp" %>
						</c:if>
						<c:if test="${!empty comMemId}">
						<!-- 기업서비스 로그인 후 담당자명+님 띄워줄 곳  -->
							<div class="comServDropdown">
								<button class="comServBtn comServBtn-name">${comMemVo.comMemName} 님 <i class="fas fa-chevron-down"></i></button>
								<div class="comServOptionMenu"> <!-- 내 프로필 / 로그아웃 링크 있는 곳 -->
									<a href="#">내 프로필</a>
									<a href="<c:url value='/company/logout.do'/>">로그아웃</a>
								</div>
							</div>
						</c:if>
						<a href="<c:url value='/index.do'/>" class="comServBtn gotoWantedMain">원티드 홈</a>
					</div>
				</div>
				<c:if test="${!empty comMemId}">
				<!-- 로그인 후, 기업서비스 상단-2번 바 추가 노출 -->
				<div class="header-wrapper22" id="comServHeader2nd">
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
							<li class="comServNav-item">
								<a class="comServNav-item-link" href="#">계정관리</a></li>
						</ul>
					</nav>
				</div>
				</c:if>
			</div>
		</div>
	</header>
</body>
