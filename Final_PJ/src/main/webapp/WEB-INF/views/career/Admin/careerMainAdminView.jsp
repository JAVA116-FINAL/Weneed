<%@ include file="../../inc/admin_top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <!-- 커리어성장 카테고리메뉴 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
    
  <!-- 커리어성장 필터 팝업창 css -->
	<!-- 커리어성장 카테고리메뉴 제이쿼리 -->
	<script type="text/javascript" src="<c:url value='/resources/code.jquery.com/jquery-1.11.0.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/code.jquery.com/jquery-migrate-1.2.1.min.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/plugins/slick-carousel/slick/slick.min.js'/>"></script>

<style type="text/css">
.slick-prev{
	height:50px;
	margin-bottom:17px;
	margin-top:-25px;
	background-color:#eef0f4;
}
.slick-next{
	height:50px;
	margin-bottom:17px;
	margin-top:-25px;	
	background-color:#eef0f4;
}
.slick-prev slick-arrow{
}
._2bqGiY6XO2ke3gSGZbbVm3 {
    position: relative;
    background-color: #fff;
    background-position: center;
    background-repeat: no-repeat;
    background-size: auto 300px;
    border-radius: 3px;
    -webkit-box-shadow: inset 0 0 2px 0 rgba(0, 0, 0, 0.1);
    box-shadow: inset 0 0 2px 0 rgba(0, 0, 0, 0.1);
    height: 300px;
}
._2LiFavTzcqjq8ansnAqKSQ {
    background-color: #f1f2f3;
    background-size: cover;
    background-position: center center;
    position: relative;
}

.cateButton{
	border:0.3px solid #75D5F3;
	border-radius:0.5em;
	background-color:#fff;
	color:#75D5F3;
	font-size:14px;
	font-weight:bold;
	max-width: 80%;
	height:25px;
	padding:0 4px;
	margin-bottom:10px;
}
.slick-list {
    height: 100px;
}
.col-12.text-center.mb-5 {
    background-color: #f8f8fa;
}
.doctors .btn-group .btn {
    border-radius: 0.3em;
    margin: 0px 6px;
    text-transform: capitalize;
    font-size: 16px;
    padding: .6rem 0.1rem;
    background: #eef0f4;
    color: #000000;
    height: 50px;
    width: 250px;
    margin-bottom: -19px;
    cursor: pointer;
}
.asideBtn{
	cursor:pointer; 
	outline:none; 
	border:none; 
	background-color:transparent;
}
</style>


<script type="text/javascript">
/* 커리어성장 카테고리메뉴 */

  $(document).ready(function(){
    $('.btn-group').slick({
    	slide: 'label',		//슬라이드 되어야 할 태그 ex) div, li 
		infinite : true, 	//무한 반복 옵션	 
		slidesToShow : 8,		// 한 화면에 보여질 컨텐츠 개수
		slidesToScroll : 5,		//스크롤 한번에 움직일 컨텐츠 개수
		speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
		arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
		dots : false, 		// 스크롤바 아래 점으로 페이지네이션 여부
		pauseOnHover : true,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
		vertical : false,		// 세로 방향 슬라이드 옵션
		prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
		nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
		draggable : false, 	//드래그 가능 여부 
    });
  });

  
</script>


<div>
	<!-- 구독신청 배너부분!!!!!!!!! -->
			<section class="page-title bg-1" style="padding:0px; margin:auto; margin-left:-210px;width:1500px;">
			<div class="_2LiFavTzcqjq8ansnAqKSQ _2bqGiY6XO2ke3gSGZbbVm3" style="padding-bottom: 10%;cursor:pointer;" 
						onclick="location.href='<c:url value="subscription.do"/>'"><img src="<c:url value='/resources/images/career/Web_Event_Banner_C3.jpg'/>" style="height: 300px;max-width: 100%; width: 100%;"></div>
			</section>
	<!-- 구독신청 배너부분 끝  -->



