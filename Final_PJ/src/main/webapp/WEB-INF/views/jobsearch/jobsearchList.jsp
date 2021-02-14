<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 직군별연봉 리스트 스타일이랑 같아서 가져다 씀 -->
<link rel="stylesheet" href="<c:url value='/resources/css/jobSalary.css'/>">
<!-- 슬릭슬라이더 -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<style>
.jobsearchList-sliderSec{
	padding-top: 20px;
	border-bottom: 1px solid #e1e2e3;
	margin-bottom: 20px;
}
.post-slider{
  margin: 20px 10px;
}
.post-slider .post-wrapper{
	height:60px;
	margin:0px auto;
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

.jobsearchListImg{
	border-radius: 5px;
	height: 180px;
}

.jobsearchDivBounds{
	display: flex;
	flex-wrap: wrap;
}

.jobsearchDiv{
	cursor: pointer;
}
</style>
<script type="text/javascript">
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
        <h1 class="sider-title"><a href="#">전체</a></h1>
		<div class="post-slider">
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
			<div class="jobsearchDivBounds">
				<!-- 포지션공고 그려주기 시작 -->
				<c:forEach var="posViewVo" items="${posList }">
				<div class="col-lg-3 col-md-6 jobsearchDiv" onclick="location.href='<c:url value="/jobsearch/jobsearchDetail.do?posNo=${posViewVo.POSNO}"/>'">
					<div class="about-block-item mb-5 mb-lg-0" style="padding-bottom:40px;">
						<img src="${pageContext.request.contextPath}/companyImgUpload/${posViewVo.COMIMGURL}" alt="" class="img-fluid w-100 jobsearchListImg">
						<h4 class="mt-3 passPredic-pic-title">${posViewVo.POSNAME}</h4>
						<p class="ge-job-card-company-name">${posViewVo.COMNAME}</p>
						<div class="ge-reward">채용보상금 1,000,000원</div>
					</div>
				</div>
				</c:forEach>
				<!-- 포지션공고 그려주기 끝-->
			</div>
		</section>
	</section>
</div>

<%@ include file="../inc/bottom.jsp" %>