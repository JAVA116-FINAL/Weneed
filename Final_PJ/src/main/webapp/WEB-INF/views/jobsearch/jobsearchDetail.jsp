<%@ include file="../inc/top.jsp" %>
<!-- 자연 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <link rel="stylesheet" href="<c:url value='/resources/css/resumeIntro.css'/>"> --%>
<link rel="stylesheet" href="<c:url value='/resources/css/jobsearchApply.css'/>">

<script type="text/javascript">

	$(function(){
/* 자연 */
 
		$('#btApply').click(function(){
			$.ajax({
				url:"<c:url value='/jobsearch/apply.do'/>",
				data:"posNo="+27/* 포지션번호 넣어주기! ${posNo} */,
				type:"get",
				success:function(result){
					$('#asideApply').empty();
					$('#asideApply').html(result);
					
				}
			});	 		
		});
	});
</script>

<section class="section blog-wrap" style="margin-top:-70px;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8">
                <div class="row">
					<div class="col-lg-12 mb-5">
						<div class="single-blog-item">
							<img src="<c:url value='/companyImgUpload/${comImg}'/>" alt="" class="img-fluid">
				
							<div class="blog-item-content mt-5">
				<!-- 상세페이지 제목/ 직무 -->
								<h2 class="mb-4 text-md">${posVo.posName}</h2>
				<!-- 회사명, 회사정보페이지로 연결 -->
								<div class="companyInfo_jy">				
									<span class="comName_jy"> <a href="#"> ${cominfoVo.comName }</a></span>
									<div class="replyperbt_jy">
											<button style="cursor:default" type="button" >응답률 평균이상</button>
									</div>
									<span> | ${cominfoVo.region } · ${cominfoVo.nation }</span>	
								</div>
				<!-- 회사정보 태그넣기 -->				
								<div class="sidebar-widget tags mb-3">
									<a href="#">#통신비</a>
									<a href="#">#단체보험</a>
									<a href="#">#건강검진</a>
									<a href="#">#택시비</a>
									<a href="#">#사내카페</a>
									<a href="#">#간식</a>
									<a href="#">#음료</a>
									<a href="#">#상여금</a>
									<a href="#">#IT,컨텐츠</a>
								</div>
				
								<!-- <p class="lead mb-4"> </p>-->	
								<!-- <p class="lead mb-4 font-weight-normal text-black">The same </p> -->
												
								<div class="jobsearch-contetns_jy">
								
				<!-- 주요직무/소개? -->
									<div class="divcontent div-jscontext_jy">
										<div>
											<p>${posVo.posContext }</p>
											<br>
										</div>
											
										<div>
											<h3><b>주요업무</b></h3><br>
											<p>${posVo.posCareer }</p>
										</div>										
									</div>
									<br>
									
				<!-- 자격요건 -->	
									<div class="divcontent div-jsqualification_jy">				
										<div>
											<h3><b>	자격요건</b></h3>
											${posVo.qualification }
										</div>	
											<br>
					<!-- 우대가 따로있나? -->						
										<div>
											<h3><b>우대사항</b></h3>
											${posVo.preferentialTreatment }
										</div>
									 </div>
											<br>
					<!-- 복지정책 -->	
				
									<div class="divcontent div-jsbenefit_jy">
										<div>
											<h3><b>혜택과 복지</b></h3>
											${posVo.welfareBenefits}
										</div>
									</div>
									<br>
								</div><!-- jobsearchcontents div -->
								<hr>
<!-- 마감일, 회사주소, 지도-->									
								<div style="margin: 15px; color: black; font-size:15px;">
									<span style="color:gray;">마감일 &nbsp;&nbsp;&emsp;</span><span><b>${proVo.endDate }</b></span><br>
									<span style="color:gray;">근무지역 &nbsp;&nbsp;</span><span><b>${cominfoVo.comAddress }</b></span>
								</div>
								
								<div class="google-map ">
									<%@ include file="map.jsp" %>
								</div>
								
								<!-- 여기다가 회사 네임카드랑 팔로우 -->								
								<div style="width: 730px; height:80px; border: 0.3px solid gray">
								   	<button type="button" class="btnCompan" onClick="location.href='companyDetail.do'" style="outline:none;">
								   	<div style="width:280px; margin:15px;">
							   			<div>
							   				<img alt="" src="<c:url value='/companyImgUpload/${comImg}'/>" style="width:50px; height:50px; float:left;">
							   			</div>
							   			<div style="float:left; margin-left:10px; text-align:left; font-size:13px; font-weight:bold;">
							   				<p>${cominfoVo.comName }</p>
							   				<p style="color:gray; margin-top:-8px;">${cominfoVo.industry }</p>
							   			</div>
							   			</div>
								   	</button>
								   
								   	<button type="button" class="followButton" onClick="location.href='#'" style="font-weight: bold; width:85px; height:30px; background-color:#258bf7; border-radius: 3px; color: #fff; float:right; margin:21px;">
								   		팔로우
								   	</button>
								</div>
							</div>
						</div>
					</div>
				</div>
            </div>
