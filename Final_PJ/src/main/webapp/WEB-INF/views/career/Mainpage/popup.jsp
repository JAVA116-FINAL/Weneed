<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- 카테고리 이름, 필터, 키워드알림 부분 !!!!!!  -->
<div>${vo.CATE_NAME }</div><br>
<div class="filter" style="width: 100%; height: 70px;">
	<div style="float:left;"><button onclick="showPopup(true)" class="btnFilter" style="border:0.3px solid #d2d3d4; border-radius:0.5em; outline:none; width:150px; height:40px;padding:15px, 15px; background-color:white; font-size:11px;">
	<i class="fas fa-list"></i> 필터 및 정렬</button></div>
	<div style="float:right;"><button onclick="showPopup(true)" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:150px; height:40px;padding:10px, 7px; background-color:#3366ff; font-size:11px; color:white">
	<i class="far fa-bell"></i>	키워드 알림 신청</button></div>
</div>     



<!-- 필터 팝업창 내용  -->
<div id="popup" class="hide">
  <div class="content">
    <div style="font-size:13px; color:black; text-align:center;"><p>
		<b>필터 및 정렬</b>
    </p></div>
    <div>
    	<form action="">
    		<label id="popupB"><b>정렬</b></label><br>
    		<select style="width: 95%; margin:auto; outline:none; height: 30px; border:0.3 solid gray;">
    		<option></option>
    		</select><br>
    		<div class="popDiv">
    		<label id="popupB"><b>유형</b></label><br>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="all" style="width:0px;"/>전체
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat13" style="width:0px;"/>이벤트
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat10" style="width:0px;"/>교육
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat14" style="width:0px;"/>프로모션
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat15" style="width:0px;"/>커뮤니티
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat16" style="width:0px;"/>캠페인
		          </label><br>
		    </div>
    		<div class="popDiv">
    		<label id="popupB"><b>유/무료</b></label><br>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="all" style="width:0px;"/>전체
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat17" style="width:0px;"/>유료
		          </label>
    		 	<label class="btn">
	          	  <input type="radio" name="shuffle-filter" value="cat18" style="width:0px;"/>무료
	         	 </label><br>
    		</div>
    		<div class="popDiv">
    		<label id="popupB"><b>태그</b></label><br>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat19" style="width:0px;"/>워크샵
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat20" style="width:0px;"/>시리즈
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat21" style="width:0px;"/>100%보상
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat22" style="width:0px;"/>취업연계
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat23" style="width:0px;"/>컨퍼런스
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat24" style="width:0px;"/>세미나
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat25" style="width:0px;"/>토크
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat26" style="width:0px;"/>라이브
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat27" style="width:0px;"/>채용이벤트
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat28" style="width:0px;"/>UpSchool
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat29" style="width:0px;"/>BoolClub
		          </label>
	    		 <label class="btn">
		            <input type="radio" name="shuffle-filter" value="cat10" style="width:0px;"/>교육
		          </label><br>
		    </div>      
    	</form>
    </div>
    <div style="align-items:center;">
    <button onclick="closePopup()" style="">닫기</button>
  	</div>
  </div>
</div>
<!-- 팝업창 내용  끝-->


<!-- 키워드 팝업창 내용 -->
	<div id="popup" class="hide">
  <div class="content">
    <div style="font-size:13px; color:black; text-align:center;"><p>
		<b>필터 및 정렬</b>
    </p></div>
    <div>
    	<form action="">
    		<label id="popupB"><b>정렬</b></label><br>
    		<select style="width: 95%; margin:auto; outline:none; height: 30px; border:0.3 solid gray;">
    		<option></option>
    		</select><br>
    		<div class="popDiv">
    		<label id="popupB"><b>유형</b></label><br>
				<div class="sidebar-widget tags mb-3">
						<h5 class="mb-4">Tags</h5>
				
						<a href="#">Doctors</a>
						<a href="#">agency</a>
						<a href="#">company</a>
						<a href="#">medicine</a>
						<a href="#">surgery</a>
						<a href="#">Marketing</a>
						<a href="#">Social Media</a>
						<a href="#">Branding</a>
						<a href="#">Laboratory</a>
					</div>
				

    		<div class="popDiv">
    		<label id="popupB"><b>유/무료</b></label><br>
				<div class="sidebar-widget tags mb-3">
						<h5 class="mb-4">Tags</h5>
				
						<a href="#">Doctors</a>
						<a href="#">agency</a>
						<a href="#">company</a>
						<a href="#">medicine</a>
						<a href="#">surgery</a>
						<a href="#">Marketing</a>
						<a href="#">Social Media</a>
						<a href="#">Branding</a>
						<a href="#">Laboratory</a>
					</div>
				

    		</div>
    		<div class="popDiv">
    		<label id="popupB"><b>태그</b></label><br>
			  <div class="sidebar-widget tags mb-3">
				<h5 class="mb-4">Tags</h5>
		
				<a href="#">Doctors</a>
				<a href="#">agency</a>
				<a href="#">company</a>
				<a href="#">medicine</a>
				<a href="#">surgery</a>
				<a href="#">Marketing</a>
				<a href="#">Social Media</a>
				<a href="#">Branding</a>
				<a href="#">Laboratory</a>
			</div>

	    
		    </div>      
    	</form>
    </div>
    <div style="align-items:center;">
    <button onclick="closePopup()" style="">닫기</button>
  	</div>
  </div>
</div>


<!-- 키워드 팝업창 내용  끝-->
<!-- 필터, 키워드알림 부분 끝  -->
    