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
							<img src="<c:url value='/resources/images/career/servicon.PNG'/>" alt="" class="img-fluid">
				
							<div class="blog-item-content mt-5">
				<!-- 상세페이지 제목/ 직무 -->
								<h2 class="mb-4 text-md">[토스페이먼츠] Data Analyst</h2>
				<!-- 회사명, 회사정보페이지로 연결 -->
								<div class="companyInfo_jy">				
									<span class="comName_jy"> <a href="#"> 비바리퍼블리카(토스)</a></span>
									<div class="replyperbt_jy">
											<button style="cursor:default" type="button" >응답률 평균이상</button>
									</div>
									<span> | 서울·한국</span>	
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
										<p class="p-jscontext_jy">
											토스페이먼츠팀은 대한민국 전자결제 시장을 새롭게 바꿔나가는 것을 목표로 합니다. 온라인과 모바일 커머스 시장의 확대에 따라 일상 생활에서 뗄 수 없는 결제 서비스, 토스페이먼츠가 기술 및 비즈니스 모델 혁신을 통해 사업자들과 소비자 모두에게 혜택이 돌아갈 수 있는 새로운 결제 서비스 경험을 제공하고자 합니다.
											<br>
											<b>주요업무</b><br>
											• 전사의 모든 구성원이 Data-driven 의사결정을 내릴 수 있도록 정량적 수치와 분석 결과를 제공합니다.
											• 목표로 하는 지표의 성장을 위한 임팩트 있는 가설을 설정하고, 이를 검증하기 위한 A/B 테스트 실험을 설계하며, 결과를 분석하여 전달합니다.
											• 실제 유저들이 경험하는 App/Web 상의 로깅 및 이를 통한 Funnel 분석을 수행합니다.
											• 토스 앱 및 토스페이먼츠의 웹에서 발생하는 Raw Data들을 정제/가공/적재하며, 이를 바탕으로 전사 팀원이 바라보는 실시간 대시보드 및 리포트를 구성합니다.
											• 비즈니스를 운영하는 사업자들에게 판매 상품과 산업에 대한 다양한 분석적 Insight을 제공하여, 경영상의 실질적인 도움을 줍니다.
											• 20년 이상 적재된 결제 데이터를 모델링하여 실시간 결제 Anomaly를 탐지하고, 가맹점의 성장 기회를 도출합니다.
										</p>
									</div>
									
				<!-- 자격요건 -->	
									<div class="divcontent div-jsqualification_jy">				
										<p class="p-jsqualification_jy">
											<b>	자격요건</b><br>
											• 모바일 서비스 데이터 분석 방법(LTV, AARRR, Cohort, Funnel 등)에 대한 높은 수준의 이해도가 필요합니다.
											• SQL을 사용한 Raw Data 핸들링 역량이 필요합니다.
											• T/모바일/금융 업종에 대한 높은 이해도와 데이터 분석 경험이 필요합니다.
											• 분석 결과물을 적시에 간결한 언어로 전달할 수 있어야 합니다.
											• 비즈니스 시나리오별 시뮬레이션을 통해 액션을 제시하실 수 있는 역량이 필요합니다.
											• 복잡하고 다양한 데이터 셋을 정제하여 서비스의 문제를 진단하고 해결하는 역량이 필요합니다.
					<!-- 우대가 따로있나? -->						
											<b>우대사항</b><br>
											• 적재 기간이 10년 이상인 데이터셋을 정제/분석하여 Insight를 도출하고, 이를 통해 성과를 낸 경험이 있는 분이면 좋습니다.
											• Python, R, Spark 등을 활용한 데이터 프로세싱에 대한 이해도가 높으신 분이면 좋습니다.
											• 통계학, 금융공학, 예측 모델링 관련 석/박사 학위를 소지하셨거나 해당 분야에 대한 경험이 많으시면 좋습니다.
											• Data Warehouse 구축 지식이나 경험이 있으면 좋습니다.
											• 데이터 시각화(Tableau, Grafana 등)에 대한 경험이 풍부하시면 좋습니다.
										</p>
									 </div>
				<!-- 복지정책 -->	
				
									<div class="divcontent div-jsbenefit_jy">
										<p class="p-jsbenefit_jy">
											<b>혜택과 복지</b> <br>
											
											토스팀 소개
											• 자율과 책임의 문화: 토스팀은 Manager가 아닌 Maker 들로 구성된 팀으로, 투명한 정보 공유와 수평적인 문화 속에서 구성원 업무에 대한 위임과 신뢰를 바탕으로 세상을 변화 시켜 나가고자 합니다.
											• 효율적인 업무방식: 토스팀은 가장 중요하고, 큰 영향을 미칠 수 있는 일에 집중합니다. 획일적인 업무 프로세스보다는 데이터 기반의 사고로 적극적으로 토론하며, 가장 효율적인 문제 해결을 위해 협업하고 실행합니다.
											• 훌륭한 팀과 동료: 토스팀은 각 분야 최고 수준의 역량을 갖춘 인재들이 자율과 책임의 원칙 아래 뛰어난 역량을 발휘하고 있습니다.
											<br>
											혜택 및 복지
											업무에만 몰입할 수 있는 최고 수준의 복리후생을 제공합니다.
											<br>
											"자율과 효율의 근무환경을 제공합니다."
											• 탄력적 출퇴근 제도
											• 원격 근무 제도
											• 별도 승인 없는 무제한 휴가
											• 근속 3년마다 리프레시 유급 휴가 1개월
											• 매월 마지막 금요일 전사휴식 & 특별활동 지원
											<br>
											"업무와 성장에 몰두할 수 있게 지원합니다."
											• 역량에 맞는 연봉 제공
											• 반기별 성과급 지급
											• 업무 관련 비용 100% 지원(교육,컨퍼런스,도서 등)
											• 최고급 장비 및 소프트웨어 제공(베리데스크 지원)
											• 직장단체보험비(가족 포함), 통신비, 체력단련비, 경조사비(화환,물품 등), 상여금, 생일축하비 지원
											• 매년 종합건강검진 제공
											<br>
											"먹고 마시는 것, 회사가 책임집니다."
											• 법인카드 100% 지급(식대, 야근택시비 등)
											• 사내카페 내 음료 및 디저트 무료 및 편의점 운영
											• 신청하는 모든 간식 구비
											• 사내 헤어살롱 무료 이용(염색,드라이,펌,두피스케일링 등)
											
										</p>
									</div>
								</div><!-- jobsearchcontents div -->
								<hr>
