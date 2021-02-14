<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/jobSalary.css'/>">

<!-- 슬릭슬라이더 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
.post-slider{
  margin: 20px 10px;
}
.post-slider .post-wrapper{
	height:60px;
	margin:0px auto;
	margin-bottom: 10px;
}
.post-slider .post-wrapper .post{
	width:100px;
	height:60px;
	display:flex;
	background: #fff;
	color: #444444;
	font-size: 0.9em;
	align-items: center;
	text-align: center;
	justify-content: center;
	border: 1px solid #e1e2e3;
	border-radius: 5px;
	margin: 0px 10px;
}
</style>
<script>
$(function(){
	$('.post-wrapper').slick({
		slidesToShow: 8,
		slidesToScroll: 3,
		autoplay: false,
		autoplaySpeed: 2000,
	});
});
</script>
<!-- 뷰페이지 현빈 작업  -->
<div class="container">
	<section class="jobsearchList-sliderSec">
		<div class="post-slider">
        	<h1 class="sider-title"><a href="#">전체</a></h1>
	        <div class="post-wrapper">
	          <div class="post">개발</div>
	          <div class="post">경영·비즈니스</div>
	          <div class="post">마케팅·광고</div>
	          <div class="post">디자인</div>
	          <div class="post">영업</div>
	          <div class="post">고객서비스·리테일</div>
	          <div class="post">미디어</div>
	          <div class="post">인사</div>
	          <div class="post">게임제작</div>
	          <div class="post">물류·무역</div>
	          <div class="post">금융</div>
	          <div class="post">엔지니어링·설계</div>
	          <div class="post">제조·생산</div>
	          <div class="post">의료·제약·바이오</div>
	          <div class="post">교육</div>
	        </div>
		</div>
	</section>
	<section class="jobsearchList-filterSec">
	
	</section>
	<section class="jobsearchList-ListSec">
		<div class="salary-upgrade-position-title-box">
			<h2 class="salary-upgrade-position-title">지원 가능한 포지션</h2>
		</div>
		<section class="salary-upgrade-position-con">
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
			<div class="row">
				<div class="col-lg-3 col-md-6">
					<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
						<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_005.jpg" alt="" class="img-fluid w-100">
						<h4 class="mt-3 passPredic-pic-title">VP of Engineering</h4>
						<p class="ge-job-card-company-name">퍼블리(PUBLY)</p>
						<div class="ge-job-card-company-location">서울
							<span class="ge-addressDot">.</span><span>한국</span>
						</div>
						<div class="ge-reward">채용보상금 1,000,000원</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;" >
						<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_006.jpg" alt="" class="img-fluid w-100">
						<h4 class="mt-3 passPredic-pic-title">개발팀 리드 (Tech Lead)</h4>
						<p class="ge-job-card-company-name">스타릭스(Locar)</p>
						<div class="ge-job-card-company-location">서울
							<span class="addressDot">.</span><span>한국</span>
						</div>
						<div class="ge-reward">채용보상금 1,000,000원</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;" >
						<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_007.jpg" alt="" class="img-fluid w-100">
						<h4 class="mt-3 passPredic-pic-title">개발자(프론트엔드/백엔드/풀스택)</h4>
						<p class="ge-job-card-company-name">원패밀리</p>
						<div class="ge-job-card-company-location">서울
							<span class="addressDot">.</span><span>한국</span>
						</div>
						<div class="ge-reward">채용보상금 1,000,000원</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6">
					<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
						<img src="${pageContext.request.contextPath}/resources/images/jobSalary/salary_008.jpg" alt="" class="img-fluid w-100">
						<h4 class="mt-3 passPredic-pic-title">매쓰플랫 개발팀 리더(팀장)</h4>
						<p class="ge-job-card-company-name">프리윌린</p>
						<div class="ge-job-card-company-location">서울
							<span class="addressDot">.</span><span>한국</span>
						</div>
						<div class="ge-reward">채용보상금 1,000,000원</div>
					</div>
				</div>
			</div>
		</section>
	</section>
</div>

<%@ include file="../inc/bottom.jsp" %>