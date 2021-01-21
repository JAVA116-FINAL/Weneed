<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="afterLogin-wrapper">

	<!-- top 슬라이더 -->
	<div class="mainTopSlider">
	
	</div>
	
	<div class="container">
		<!-- 이력서 강화하기 -->
		<a href="#" class="profile-matching-area">
			<h3>
				<div class="matching-percent-box">
					<div class="matching-percent">60%</div>
				</div>
				<p class="matching-area-desc">
					프로필에 이력서 추가하고, 인사담당자에게 직접 면접 제안 받으세요
				</p>
			</h3>
			<button type="button">이력서 강화하기</button>
		</a>
		
		<!-- 추천할만한 사람 -->
		<div class="refer-box">
			<div class="refer-box-title-wrap">
				<div class="refer-box-title-div">
					<h2 class="refer-box-title">추천할만한 사람<a href="#"><i class="icon-setting refer-box-title-icon"></i></a></h2>
				</div>
				<div class="refer-innerBox">
					<div class="network-icon-box"><img src="${pageContext.request.contextPath}/resources/images/new_network_icon.png"></div>
					<p class="refer-innerBox-con">간단하게 네트워크 연결하고 지인들의 추천을 받아보세요.</p>
					<a href="#" class="connect-network">네트워크 연결</a>
				</div>
			</div>
		</div>
		
		<!-- 합격예측 포지션 -->
		<div class="passPredic-box">
				<div class="passPredic-title-div">
					<h2 class="passPredic-title">합격예측 포지션</h2>
					<a href="#">더보기</a>
				</div>
				<section class="fetaure-page ">
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main_passPredic_001.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">Junior Front-end Developer (Web)</h4>
									<p class="ge-job-card-company-name">이투스교육</p>
									<div class="ge-job-card-company-location">서울
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main_passPredic_001.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">Senior Front-end Developer (Web)</h4>
									<p class="job-card-company-name">이투스교육</p>
									<div class="job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main_passPredic_002.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">백엔드 엔지니어</h4>
									<p class="job-card-company-name">리디(RIDI)</p>
									<div class="job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item">
									<img src="${pageContext.request.contextPath}/resources/images/main_passPredic_003.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">백엔드 개발자</h4>
									<p class="job-card-company-name">두번째</p>
									<div class="job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
						</div>
				</section>
		</div>
		
		<!-- 커리어 성장의 기회 -->
		<div class="career-chance-box">
			<div></div>
		</div>
</div>
</div>