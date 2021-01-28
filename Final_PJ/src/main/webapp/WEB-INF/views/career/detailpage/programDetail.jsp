<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
$( document ).ready( function() {
	  var Offset = $( '.jbMenu' ).offset();
	  $( window ).scroll( function() {
	   if ( $( document ).scrollTop() > Offset.top ) {
	      $( '.jbMenu' ).addClass( 'fixed' );
	    }
	    else {
	      $( '.jbMenu' ).removeClass( 'fixed' );
	    }
	  });
	});
	
</script>	

<div class="jbMenu" style="width:100%; opacity:1;">
    	<nav class="navbar navbar-expand-lg navigation" id="navbar" style="background-color:#f8f8fa;">
		<div class="container" >
		 	 <div class="navbar-brand">
				<div class="myNav" style="width:100%;">
				  <ul class="navbar-nav ml-auto">
				  <li class="nav-item active"><a class="nav-link" href="#title">북클럽 소개</a></li>
				    <li class="nav-item"><a class="nav-link" href="#title1">이번 북클럽 소개</a></li>
				    <li class="nav-item"><a class="nav-link" href="#title2">프로그램 상세</a></li>
				    <li class="nav-item"><a class="nav-link" href="#title3">클럽장 소개</a></li>
				    <li class="nav-item"><a class="nav-link" href="#title4">참가비용</a></li>
				    <li class="nav-item"><a class="nav-link" href="#title5">후기</a></li>
				    <li class="nav-item"><a class="nav-link" href="#title6">안내/설문</a></li>
				 </ul>	
				</div>
			 </div>
		</div>
		</nav>