<!-- 마감일, 회사주소, 지도-->									
								<div style="margin: 15px; color: black; font-size:15px;">
									<span style="color:gray;">마감일 &nbsp;&nbsp;&emsp;</span><span><b>상시</b></span><br>
									<span style="color:gray;">근무지역 &nbsp;&nbsp;</span><span><b>강남구 언주로 134길 4 IB타워 4층</b></span>
								</div>
								
								<div class="google-map ">
									<%@ include file="map.jsp" %>
								</div>
								
								<!-- 여기다가 회사 네임카드랑 팔로우 -->								
								<div style="width: 730px; height:80px; border: 0.3px solid gray">
								   	<button type="button" class="btnCompan" onClick="location.href='companyDetail.do'" style="outline:none;">
								   	<div style="width:280px; margin:15px;">
							   			<div>
							   				<img alt="" src="<c:url value='https://static.wanted.co.kr/images/wdes/0_5.79fe6c9d.jpg'/>" style="width:50px; height:50px; float:left;">
							   			</div>
							   			<div style="float:left; margin-left:10px; text-align:left; font-size:13px; font-weight:bold;">
							   				<p>바바리퍼블리카(토스)</p>
							   				<p style="color:gray; margin-top:-8px;">IT, 컨텐츠</p>
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
			 <section class="section service-2">
				<div class="container">
					<div class="row justify-content-center">
						<div class="col-lg-7 text-center">
							<div class="section-title">
			<!-- 세션에서 이름가져와서 뿌리기 -->				
								<h2>(회원)님, 이 포지션을 찾고 계셨나요?</h2>					
							</div>
						</div>
					</div>
			
					<div class="row">
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
			
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
						
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
			
			
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
			
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
						
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
						
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
						
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
						
						<div class="col-lg-3 col-md-6 ">
							<div class="department-block mb-5">					
							 <img src="<c:url value='https://static.wanted.co.kr/images/company/83/djxmrxkylueirxwa__400_400.jpg'/>" class="img-fluid w-100"> 
								<div class="content">
									<a href="#" class="read-more">
										<h4 class="mt-4 mb-2 title-color">[로톡] People & Culture 담당자</h4>
										<p class="mb-4">로앤컴퍼티(lawtalk)</p>
										<p>서울ㆍ한국</p>
										<p>채용보상금 1,000,000원</p>
									</a>
								</div>
							</div>
						</div>
						
					</div> <!-- rowDiv -->
				</div> <!-- containerdiv -->
			</section>           
            
              
        </div> <!-- 바깥 rowdiv -->
    </div>
</section> <!-- 바깥containerdiv -->





<%@ include file="../inc/bottom.jsp" %>