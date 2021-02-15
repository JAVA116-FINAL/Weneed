<%@ include file="../../inc/top.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

  <!-- 지원 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">

  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programJiwon.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	
 $('form[name=proComplete1]').find('input[type=button]').eq(0).click(function(){
	location.href='<c:url value="/career/Admin/programEdit1.do?programNo=${proVo.programNo}&adminNo=${proVo.adminNo}"/>';
	});

 $('form[name=proComplete1]').find('input[type=button]').eq(1).click(function(){
	location.href='<c:url value="/career/Admin/programWrite2.do?programNo=${proVo.programNo}"/>';
	});
}); 

</script>
<style "type="text/css">
body{
	margin:0px;
	padding:0px;
}
.fixed {
     position: fixed;
     top: 0px;
}
.subscribeBody {
 } 
 
 b{
 	color: #4b9bef;
 }
</style>
	
<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");  //userID에 해당 세션 사용자의 값을 스트링 형식으로 바꿔서 넣어줌으로써 해당 사용자의 접속 유무를 알 수 있음
	}
	%>
	
<!-- 메뉴 부분!!!!! -->

<!-- 메뉴 탑부분 끝!! -->
  
<section class="section blog-wrap" style="margin-top: -30px;">


<div style = "width:980px; max-width: 100%; margin:auto;">
	<form name="proComplete1" action="<c:url value='/career/Admin/programWrite2.do'/>" method="get">
		<fieldset>
		<legend style="color:#258bf7;"><b>프로그램 등록, 첫번째 단계 완료! &nbsp;&nbsp;</b><i class="fas fa-check fa-1x"></i></legend>
		<p><b>계속해서 두번째 단계를 완료해주세요.</b></p>
		<br>
			<!-- 프로그램 번호 보내주기 -->
			
		        <div class="proInfoDiv">
					<label class="line">
					<span class="sp1"><b>프로그램 번호: </b></span>
						<span>&emsp;${param.programNo }</span></label>		        
		        </div>

			<!-- 프로그램 이름 -->
		        <div class="proInfoDiv">
					<p class="line"><span class="sp1"><b>프로그램 이름: </b></span>
						<span>&emsp;${proVo.proName }</span>
					</p>		        
		        </div>
		        
			<!-- 프로그램 카테고리 -->
		        <div class="proInfoDiv">
					<p class="line"><span class="sp1"><b>프로그램 카테고리: </b></span>
						<span>&emsp;${proVo.proCateNo }</span>
					</p>			        
		        </div>
		        
			<!-- 프로그램 타입 (이벤트, 북클럽, 교육강연) -->
		        <div class="proInfoDiv">
					<p class="line"><span class="sp1"><b>프로그램 타입: </b></span>
								<c:if test="${proVo.proType  == 1}">
								&emsp;이벤트
								</c:if>
								<c:if test="${proVo.proType == 2}">
								&emsp;북클럽
								</c:if>
								<c:if test="${proVo.proType == 3}">
								&emsp;교육/강의
								</c:if>
						
					</p>	
		        </div>		        
		
			<!-- 주최자 -->
		        <div class="proInfoDiv">
					<p class="line"><span class="sp1"><b>주최자: </b></span>
						<span>&emsp;${proVo.proSponsor }</span>
					</p>
		        </div>
		
			<!-- 프로그램 시작일 -->
		        <div class="proInfoDiv">
				    <p class="line"><span class="sp1"> <b>프로그램 시작일: </b></span>				
						<span>
							&emsp;<fmt:formatDate value="${proVo.proStartDate }" pattern="yyyy-MM-dd"/></span>
					</p>					
		        </div>
		
			<!-- 프로그램 가격 -->
		        <div class="proInfoDiv">
				    <p class="line"><span class="sp1"> <b>프로그램 가격: </b></span>				
						<span>
							&emsp;<fmt:formatNumber value="${proVo.proPrice}" pattern="#,###"/> 원
						</span>
					</p>
		        </div>

		
			<!-- 프로그램 신청 마감일 -->
		        <div class="proInfoDiv">
				    <p class="line"><span class="sp1"> <b>프로그램 신청 마감일: </b></span>				
						<span>
							&emsp;<fmt:formatDate value="${proVo.regiEndDate }" pattern="yyyy-MM-dd"/></span>
					</p>
		        </div>
		
			<!-- 프로그램 썸네일 이미지 url -->
		        <div class="proInfoDiv">
				    <p class="line"><span class="sp1"> <b>프로그램 썸네일 이미지 url: </b></span><br>				
						<img src="<c:url value='/programImgUpload/${proVo.proImage }'/>" border="0" width="560" alt="">
					</p>
		        </div>
		     	
		    <!-- 관리자 번호는 세션에서 넘겨주기? -->        
			<!-- 관리자 번호 -->
		        <div class="proInfoDiv">
					<p class="line"><span class="sp1"> <b>관리자 번호: </b></span>
						<span>&emsp;${proVo.adminNo }</span>
					</p>
		        </div>
		        <br><br>
		 	<!-- 프로그램 내용등록 페이지로 이동 버튼 -->       
		        <div class="btnCenter">
		        <input type="button" class="programBtn" value="수정"/>
 		        <input type="button" class="programBtn" value="두번째 단계로" style="width:130px;"/>

		</fieldset>
	</form>
</div>



</section>

<%@ include file="../../inc/bottom.jsp" %>  
  