<!-- 여기부터 aside -->
<!-- 자연임포트  ajax 이벤트 걸어야함!!!! posNo파라미터로 넣기-->
			<%-- <div id="displayApply">
				<c:import url="/jobsearch/apply.do?posNo=27"></c:import>
			</div> --%>
			<div id="displayAside">
				  <aside class="col-lg-4 asideApply_jy" style="margin-left:-30px;" id="asideApply">
				  <%@include file="aside.jsp"%>
					   <!-- <div class="sidebar-wrap pl-lg-4 mt-5 mt-lg-0" style="width:350px;">
							<div class="sidebar-widget schedule-widget mb-3">
								<div>
									<h5 class="mb-4">채용보상금</h5>
									<ul>
										<li> 
											<h4>추천인</h4>
											<p>500,000원</p>
										</li>
										<li> 
											<h4>지원자</h4>
											<p>500,000원</p>
										</li>
									</ul>
									<button type="button">
										공유버튼
									</button>
								</div>
								
								<div class="buttonsdiv_jy">
									<div class="btdiv_jy bookmarkbtdiv_jy"> 
										<button class="bookmark_jy" type="button">
											북마크하기
										</button>
									</div>
									<div class="btdiv_jy applybtdiv_jy">
										<button class="btapply_jy" type="button" id="btApply">
											지원하기
										</button>
									</div>
								</div>	
								
								<div>
									<button>
										<i class="icon-ic_favorite_black_24px :before"></i>
		좋아요 갯수		 				<span>32</span>
									</button>
									<button>
		좋아요 누른 사람들   				  <ul>
											<li style='background-image: url("https://static.wanted.co.kr/images/avatars/1345710/c968c352.jpg"), url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png")'></li>
											<li style='background-image: url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png"), url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png")'></li>
										</ul>
									</button>
								</div>
						 </div>
					</div> -->
	           </aside> 
 			</div>
 			
 			
 <!-- 어사이드끝 -->     
					<!--  <section class="section service-2"> -->
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-7 text-center">
									<div class="section-title" style="margin-top: 50px;">
					<!-- 세션에서 이름가져와서 뿌리기 -->				
										<h2><b>${memName}님, 이 포지션을 찾고 계셨나요?</b></h2>					
									</div>
								</div>
							</div>
					
					<c:if test="${empty jsDetailsViewVoList }">
							<div style="text-align:center;">	
								<h2>비슷한 채용포지션이  없습니다.</h2>
							</div>	
					</c:if>
					<c:if test="${!empty jsDetailsViewVoList }">
						<!-- 반복 시작 -->
								
						<div class="row">
							<c:forEach var="map" items="${jsDetailsViewVoList}">
								<div class="col-lg-3 col-md-6 ">
									<div class="department-block mb-5">				
										<img src="<c:url value='/companyImgUpload/${map["COM_IMG_URL"]}'/>" class="img-fluid w-100"> 
											<div class="content">
												<a href="#" class="read-more">
														<h4 class="mt-4 mb-2 title-color">${map["POS_NAME"]}</h4>
														<span class="mb-4">${map['COM_NAME']}</span><br>
														<span class="mb-4">${map['JIKMU_NAME']}</span><br>												
														<span>${map['REGION']}ㆍ${map['NATION']}</span><br>
														<span>채용보상금 1,000,000원</span>
												</a>
											</div>
									</div>
								</div>
							</c:forEach>
						</div>		
					</c:if>

					
				</div> <!-- containerdiv -->
            
              
        </div> <!-- 바깥 rowdiv -->
    </div>
</section> <!-- 바깥containerdiv -->





<%@ include file="../inc/bottom.jsp" %>