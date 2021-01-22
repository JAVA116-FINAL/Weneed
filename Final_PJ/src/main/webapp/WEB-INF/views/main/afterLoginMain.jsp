<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="afterLogin-wrapper">

	<!-- top 슬라이더 -->
	<div class="mainTopSlider">
		<div class="mainTopSlider-con-wrapper">
			<a href="#">
				<div class="mainTopSlider-con" style="background:url('${pageContext.request.contextPath}/resources/images/main/main_slider_001.jpg') center/cover no-repeat;">
					<div class="container">
					<div class="mainTopSlider-con-box">
						<div>
							<h2>짐싸(ZIMSSA)</h2>
							<h3>개발, 디자인 등 전 직군 채용 중</h3>
						</div>
						<hr style="border-top:1px solid #eee; margin:0 -30px 14px;">
						<button type="button" style="display:flex;">
							<span style="font-size:15px; font-weight:600; text-align:center;color:#258bf7;">바로가기</span>
							<i class="icon-arrow_right" style="color:#258bf7; font-size:20px; margin-left:4px; margin-top:1px;"></i>
						</button>
					</div>
					</div>
				</div>
			</a>
		</div>
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
					<div class="network-icon-box"><img src="${pageContext.request.contextPath}/resources/images/main/new_network_icon.png"></div>
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
									<img src="${pageContext.request.contextPath}/resources/images/main/main_passPredic_001.jpg" alt="" class="img-fluid w-100">
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
									<img src="${pageContext.request.contextPath}/resources/images/main/main_passPredic_001.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">Senior Front-end Developer (Web)</h4>
									<p class="ge-job-card-company-name">이투스교육</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_passPredic_002.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">백엔드 엔지니어</h4>
									<p class="ge-job-card-company-name">리디(RIDI)</p>
									<div class="ge-job-card-company-location">서울
										<span class="addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_passPredic_003.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">백엔드 개발자</h4>
									<p class="ge-job-card-company-name">두번째</p>
									<div class="ge-job-card-company-location">서울
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
			<div class="carrer-chance-title-wrap">
				<div class="carrer-box-title-div">
					<h2 class="carrer-box-title">커리어 성장의 기회</h2>
					<div><a href="#">다양한 이벤트 더보기></a></div>
				</div>
				<div class="carrer-box-title-btn">
				
				</div>
			</div>
			<div class="row">
			<div class="col-md-6">
				<div class="about-block-item">
					<a href="#">
					<img src="${pageContext.request.contextPath}/resources/images/main/main_career_001.jpg" alt="" class="img-fluid w-100" style="height:300px;">
					</a>
					<h3 class="mt-3 passPredic-pic-title">Wanted Plus : 무제한으로 즐기는</h3>
				</div>
			</div>
			<div class="col-md-6">
				<div class="about-block-item">
					<img src="${pageContext.request.contextPath}/resources/images/main/main_career_002.jpg" alt="" class="img-fluid w-100" style="height:300px;">
					<h3 class="mt-3 passPredic-pic-title">우리회사 제품 라이브커머스로 팔기</h3>
				</div>
			</div>
			</div>
		</div>
		
		<!-- 신규 채용 회사 -->
		<div class="newJob-box">
			<div class="carrer-chance-title-wrap">
				<div class="newJob-title-div">
					<h2 class="newJob-box-title">신규 채용 회사</h2>
				</div>
			</div>
				<section class="fetaure-page ">
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_newJob_001.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">언더독스</h4>
									<div class="ge-job-card-company-location">교육</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_newJob_002.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">루닛(Lunit)</h4>
									<div class="ge-job-card-company-location">IT, 컨텐츠</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_newJob_003.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">메가존</h4>
									<div class="ge-job-card-company-location">IT, 컨텐츠</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_newJob_004.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">이쿠얼키(인공지능수학깨봉)</h4>
									<div class="ge-job-card-company-location">교육</div>
								</div>
							</div>
						</div>
				</section>
		</div>
		
		<!-- 테마별 채용 -->
		<div class="theme-box">
			<div class="theme-title-wrap">
				<div class="theme-box-title-div">
					<h2 class="theme-box-title">테마별 채용</h2>
				</div>
				<div class="carrer-box-title-btn">
				
				</div>
			</div>
			<div class="row">
			<div class="col-md-6">
				<div class="about-block-item">
					<a href="#">
					<img src="${pageContext.request.contextPath}/resources/images/main/main_theme_001.png" alt="" class="img-fluid w-100" style="height:300px;">
					</a>
					<h3 class="mt-3 passPredic-pic-title">성과는 상여금으로 보답하는 기업</h3>
					<div class="ge-job-card-company-location">회사가 성장하는 만큼 상여금, 성과급으로 보상하는 기업을 소개합니다.</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="about-block-item">
					<img src="${pageContext.request.contextPath}/resources/images/main/main_theme_002.png" alt="" class="img-fluid w-100" style="height:300px;">
					<h3 class="mt-3 passPredic-pic-title">연봉 Flex! 연봉 상위 10% 기업</h3>
					<div class="ge-job-card-company-location">업계별 상위 연봉을 제시하는 기업을 소개합니다.</div>
				</div>
			</div>
			</div>
		</div>
		
		<!-- 금주의 추천 -->
		<div class="weekRefer-box">
			<div class="weekRefer-title-wrap">
				<div class="weekRefer-title-div">
					<h2 class="weekRefer-box-title">금주의 추천</h2>
				</div>
			</div>
				<section class="fetaure-page ">
						<div class="row">
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_weekRefer_001.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">카피라이터 에디터</h4>
									<p class="ge-job-card-company-name">에프컴퍼니</p>
									<div class="ge-job-card-company-location">서울
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_weekRefer_002.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">Back Office 개발</h4>
									<p class="ge-job-card-company-name">큐픽스</p>
									<div class="ge-job-card-company-location">경기
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_weekRefer_003.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">MD (리빙팀)</h4>
									<p class="ge-job-card-company-name">티몬(Tmon)</p>
									<div class="ge-job-card-company-location">서울
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item">
									<img src="${pageContext.request.contextPath}/resources/images/main/main_weekRefer_004.jpg" alt="" class="img-fluid w-100">
									<h4 class="mt-3 passPredic-pic-title">JAVA 백엔드 개발</h4>
									<p class="ge-job-card-company-name">쏠쏠</p>
									<div class="ge-job-card-company-location">서울
										<span class="ge-addressDot">.</span><span>한국</span>
									</div>
									<div class="ge-reward">채용보상금 1,000,000원</div>
								</div>
							</div>
						</div>
				</section>
		</div>
</div>
</div>