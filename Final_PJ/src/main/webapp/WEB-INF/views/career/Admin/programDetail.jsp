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

<style "type="text/css">
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
								<img
									src="<c:url value='/programImgUpload/${proVo.proImage }'/>"
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


<%-- 				  	<c:forEach var="proVo2" items="${proConList }">				  	
										<!-- 제목, 내용 1 -->

										<div class="parag" id="parag1">
											<a name="title"><h3>
													<b>${proVo2.proTitle }</b>
												</h3></a> <br>
											<div>${proVo2.proContents }</div>

									 	</div>
					</c:forEach> 
					--%>
					
					

			<!-- 반복문으로 제목 내용 뿌려주기 -->
									
										<!-- 제목, 내용 -->
				<c:forEach var="proVo2" items="${proConList }">	
										<a name="title${proVo2.proConNo}"></a>		
										<br><br>	
										<div class="parag" id="parag2" style="margin-top: 50px;">
										<label>${proVo2.proConNo}번째</label>
											
													<b>${proVo2.proTitle}</b>
												 
												<br>
												<div id="contentLoop" style="width:700px;">
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
					<div class="sidebar-wrap pl-lg-4 mt-5 mt-lg-0" >


						<div class="sidebar-widget schedule-widget mb-3" style="background-color:#fff; margin-left:-60px; margin-top:-20px; width:380px">
							<h5 class="mb-4"><b>${proVo['proName']}</b></h5>

							<ul class="list-unstyled">
							
									<div style="font:12px;"><span>일자</span></div>
									<div style="color:black; font:12px;"><span><fmt:formatDate value="${proVo.proStartDate}" pattern="yyyy-MM-dd"/></span></div><br>
<!-- 									<div style="font:12px;"><span>장소</span></div>
									<div style="color:black; font:12px;"><span>세종 S씨어터</span></div><br> -->
									<div style="font:12px;"><span>주최자</span></div>
									<div style="color:black; font:12px;"><span>${proVo.proSponsor}</span></div>
							
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


 <br>
			<div style="margin:auto; text-align:center;">
							<input type="hidden" name=programNo value="${param.programNo }">
				
							<div style="text-align:center";>
								<button type="button" class="programComBtn" onclick="location.href='/career/Admin/programEdit1.do?programNo=${param.programNo}'" style="outline:none;">수정</button>					      									
								<button type="button" class="programComBtn" onclick="location.href='/career/Admin/programAdminList.do'" style="outline:none;">프로그램 목록</button>					      									
								<button type="button" class="programComBtn" onclick="location.href='/career/Admin/programDelete.do?programNo=${param.programNo}'" style="outline:none; width:160px;">삭제</button>					      									
							</div>
			</div>
	</div>
	</section>



</body>
</html>
