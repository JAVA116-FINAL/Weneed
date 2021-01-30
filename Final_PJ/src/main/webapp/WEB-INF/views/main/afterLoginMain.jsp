<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
.carousel-item img {
  position:relative;
  max-height: 300px;
  background-position:center center;
  background-size:cover;
}
.slick-list{
	height:350px!important;
}
.slick-dots li button:before{
	content: '•'!important;
}
</style>

<div class="afterLogin-wrapper">
	<!-- top 슬라이더 -->
	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block w-100" src="<c:url value='/resources/images/main/main_slider_001.jpg'/>" alt="First slide">
				<div class="container">
					<div class="mainTopSlider-con-box">
							<div>
								<h2>짐싸(ZIMSSA)</h2>
								<h3>개발, 디자인 등 전 직군 채용 중</h3>
							</div>
							<hr style="border-top:1px solid #eee; margin:0 -30px 14px;">
							<button type="button" style="display:flex;">
								<span style="font-size:15px; font-weight:600; text-align:center;color:#258bf7;">바로가기</span>
								<i class="icon-arrow_right" style="color:#258bf7; font-size:20px; margin-left:4px; margin-top:1px;line-height:21px;"></i>
							</button>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="<c:url value='/resources/images/main/main_slider_002.jpg'/>" alt="Second slide">
				<div class="container">
					<div class="mainTopSlider-con-box">
							<div>
								<h2>라이프 스타일 커머스</h2>
								<h3>윙잇 반려소반 커먼톤 전 직군 채용</h3>
							</div>
							<hr style="border-top:1px solid #eee; margin:0 -30px 14px;">
							<button type="button" style="display:flex;">
								<span style="font-size:15px; font-weight:600; text-align:center;color:#3366ff;">바로가기</span>
								<i class="icon-arrow_right" style="color:#3366ff; font-size:20px; margin-left:4px; margin-top:1px;line-height:21px;"></i>
							</button>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="<c:url value='/resources/images/main/main_slider_003.jpg'/>" alt="Third slide">
				<div class="container">
					<div class="mainTopSlider-con-box">
							<div>
								<h2>글로벌 InsurTech 기업</h2>
								<h3>밀리만코리아 - 소프트웨어 엔지니어 채용</h3>
							</div>
							<hr style="border-top:1px solid #eee; margin:0 -30px 14px;">
							<button type="button" style="display:flex;">
								<span style="font-size:15px; font-weight:600; text-align:center;color:#258bf7;">바로가기</span>
								<i class="icon-arrow_right" style="color:#258bf7; font-size:20px; margin-left:4px; margin-top:1px;line-height:21px;"></i>
							</button>
					</div>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	<div class="container">
		<!-- 이력서 강화하기 -->
		<a href="#" class="profile-matching-area" style="background:#3366ff;">
			<h3>
				<p class="matching-area-desc">
					프로필에 이력서 추가하고, 인사담당자에게 직접 면접 제안 받으세요!
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
		<section class="section testimonial-2" style="padding:20px 0 0 0;">
			<div class="carrer-chance-title-wrap">
				<div class="carrer-box-title-div">
					<h2 class="carrer-box-title">커리어 성장의 기회</h2>
					<a href="#"><h6 class="event-more-btn">다양한 이벤트 더보기></h6></a>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col-lg-12 testimonial-wrap-2">
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_career_001.jpg') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">Wanted Plus : 무제한으로 즐기는</h3></div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_career_002.jpg') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">우리회사 제품 라이브커머스로 팔기</h3></div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_career_003.jpg') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">Wanted Career Talk #8. DATA 누구에게나 처음은 있었다.</h3></div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_career_004.jpg') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">스터디살롱 : Where I am</h3></div>
					</div>
	
					<div class="testimonial-block style-2"
					style="background:url('${pageContext.request.contextPath}/resources/images/main/main_career_005.jpg') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">실전 프로젝트로 배우는 딥러닝 컴퓨터비전</h3></div>
					</div>
				</div>
			</div>
		</section>
		
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
		<section class="section testimonial-2" style="padding:0;">
			<div class="carrer-chance-title-wrap">
				<div class="carrer-box-title-div">
					<h2 class="carrer-box-title">테마별 채용</h2>
				</div>
			</div>
			<div class="row align-items-center">
				<div class="col-lg-12 testimonial-wrap-2">
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_001.png') center/cover no-repeat; height:270px; padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">성과는 상여금으로 보답하는 기업</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">회사가 성장하는 만큼 상여금, 성과급으로 보상하는 기업을 소개합니다.</div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_002.png') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">연봉 Flex! 연봉 상위 10% 기업</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">업계별 상위 연봉을 제시하는 기업을 소개합니다.</div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_003.png') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">패션, 뷰티 업계가 주목하는 기업</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">패션, 뷰티 업계가 주목하는 핫한 기업을 소개합니다.</div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_004.jpg') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">글로벌 이커머스 플랫폼 'DHOLIC'</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">일본 K-패션 1위 이커머스 플랫폼, 디홀릭커머스 채용 중</div>
					</div>
	
					<div class="testimonial-block style-2"
					style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_005.jpg') center/cover no-repeat; height:270px;padding:0;">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">대한민국 핀테크 선도 주자</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">두나무 (업비트/증권플러스)</div>
					</div>
				</div>
			</div>
		</section>
		
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

<!-- Bootstrap 4.3.2 -->
<script src="<c:url value='/resources/plugins/counterup/jquery.easing.js'/>"></script>
<!-- Slick Slider -->
<script src="<c:url value='/resources/plugins/slick-carousel/slick/slick.min.js'/>"></script>
<!-- Counterup -->
<script src="<c:url value='/resources/plugins/counterup/jquery.waypoints.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/shuffle/shuffle.min.js'/>"></script>
<script src="<c:url value='/resources/plugins/counterup/jquery.counterup.min.js'/>"></script>
<!-- Google Map -->
<script src="<c:url value='/resources/plugins/google-map/map.js'/>"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
<script src="<c:url value='/resources/js/script.js'/>"></script>