<!-- 슬라이드 메뉴부분!!!!!!!!! -->
					<section class="section doctors" style="margin-top: -30px;">
						<div class="container">
							<div class="row">
							 	<div class="careerMenu" style="width:100%; height: 70px; background-color: #fff; ">				
									<div class="col-12 text-center mb-5">
										<div class="btn-group btn-group-toggle " data-toggle="buttons" >
							 
							          <!-- <label class="btn active " >
								            <input type="radio" name="shuffle-filter" value="all" checked="checked" style="width:0px;"/>전체
								          </label>	 -->						          
							          	
							          	<c:forEach var="proCateBtn" items="${proCateNameList}">
							          		<c:if test="${proCateBtn.proCateNo == 0 }">
								         		<label class="btn active " >
									            <input type="radio" name="shuffle-filter" value="all" checked="checked" style="width:0px;"/>전체
									          	</label>								          		
							          		</c:if>
							          		<c:if test="${proCateBtn.proCateNo != 0 }">
											  <label class="btn">
									            <input type="radio" name="shuffle-filter" value="cate${proCateBtn.proCateNo}" style="width:0px;"/>${proCateBtn.proCateName}
									          </label>
								          	</c:if>
										</c:forEach>

								          
								        </div>
									
										</div>
									</div>
								
								
<!-- 슬라이드 메뉴부분 끝  -->

      
				<!-- 카테고리 이름, 필터, 키워드알림 부분 !!!!!!  -->
					<div style="width: 100%; height: 50px; margin-top:30px; margin-bottom:40px;">
						<%@ include file="../Mainpage/popup.jsp" %>	    
					</div>
				<!-- 필터, 키워드알림 부분 끝  -->
				<aside style="float right;">
						<div class="asideBtn" style="float:right; position:fixed; margin-left:1150px; margin-top:-170px;">
								<div class="">
									<button type="button" onclick="location.href='<c:url value="/career/Mainpage/careerMain.do"/>'" title="커리어성장 관리자 메인으로">
										<i class="fas fa-home fa-3x" style="color:#258bf7;"></i><br><br>
									</button>
								</div>
								<div>
									<button type="button" onclick="location.href='<c:url value="/career/Admin/programAdminList.do"/>'" title="프로그램 목록">
										<i class="fas fa-list fa-3x" style="color:#258bf7;"></i><br><br>
									</button>
								</div style="float:left; margin-left:-10px;">						      									
					</div>
				</aside>



				<!-- 프로젝트 리스트 섹션!!!!!!! -->
     				
			      <div class="row shuffle-wrapper portfolio-gallery" style="margin:auto; margin-top: -20px;">		
			 		<c:forEach var="proVoMain" items="${proVoMainList }">		 					
					      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cate${proVoMain.proCateNo}&quot;]">		      
					        	
					        	<div class="position-relative doctor-inner-box" onclick="location.href='<c:url value="/career/detailpage/detailPage.do?programNo=${proVoMain.programNo}"/>'" 
					        								style="cursor:pointer; border:0.3px solid rgb(198, 198, 198); border-radius:0.4em; height:405px;">
							        <div class="doctor-profile">
							        	<div class="doctor-img" style="height:180px;border-bottom:0.3px solid rgb(198, 198, 198);">				        	
							               <img src="<c:url value='/programImgUpload/${proVoMain.proImage }'/>" alt="${proVoMain.proImage }" class="img-fluid w-100" style="width:100%; height: 100%;background-size: cover;">
							            </div>
						            </div>
					                <div class="content mt-3" style="padding:0px 15px 15px 15px;">
					                	<!-- 카테고리 이름 리스트 -->
					                	<c:forEach var="proCate" items="${proCateNameList}">      			
	 				                			<c:if test="${proCate.proCateNo == proVoMain.proCateNo }"> 
					                	<button class="cateButton">${proCate.proCateName}</button>
					                			</c:if>
										</c:forEach>
					                							                
						                	<div style="height:50px;"><h2 style="font-size:22px; color:#4D4A4A; font-weight:bold;">${proVoMain.proName}</h2></div><br>
						                	<h3>${proVoMain.proSponsor}</span><span>${proVoMain.programNo }</h3>
						                	<h4 style="color:#8B9193; font-weight:bold;"><fmt:formatDate value="${proVoMain.proStartDate}" pattern="yyyy-MM-dd"/></p>
												<c:if test="${proVoMain.proType  == 1}">
													<p style="color:#9370DB;">#이벤트</p>
												</c:if>
												<c:if test="${proVoMain.proType == 2}">
													<p style="color:#6495ED;">#북클럽</p>
												</c:if>
												<c:if test="${proVoMain.proType == 3}">
													<p style="color:#DA70D6;">#교육·강연</h4>
												</c:if>						
					                </div> 
						      	</div>
					      </div>
				</c:forEach>
			   </div>
      		</div>		
      				
	<!-- 프로젝트 리스트 섹션 끝 --> 
		</div>

</section>

</div>







<!-- 푸터부분!!!!! -->
	<%@ include file="../../inc/admin_bottom.jsp" %>


    
  </body>
  </html>
