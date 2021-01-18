<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>
<div class="jbMenu">
    	<nav class="navbar navbar-expand-lg navigation" id="navbar" style="background-color:#f8f8fa;">
		<div class="container" >
		 	 <div class="navbar-brand">
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
		
	</nav>
		</div>
	
<body>

	<section class="section blog-wrap">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="row">
						<div class="col-lg-12 mb-5">
							<div class="single-blog-item">
								<img src="<c:url value='/resources/images/blog/blog-1.jpg'/>"
									alt="" class="img-fluid">

								<div class="blog-item-content mt-5">
									<div class="blog-item-meta mb-3">
										<span class="text-color-2 text-capitalize mr-3"><i
											class="icofont-book-mark mr-2"></i> Equipment</span> <span
											class="text-muted text-capitalize mr-3"><i
											class="icofont-comment mr-2"></i>5 Comments</span> <span
											class="text-black text-capitalize mr-3"><i
											class="icofont-calendar mr-2"></i> 28th January 2019</span>
									</div>

									<h2 class="mb-4 text-md">
										<a href="blog-single.html">Healthy environment to care
											with modern equipment</a>
									</h2>
									<div style="height: 300px;">
										<a name="title"><h4>북클럽 소개</h4></a>
									</div>
									<p class="lead mb-4">Non illo quas blanditiis repellendus
										laboriosam minima animi. Consectetur accusantium pariatur
										repudiandae!</p>

									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Possimus natus, consectetur? Illum libero vel nihil nisi
										quae, voluptatem, sapiente necessitatibus distinctio
										voluptates, iusto qui. Laboriosam autem, nam voluptate in
										beatae. Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Quae iure officia nihil nemo, repudiandae itaque
										similique praesentium non aut nesciunt facere nulla, sequi
										sunt nam temporibus atque earum, ratione, labore.</p>

									<blockquote class="quote">A brand for a company is
										like a reputation for a person. You earn reputation by trying
										to do hard things well.</blockquote>


									<p class="lead mb-4 font-weight-normal text-black">The same
										is true as we experience the emotional sensation of stress
										from our first instances of social rejection ridicule. We
										quickly learn to fear and thus automatically.</p>

									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Iste, rerum beatae repellat tenetur incidunt quisquam
										libero dolores laudantium. Nesciunt quis itaque quidem,
										voluptatem autem eos animi laborum iusto expedita sapiente.</p>



									<div style="height: 300px;">
										<a name="title2">이번 북글럽 소개</a>
									</div>

									<div style="height: 300px;">
										<a name="title3">프로그램 상세</a>
									</div>
									<div style="height: 300px;">
										<a name="title4">클럽장 소개</a>
									</div>
									<div style="height: 300px;">
										<a name="title5">참가비용</a>
									</div>
									<div style="height: 300px;">
										<a name="title6">후기</a>
									</div>
									<div style="height: 300px;">
										<a name="title1">안내/설문</a>
									</div>

						
								</div>
							</div>

						</div>



					</div>
				</div>
				<div class="col-lg-4">
					<div class="sidebar-wrap pl-lg-4 mt-5 mt-lg-0" >


						<div class="sidebar-widget schedule-widget mb-3" style="background-color:#fff; margin-left:-20px; width:380px">
							<h5 class="mb-4">북클럽: 작가는 아니지만 글은 쓰고싶어</h5>

							<ul class="list-unstyled">
								<li class="d-flex justify-content-between align-items-center">
									<a href="#">일자</a> <span>2021 Jan 16</span>
								</li>
								<li class="d-flex justify-content-between align-items-center">
									<a href="#">장소</a> <span>세종 S씨어터</span>
								</li>
								<li class="d-flex justify-content-between align-items-center">
									<a href="#">주최자</a> <span>-</span>
								</li>
							</ul>
							<br><br><br>
							<div class="sidebar-contatct-info mt-4">
								<button onclick="showPopup(true)" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:150px; height:40px;padding:10px, 7px; background-color:#3366ff; font-size:11px; color:white">
	<i class="far fa-bell"></i>	참가신청</button>
	<button onclick="showPopup(true)" class="btnFilter" style="border:0.3px solid gray; border-radius:3em; outline:none; width:150px; height:40px;padding:10px, 7px; background-color:#fff; font-size:11px; color:black">
	<i class="far fa-bell"></i>	구독하고 할인받기</button>
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
	               		<img src="<c:url value='/resources/images/team/1.jpg'/>" alt="" class="img-fluid w-100">
	               </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">Thomas Henry</a></h4>
                	<p>Cardiology</p>
                </div> 
	      	</div>
      	</div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat2&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/team/2.jpg'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">Harrision Samuel</a></h4>
                	<p>Radiology</p>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/team/3.jpg'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">Alexandar James</a></h4>
                	<p>Dental</p>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;,&quot;cat4&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/team/4.jpg'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">Edward john</a></h4>
                	<p>Pediatry</p>
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


<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
$( document ).ready( function() {
    var jbOffset = $( '.jbMenu' ).offset();
    $( window ).scroll( function() {
      if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '.jbMenu' ).addClass( 'jbFixed' );
      }
      else {
        $( '.jbMenu' ).removeClass( 'jbFixed' );
      }
    });
  } );
</script>

<style="type="text/css">
body{
	margin:0px;
	padding:0px;
}
.jbFixed {
     position: fixed;
     top: 0px;
}
</style>

</body>
</html>