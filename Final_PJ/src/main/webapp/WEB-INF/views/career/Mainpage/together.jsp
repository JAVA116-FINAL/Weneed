<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!-- font awesome 아이콘 사용을 위한 킷 https://fontawesome.com/ -->
<script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>


<section>
<div class="container">
		<div style="font-size:32px; font-weight:bold; color:#333; margin-left: 10px; margin-top:95px; margin-bottom:55px;">
			<p> 함께 보면 좋은 이벤트</p>
		</div>
		<div style="margin-top:10px;">
			<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat1&quot;,&quot;cat2&quot;]" style="float:left;">
		      	<div class="position-relative doctor-inner-box">
			        <div class="doctor-profile">
		               <div class="doctor-img">
		               		<img src="<c:url value='/resources/images/team/1.jpg'/>" alt="" class="img-fluid w-100">
		               </div>
		            </div>
	                <div class="content mt-3">
	                	<h4 class="mb-0"><a href="doctor-single.html">컴퓨터는 잘못이 없다</a></h4>
	                	<p>가나다라</p>
	                </div> 
		      	</div>
	      	</div>
	
	      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat2&quot;]" style="float:left;">
	        	<div class="position-relative doctor-inner-box">
			        <div class="doctor-profile">
			        	<div class="doctor-img">
			               <img src="<c:url value='/resources/images/team/2.jpg'/>" alt="" class="img-fluid w-100">
			            </div>
		            </div>
	                <div class="content mt-3">
	                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 코드가 문제야</a></h4>
	                	<p>가나다라</p>
	                </div> 
		      	</div>
	      </div>
	
	      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;]" style="float:left;">
	        	<div class="position-relative doctor-inner-box">
			        <div class="doctor-profile">
			        	<div class="doctor-img">
			               <img src="<c:url value='/resources/images/team/3.jpg'/>" alt="" class="img-fluid w-100">
			            </div>
		            </div>
	                <div class="content mt-3">
	                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 정신차리자</a></h4>
	                	<p>가나다라</p>
	                </div> 
		      	</div>
	      </div>
	
	      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;,&quot;cat4&quot;]" style="float:left;">
	        	<div class="position-relative doctor-inner-box">
			        <div class="doctor-profile">
			        	<div class="doctor-img">
			               <img src="<c:url value='/resources/images/team/4.jpg'/>" alt="" class="img-fluid w-100">
			            </div>
		            </div>
	                <div class="content mt-3">
	                	<h4 class="mb-0"><a href="doctor-single.html">이벤트: 맥주한잔하면서</a></h4>
	                	<p>가나다라</p>
	                </div> 
		      	</div>
	      </div>
	      
	      <div style="width: 20%; margin:auto; padding-bottom: 120px;">
	      		<button type="button" class="btn btn-main btn-icon btn-round-full" onClick="location.href='/career/Mainpage/careerMain.do'" style="background-color:#fff; outline:none; border:0.3px solid gray; border-radius:2em; color: #333;font-size: 16px; padding: 16px, 30px;">이벤트 모두 보기<i class="icofont-simple-right ml-2" style="padding-left:3px;"></i>
		  </div>
	  </div>
</div>

</section>
