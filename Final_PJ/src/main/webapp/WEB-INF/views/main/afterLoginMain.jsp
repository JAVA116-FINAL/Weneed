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
			<button type="button" onclick="location.href='<c:url value="/matchupMem/matchupMemList.do"/>'">이력서 강화하기</button>
		</a>
		
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
					<c:forEach var="vo2" items="${listMainCareerList }">
						<a href="<c:url value='/career/detailpage/detailPage.do?programNo=${vo2.programNo }'/>" style="display:block;">
							<div class="testimonial-block style-2"
								style="background:url('<c:url value='/programImgUpload/${vo2.proImage }' />') center/cover no-repeat; height:270px;padding:0; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
								<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">${vo2.proName }</h3></div>
							</div>
						</a>
					</c:forEach>
				</div>
			</div>
		</section>
		
		<!-- 신규 회사 -->
		<div class="newJob-box">
			<div class="carrer-chance-title-wrap">
				<div class="newJob-title-div">
					<h2 class="newJob-box-title">신규 회사</h2>
				</div>
			</div>
				<section class="fetaure-page ">
						<div class="row">
						<c:forEach var="vo" items="${listNewRecruit }">
							<div class="col-lg-3 col-md-6">
								<div class="about-block-item mb-5 mb-lg-0">
									<img src="<c:url value='/companyImgUpload/${vo.comImgUrl }' />" alt="" class="img-fluid w-100" style="height:200px; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
									<h4 class="mt-3 passPredic-pic-title">${vo.comName }</h4>
									<div class="ge-job-card-company-location">${vo.industry }</div>
								</div>
							</div>
						</c:forEach>
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
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_001.png') center/cover no-repeat; height:270px; padding:0; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">성과는 상여금으로 보답하는 기업</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">회사가 성장하는 만큼 상여금, 성과급으로 보상하는 기업을 소개합니다.</div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_002.png') center/cover no-repeat; height:270px;padding:0; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">연봉 Flex! 연봉 상위 10% 기업</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">업계별 상위 연봉을 제시하는 기업을 소개합니다.</div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_003.png') center/cover no-repeat; height:270px;padding:0; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">패션, 뷰티 업계가 주목하는 기업</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">패션, 뷰티 업계가 주목하는 핫한 기업을 소개합니다.</div>
					</div>
	
					<div class="testimonial-block style-2"
						style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_004.jpg') center/cover no-repeat; height:270px;padding:0; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">글로벌 이커머스 플랫폼 'DHOLIC'</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">일본 K-패션 1위 이커머스 플랫폼, 디홀릭커머스 채용 중</div>
					</div>
	
					<div class="testimonial-block style-2"
					style="background:url('${pageContext.request.contextPath}/resources/images/main/main_theme_005.jpg') center/cover no-repeat; height:270px;padding:0; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
						<div style="position:relative; top:266px;"><h3 class="mt-3 passPredic-pic-title">대한민국 핀테크 선도 주자</h3></div>
						<div class="ge-job-card-company-location" style="position:relative; top:270px;">두나무 (업비트/증권플러스)</div>
					</div>
				</div>
			</div>
		</section>
		
		<!-- 신규채용포지션 -->
		<div class="weekRefer-box">
			<div class="weekRefer-title-wrap">
				<div class="weekRefer-title-div">
					<h2 class="weekRefer-box-title">신규 채용 포지션</h2>
				</div>
			</div>
				<section class="fetaure-page ">
						<div class="row">
						<c:forEach var="vo3" items="${listMainNewPosiiton }">
							<div class="col-lg-3 col-md-6">
								<a href="<c:url value='/jobsearch/jobsearchDetail.do?posNo=${vo3.posNo }'/>" style="display:block;">
									<div class="about-block-item mb-5 mb-lg-0">
										<img src="<c:url value='/companyImgUpload/${vo3.comImgUrl }' />" alt="" class="img-fluid w-100" style="height:200px; border-radius:3px; box-shoadow:inset 0 0 0 1px rgb(0 0 0 / 10%);">
										<h4 class="mt-3 passPredic-pic-title">${vo3.posName }</h4>
										<p class="ge-job-card-company-name">${vo3.comName }</p>
										<div class="ge-job-card-company-location">
											<c:set var="region" value="${vo3.region }"/>
											<c:choose>
												<c:when test="${region eq 'KR11' }">서울</c:when>
												<c:when test="${region eq 'KR12' }">부산</c:when>
												<c:when test="${region eq 'KR13' }">대구</c:when>
												<c:when test="${region eq 'KR14' }">인천</c:when>
												<c:when test="${region eq 'KR19' }">경기</c:when>
												<c:when test="${region eq 'JP11' }">도쿄</c:when>
												<c:when test="${region eq 'JP12' }">오사카</c:when>
												<c:when test="${region eq 'JP13' }">교토</c:when>
												<c:when test="${region eq 'JP14' }">후쿠오카</c:when>
												<c:when test="${region eq 'JP15' }">ETC</c:when>
												<c:when test="${region eq 'TW11' }">타이페이</c:when>
												<c:when test="${region eq 'TW12' }">가오슝</c:when>
											</c:choose>
											<span class="ge-addressDot">.</span>
											<span>
											<c:set var="nation" value="${vo3.nation }"/>
											<c:choose>
												<c:when test="${nation eq 'KR' }">한국</c:when>
												<c:when test="${nation eq 'TW' }">대만</c:when>
												<c:when test="${nation eq 'SG' }">싱가폴</c:when>
												<c:when test="${nation eq 'JP' }">일본</c:when>
												<c:when test="${nation eq 'HK' }">홍콩</c:when>
												<c:when test="${nation eq 'ETC' }">기타</c:when>
											</c:choose>
											</span>
										</div>
										<div class="ge-reward">채용보상금 1,000,000원</div>
									</div>
								</a>
							</div>
						</c:forEach>
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