</div>
	
	
<body>
	<section class="section blog-wrap" style="margin-top:-60px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-lg-12 mb-5">
							<div class="single-blog-item">
								<img
									src="<c:url value='/resources/images/career/bookclub.PNG'/>"
									alt="" class="img-fluid">

								<!-- 태그넣기 -->
								<div class="sidebar-widget tags mb-3" style="margin-top:20px;margin-bottom: -60px;">
									<a href="#">#WantedPlus</a> 
									<a href="#">#BookClub</a> 
									<a href="#">#자기개발</a> 
									<a href="#">#커리어성장</a> 
									<a href="#">#IT,컨텐츠</a>
								</div>


								<div class="blog-item-content mt-5">
									<div class="blog-item-meta mb-3"></div>

									<!-- 내용부분 전체 시작!! -->

									<div style="color: black;">

										<!-- 제목, 내용 1 -->

										<div class="parag" id="parag1">
											<a name="title"><h3>
													<b>북클럽 소개</b>
												</h3></a> <br>
											<div>유튜브, 넷플릭스 등 재미난 할 거리들은 점점 늘어나고, 책 읽는 시간은 점점 줄어들게
												됩니다. 읽어야지, 읽어야지 하면서도 못 읽는 게 우리 모두의 현실이죠. Wanted Book Club에서는
												좋은 책을 꾸준히 읽어가면서 좋은 사람들과 교류할 수 있도록 도와드립니다. 클럽장이 추천한 좋은 책과
												멤버들과 함께 정한 책, 총 3권을 함께 읽어보세요. 혼자 읽는 것이 아니라 누군가와 함께 한다는 사실이
												꾸준히, 그리고 끝까지 읽을 수 있도록 도와줍니다. 책을 읽고 클럽장을 포함한 멤버들과 자연스럽게 이야기
												나누어보세요. 같은 책을 읽는다는 것은 같은 관심사와 고민을 가지고 있다는 의미입니다. 같은 관심사를 가진
												친구를 얻어 가세요.</div>

										</div>


										<!-- 
									<blockquote class="quote">A brand for a company is
										like a reputation for a person. You earn reputation by trying
										to do hard things well.</blockquote> -->

										<!-- 제목, 내용2 -->
										<div class="parag" id="parag2" style="margin-top: 50px;">
											<a name="title2"><h3>
													<b>이번 북클럽 소개</b>
												</h3></a> <br>
											<div>
												<p>
													Wanted Book Club : 작가는 아니지만 글은 쓰고 싶어 꼭 작가여만 글을 쓰는 걸까요? 사실
													우리는 아주 어릴 때부터 글을 써왔어요. 방학 숙제에 꼭 들어있던 일기였죠. 사실 우리 모두 작가였던
													거죠. 하지만 점차 어른이 되면서 글은 전문가들의 영역이라고 생각하게 됐고, 사회생활하면서부턴 글은
													보고서나 기획서에만 적는 걸로 여겼죠. 바로 그 생각에 변화를 만드는 모임이 되길 기대하고 있답니다.

													우리는 책 첫인상 & 책 내용, 왜 글을 써야 하는지를 함께 공유하고 이야기를 나누어요. 우리는 글을 쓰기
													위해 재료를 모으고, 재료를 통해 요리도 만드는 간단한 액션도 해볼 거예요. 우리는 글을 쓴다는 게 결국
													나를 관찰하고 나를 알아가는 시간이란 걸 알게 될 거예요. 우리는 발전을 위해 서로 글을 공유하고 피드백을
													주고받아볼 거예요. 우리는 공유하고, 응원하며 연결되어 '작가가 아니어도 글을 쓸 수 있음'을 경험할
													거예요. 우리는 모두 원래 작가였으니까요. 책 #1 : 회사말고 내 콘텐츠 일상에 패턴을 만드는 글쓰기 한
													줄의 글을 쓰고, 또 다음 줄을 쓰고 계속해서 콘텐츠를 만들었다. -p.21- 일상에 패턴이 생겼다.
													-p26- 꾸준히 글을 쓰는 힘, 글을 쓰며 일상에 패턴이 생길 때 새로운 나를 발견하게 됩니다. 지금
													환경과 여건 속에서 정의된 '내'가 아닌 새로움 속에 발견하고 정의할 수 있는 '내'가 있습니다. 회사에서
													정의된 '내'가 아닌 내가 만든 콘텐츠로 새롭게 정의할 수 있는 '내'가 있습니다. 같이 새로운 우리를
													발견하고자 합니다. 책 #2 : 기록의 쓸모 인사이트의 원천 기록 관찰력과 순간을 놓치지 않고 쥐는 힘이
													중요하지 -p32- 기록은 관찰과 순간을 놓치지 않는 힘. 기록을 통해서 언제든 다시 꺼내볼 수 있습니다.
													언제든 다시 꺼낼 수 있는 문자는 사람의 마음을 얻어내는 힘이 되죠. 세밀한 관찰력, 만사에 호기심을 갖는
													힘 기록의 쓸모, 기록의 습관을 같이 길러보고자 합니다. 책 #3 : 멤버들과 함께 정한 책 첫 모임 이후
													멤버들의 의견을 반영하여
													<작가는 아니지만 글은 쓰고 싶어>의 주제에 맞는 책을 선정해서 모임을 진행합니다. 
												</p>
											</div>
										</div>

										<!-- 제목, 내용 3 -->
										<div class="parag" id="parag3" style="margin-top: 50px;">
											<a name="title3"><h3>
													<b>프로그램 상세</b>
												</h3></a> <br>
											<div>원티드 북클럽은 이렇게 진행됩니다. 1. 사전 질문 - 신청 후 1일 이내에 사전 질문지가
												전달됩니다. - 사전 질문 내용은 Intro 모임에서 활용됩니다. (*질문지 내용 : 간단 본인 소개,
												커리어 소개, 북클럽 신청 이유 등) 2. 안내 메일 - 북클럽 시작 2일 전까지 첫 모임 안내 메일이
												전달됩니다. (*안내 메일 내용 : 온/오프라인 진행 방식, 준비사항, 기타 공지 등) 3. 북클럽 시작 -
												총 5번의 모임을 통해 멤버들을 알아가고 책 그리고 관련된 주제들에 대해 이야기 나눠보세요. - 상시로
												카카오톡 비밀 채팅방을 통해 자료와 의견도 공유하고 자유롭게 소통하세요.</div>
										</div>

										<!-- 제목, 내용 4 -->
										<div class="parag" id="parag4" style="margin-top: 50px;">
											<a name="title4"><h3>
													<b>클럽장 소개</b>
												</h3></a> <br>
											<div>사단법인 점프(JUMP) 지역확산팀 부팀장 김결 작가는 아니지만 글은 쓰고 있는 김결이라고
												합니다. 초등학교부터 대학교까지 14년간 야구를 전문적으로 해온 야구선수 출신이지만 현재는 전혀 다른 분야인
												비영리 소셜벤처에서 일하고, 꾸준히 블로그에 글을 쓰며 프로 N잡러를 꿈꾸는 평범한 행복러입니다. 저는
												평범한 사람도 글을 쓸 수 있다는 것을 믿고, 디지털 세상에서 글이란 아날로그를 어떻게 사용해야 하는지
												고민하고 다양한 방법을 시험하고 실행하고 있어요. 캄보디아에서 봉사활동을 하며 시를 쓰기 시작했고 현재까지
												블로그에 Book Review, Media Review, Travel Diary, Think Memo,
												Walk Insight, Job소리, 여섯 가지 카테고리로 다양한 글을 올리고 있어요. 다양한 사람과
												얘기하는 걸 좋아해서 팟캐스트를 기획해 운영을 하고 있기도 해요. 제일 좋아하는 책을 꼽으라면 슬램덩크로
												인생의 교훈, 재미, 성장 등 많은 것을 발견할 수 있는 책이라고 할 수 있죠. 전직 야구 선수 출신으로
												제법 활동적이며, 한 달 50km 이상 러닝을 꾸준히 하고 있어요. 강릉-속초 종주도 하고, 현재는 매일
												일만 보 이상을 걸으며 산책하는 재미에 푹 빠져있어요. 야구선수 출신, 비영리 소셜 벤처, 팟캐스트
												기획/운영까지 평범하지만 다양한 경험을 한 저와 함께 근손실이 아닌 글손실 방지를 해보실까요? - 블로그 -
												팟캐스트 - 인스타그램</div>
										</div>

										<!-- 제목, 내용 5 -->
										<div class="parag" id="parag5" style="margin-top: 50px;">
											<a name="title5"><h3>
													<b>참가비용</b>
												</h3></a> <br>
											<div>-</div>
										</div>


										<!-- 제목, 내용 6 -->
										<div class="parag" id="parag6" style="margin-top: 50px;">
											<a name="title6"><h3>
													<b>후기</b>
												</h3></a> <br>
											<div>"혼자 책을 읽는 것과 함께 책을 읽는 것은 완전히 다른 경험이다" 혼자 책을 읽는 것과
												함께 책을 읽는 것은 완전히 다른 경험이었습니다. 같은 부분을 읽어도 여러 다른 생각을 나눌 수 있어서
												좋았고, 서로의 고민에 공감하며 함께 나누는 대화 속에서 많은 에너지를 얻어갈 수 있었습니다. 몇 권의
												책으로 좋은 분들과 연결되고 이전보다 더 넓게 생각할 수 있어서 즐거웠습니다. - 북클럽 참가자 박지영님 -

												"온라인으로 진행할 수 있다는 점이 가장 마음에 들었다" 평소에 바빠서 독서 모임을 등록하지 못하고
												있었는데, 장소 부담 없이 온라인으로 진행할 수 있어서 바로 신청했습니다. 원티드 북클럽을 통해 만난 업계의
												리더, 담당자분들과 토론하고, 메신저를 통해 경험, 인사이트를 공유하면서 많은 고민들을 해결할 수
												있었습니다. 실질적인 도움을 많이 받아서 너무 좋았습니다. :) - 북클럽 참가자 김예리님 - "같은
												관심사를 갖고 있는 사람들과 함께 고민할 수 있었던 소중한 시간이었다" 북클럽에 함께 참여하신 다양한 분들과
												함께 소통하고 공유하며 커뮤니티를 형성할 수 있어서 좋았습니다. 같은 관심사를 가지고 있는 분들과 고민을
												나누며 본질적인 가치에 더 가깝게 다가갈 수 있었습니다. 여러 방면으로 의미 있는 북클럽이었습니다. -
												북클럽 참가자 박명규님 - "다양한 경험과 노하우를 공유하여 책을 다각도로 보고 생각할 수 있었다" 온라인
												모임이었지만 생각보다 편했습니다. 평소 인간관계의 틀에서 벗어나 다양한 인사이트, 경험을 가지고 계신 분들과
												만나서 신선하고 좋았습니다. 다양한 경험과 노하우를 아낌없이 공유해줘서 책을 다각도로 보고 생각할 수
												있었습니다. 또한, 고민을 털어 놓았을 때 모두 함께 해결책을 찾아주려고 애써주시는 모습도 너무
												인상적이었습니다. 원티드 북클럽 강추합니다! - 북클럽 참가자 나윤숙님 -</div>

										</div>


										<!-- 제목, 내용 7 -->
										<div class="parag" id="parag7" style="margin-top: 50px;">
											<a name="title1"><h3>
													<b>안내/설문</b>
												</h3></a> <br> <b>혜택과 복지</b> <br>

											<div>본 북클럽은 Wanted Plus를 구매해야 참가할 수 있는 프로그램입니다. 본 북클럽은
												소수 인원의 활발한 소통을 목적으로 하는 모임으로 정원은 10명입니다. 조기 마감될 수 있습니다. 신청 후
												진행 순서는 '프로그램 상세' 내용을 확인해 주시기 바랍니다. 책 구매는 북클럽에서 지원하지 않으며,
												오프라인 모임 비용은 참가 비용에 포함되어 있습니다. 온라인 세션은 Google Meet을 통해 진행됩니다.

											</div>

										</div>


									</div>
								</div>

							</div>



						</div>
				</div>
				</div>
				
