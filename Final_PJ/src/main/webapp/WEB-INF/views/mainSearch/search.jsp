<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/mainSearch.css'/>">

<div class="search-keyword-wrap">
	<h2 class="search-keyword">Product Manager / UX기획자</h2>
</div>

<div class="container search-wrap">
	<!-- 회사 -->
	<div class="search-company">
		<h2 class="search-company-title">회사<span>4</span></h2>
		<div class="search-company-conBox">
			<div class="row">
				<div class="col-lg-6">
					<a href="#" class="search-company-link">
						<div class="search-company-link-detail-left">
							<div class="search-company-img">
								<img src="<c:url value='/resources/images/search/search_company_001.jpg'/>">
							</div>
							<div class="search-company-name">
								<h5>라이클(언파/UNPA)</h5>
								<h6>판매, 유통</h6>
							</div>
						</div>
						<button type="button" class="follow-btn">팔로우</button>
					</a>
				</div>
				<div class="col-lg-6">
					<a href="#" class="search-company-link">
						<div class="search-company-link-detail-left">
							<div class="search-company-img">
								<img src="<c:url value='/resources/images/search/search_company_002.jpg'/>">
							</div>
							<div class="search-company-name">
								<h5>두나무(업비트/증권플러스)</h5>
								<h6>금융</h6>
							</div>
						</div>
						<button type="button" class="follow-btn">팔로우</button>
					</a>
				</div>
				<div class="col-lg-6">
					<a href="#" class="search-company-link">
						<div class="search-company-link-detail-left">
							<div class="search-company-img">
								<img src="<c:url value='/resources/images/search/search_company_003.jpg'/>">
							</div>
							<div class="search-company-name">
								<h5>크로키닷컴(ZIGZAG/지그재그)</h5>
								<h6>IT, 컨텐츠</h6>
							</div>
						</div>
						<button type="button" class="follow-btn">팔로우</button>
					</a>
				</div>
				<div class="col-lg-6">
					<a href="#" class="search-company-link">
						<div class="search-company-link-detail-left">
							<div class="search-company-img">
								<img src="<c:url value='/resources/images/search/search_company_004.jpg'/>">
							</div>
							<div class="search-company-name">
								<h5>I/O</h5>
								<h6>IT, 컨텐츠</h6>
							</div>
						</div>
						<button type="button" class="follow-btn">팔로우</button>
					</a>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 포지션 -->
	<div class="search-position">
		<h2 class="search-position-title">포지션<span>4</span></h2>
		<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_001.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">Machine Learning Engineer(Computer Vision)</h4>
									<p class="ge-job-card-company-name">플라스크</p>
									<div class="ge-job-card-company-location">서울
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_002.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">개발 총괄책임자-CTO</h4>
									<p class="ge-job-card-company-name">유니크굿컴퍼니</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_003.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">FLYBIT(플라이빗) IT부문 총괄책임자 (CTO)</h4>
									<p class="ge-job-card-company-name">한국디지털거래소</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;" >
									<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_004.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">테크 리드</h4>
									<p class="ge-job-card-company-name">퍼블리(PUBLY)</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
						</div>
	</div>
	
	<div class="job-opening-wrap">
		<h2 class="job-opening-title">원티드 이외의 채용공고를 더 확인해 보세요.</h2>
		<div class="job-opening-con-box">
			<h3>아쉽지만 수집된 채용공고가 충분하지 않습니다.<br>
			매치업에 등록하고 기업에게 먼저 면접제안을 받아보세요.</h3>
			<button type="button" style="outline:none;">매치업 등록하기</button>
		</div>
	</div>
</div>

<%@ include file="../inc/bottom.jsp" %>