<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>

<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programJiwon.css'/>">

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

<style type="text/css">
 body{
	margin:0px;
	padding:0px;
}
.jbFixed {
     position: fixed;
     top: 0px;
}
.jbContent {
        height: 2000px;
      } 
      
.parag{
	margin-top: 50px;
	margin-bottom: 50px;      
}

.jbMenu.fixed {
 	z-index: 999;
}
#contentLoop img{
	max-width: 700px;
}
h3 {
    font-size: x-large;
    font-weight: bolder;
}

</style> 
<div class="jbMenu" style="width:100%;">
    	<nav class="navbar navbar-expand-lg navigation" id="navbar" style="background-color:#f8f8fa;">
		<div class="container" >
		 	 <div class="navbar-brand">
				<div class="myNav" style="width:100%;">
			  <ul class="navbar-nav ml-auto">
				<c:forEach var="proVo2" items="${proConList }">	
			    <li class="nav-item"><a class="nav-link" href="#title${proVo2.proConNo}">${proVo2.proTitle}</a></li>
				</c:forEach>
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
								<img src="<c:url value='/programImgUpload/${proVo.proImage }'/>"

									alt="" class="img-fluid" style="width:700px;">
				  	
								<!-- 태그넣기 -->
								<div class="sidebar-widget tags mb-3" style="margin-top:40px;">
									<span>| 키워드 </span>
									<a href="#">#WantedPlus</a> 
									<a href="#">#BookClub</a> 
									<a href="#">#자기개발</a> 
									<a href="#">#커리어성장</a> 
									<a href="#">#IT,컨텐츠</a>
									
									<span>| 유형&emsp;</span>
									<c:if test="${proVo.proType  == 1}">
										<a href="#" style="color:blue;">#이벤트</a>
									</c:if>
									<c:if test="${proVo.proType == 2}">
										<a href="#">#북클럽</a>
									</c:if>
									<c:if test="${proVo.proType == 3}">
										<a href="#">#교육·강연</a>
									</c:if>
								</div>


								<div class="blog-item-content mt-5">
									<div class="blog-item-meta mb-3" style="margin-top: -40px;"></div>

									<!-- 내용부분 전체 시작!! -->

									<div style="color: black; margin-top:30px;">
									<!-- 반복문으로 제목 내용 뿌려주기 -->						
									<!-- 제목, 내용 -->
										<c:forEach var="proVo2" items="${proConList }">	
																<a name="title${proVo2.proConNo}"></a>		
																
																<div class="parag" id="parag2" style="margin-top: 85px;">
																			<h3>${proVo2.proTitle}</h3>
																		 
																		<br>
																		<div id="contentLoop" style="width:700px; margin-top:20px;">
																			${proVo2.proContents } 
																		</div>
																</div>
										</c:forEach>
						<!-- 제목, 내용 반복문 끝!!! -->
						
									</div>
								</div>
							</div>	
						</div>
					</div>
				</div>
				
<!-- aside 부분!!!! -->				
				<div class="col-lg-4">
					<div class="sidebar-wrap pl-lg-4 mt-5 mt-lg-0" style="margin-left:-20px;">


						<div class="sidebar-widget schedule-widget mb-3" style="background-color:#fff; margin-left:-20px; margin-top:-20px; width:380px">
							<h5 class="mb-4"><b>${proVo['proName']}</b></h5>

							<ul class="list-unstyled">
							
									<div style="font:12px;"><span>일자</span></div>
									<div style="color:black; font:12px;"><span><fmt:formatDate value="${proVo.proStartDate}" pattern="yyyy-MM-dd"/></span></div><br>
									<div style="font:12px;"><span>주최자</span></div>
									<div style="color:black; font:12px;"><span>${proVo.proSponsor}</span></div>
							
							</ul>
							<br>
							<div class="sidebar-contatct-info mt-4" style="margin-top:-20px;padding-top:-10px;">

								<button onclick="location.href='<c:url value="/career/detailpage/buyProgram.do?programNo=${param.programNo }"/>'" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:150px; height:50px;padding:10px, 7px; background-color:#3366ff; font-size:12px; color:white">참가신청</button>
								<button onclick="location.href='<c:url value="/career/subscribe/subsRegister.do"/>'" class="btnFilter" style="border:0.3px solid gray; border-radius:3em; outline:none; width:150px; height:50px; margin-left: 20px; padding:10px, 7px; background-color:#fff; font-size:12px; color:black">구독하고 할인받기</button>
							
							</div>
						</div>

					</div>
				</div>
		
		<br>
	

	</div>
<hr>

							<input type="hidden" name=programNo value="${param.programNo }">
	
	<div class="container">
			<!-- 프로젝트 리스트 섹션!!!!!!! -->
			<h3>함께 보면 좋은 이벤트</h3>
		<div class="row shuffle-wrapper portfolio-gallery" style="margin:auto; margin-top: 50px;">		
	       <c:forEach var="proVoRec" items="${proVoRecList}">
		      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat2&quot;]">
		        	<div class="position-relative doctor-inner-box">
				        <div class="doctor-profile">
				        	<div class="doctor-img">
				               <img src="<c:url value='/programImgUpload/${proVoRec.proImage}'/>" alt="" class="img-fluid w-100">
				            </div>
			            </div>
		                <div class="content mt-3">
		                	<h4 class="mb-0"><a href="doctor-single.html">${proVoRec.proName}</a></h4>
		                	<p>${proVoRec.proSponsor}</p>
		                </div> 
			      	</div>
		      </div>
		   </c:forEach>
		
		 </div>     
 <!-- 프로젝트 리스트 섹션 끝 -->
	
	</div>
	</div>


 <br>
<div style="width: 20%; margin:auto;">
<a href="<c:url value='/career/mainpage/careerMain.do'/>" target="_blank" class="btn btn-main btn-icon btn-round-full" style="background-color:#fff; outline:none; border:0.3px solid gray; border-radius:2em; font-size:17px; color: black;">이벤트 모두 보기<i class="icofont-simple-right ml-2  "></i></a>
</div>
	</div>
	</section>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/6024a5279c4f165d47c223b7/1eu7ia8n9';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>