<!-- aside 부분!!!! -->				
				<div class="col-lg-4">
					<div class="sidebar-wrap pl-lg-4 mt-5 mt-lg-0" >


						<div class="sidebar-widget schedule-widget mb-3" style="background-color:#fff; margin-left:-60px; margin-top:-20px; width:380px">
							<h5 class="mb-4"><b>북클럽: ${proName }</b></h5>

							<ul class="list-unstyled">
							
									<div style="font:12px;"><span>일자</span></div>
									<div style="color:black; font:12px;"><span>${proStartDate}</span></div><br>
									<div style="font:12px;"><span>장소</span></div>
									<div style="color:black; font:12px;"><span>세종 S씨어터</span></div><br>
									<div style="font:12px;"><span>주최자</span></div>
									<div style="color:black; font:12px;"><span>${proSponsor}</span></div>
							
							</ul>
							<br><br><br>
							<div class="sidebar-contatct-info mt-4" style="padding-top:10px;">
						<!-- 이벤트일때 -->							
							<c:if test="${proVo.proType }=='1'">
								<button onclick="location.href='buyProgram.do'" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:150px; height:50px;padding:10px, 7px; background-color:#3366ff; font-size:12px; color:white">참가신청</button>
								<button onclick="location.href='subsRegister.do'" class="btnFilter" style="border:0.3px solid gray; border-radius:3em; outline:none; width:150px; height:50px; margin-left: 20px; padding:10px, 7px; background-color:#fff; font-size:12px; color:black">채팅문의</button>
							</c:if>

						<!-- 북클럽일때 -->							
							<c:if test="${proVo.proType }=='2'">
								<button onclick="location.href='buyProgram.do'" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:150px; height:50px;padding:10px, 7px; background-color:#3366ff; font-size:12px; color:white">참가신청</button>
								<button onclick="location.href='subsRegister.do'" class="btnFilter" style="border:0.3px solid gray; border-radius:3em; outline:none; width:150px; height:50px; margin-left: 20px; padding:10px, 7px; background-color:#fff; font-size:12px; color:black">구독하고 할인받기</button>
							</c:if>

						<!-- 교육 강의일때 -->							
							<c:if test="${proVo.proType }=='3'">
								<button onclick="location.href='buyProgram.do'" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:150px; height:50px;padding:10px, 7px; background-color:#3366ff; font-size:12px; color:white">참가신청</button>
								<button onclick="location.href='subsRegister.do'" class="btnFilter" style="border:0.3px solid gray; border-radius:3em; outline:none; width:150px; height:50px; margin-left: 20px; padding:10px, 7px; background-color:#fff; font-size:12px; color:black">채팅문의</button>
							</c:if>
							
							</div>
						</div>

					</div>
				</div>
			</div>
	

<hr>

<!-- 프로젝트 리스트 섹션!!!!!!! -->
<div class="row shuffle-wrapper portfolio-gallery">
      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat1&quot;,&quot;cat2&quot;]">
	      	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
	               <div class="doctor-img">
	               		<img src="<c:url value='https://static.wanted.co.kr/images/tags/ebfb705e.jpg'/>" alt="" class="img-fluid w-100">
	               </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">Just Do it</a></h4>
                	<p>나이스</p>
                </div> 
	      	</div>
      	</div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat2&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='https://static.wanted.co.kr/images/tags/ebfb705e.jpg'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">야 너두? 야 나두!</a></h4>
                	<p>조정석</p>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='https://static.wanted.co.kr/images/tags/ebfb705e.jpg'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">Impossible is nothing</a></h4>
                	<p>아디도다스</p>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;,&quot;cat4&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='https://static.wanted.co.kr/images/tags/ebfb705e.jpg'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">야 너두? 야 나두!</a></h4>
                	<p>조정석</p>
                </div> 
	      	</div>
      </div>
 </div>     
 <!-- 프로젝트 리스트 섹션 끝 -->
 <br>
<div style="width: 20%; margin:auto;">
<a href="<c:url value='/career/mainpage/careerMain.do'/>" target="_blank" class="btn btn-main btn-icon btn-round-full" style="background-color:#fff; outline:none; border:0.3px solid gray; border-radius:2em; color: black;">이벤트 모두 보기<i class="icofont-simple-right ml-2  "></i></a>
</div>
	</div>
	</section>


</body>
</html>