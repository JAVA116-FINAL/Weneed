<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="../../inc/top.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    
	<!-- 지원 css -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programJiwon.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery-ui.min.css'/>"> 
	<!-- 캘린더 -->	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">  
    <!-- ck에디터 -->
	<script src="//cdn.ckeditor.com/4.15.1/full/ckeditor.js"></script>
	
	<!-- 메뉴 -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

/* 메뉴bar 상단 고정 */
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
	

	
/* 유효성 검사 */	
$(function(){
	$('#proName').focus();
	

	
	$('form[name=proEdit1]').submit(function(){
		if($('#proName').val().length<1){
			alert('프로그램 이름을 입력하세요');
			$('#proName').focus();
			event.preventDefault();
		}else if($("input[name=cateName]:checkbox").is(':checked')==false){
			alert('카테고리를 선택하세요');
			location.href="#cateName";
			event.preventDefault();
		}else if($('#proType').val()=='0'){
			alert('프로그램 타입을 선택하세요');
			$('#proType').focus();
			event.preventDefault();
		}else if($('#proStartDate').val().length<1){
			alert('프로그램 시작일은 언제인가요?');
			$('#proStartDate').focus();
			event.preventDefault();
		}else if($('#proPrice').val().length<1){
			alert('프로그램 가격은요?');
			$('#proPrice').focus();
			event.preventDefault();
		}else if($('#regiEndDate').val().length<1){
			alert('프로그램 신청 마감일은 언제인가요?');
			$('#regiEndDate').focus();
			event.preventDefault();
		}else if($('#imgUrl').val()==''){
			alert('프로그램 썸네일 이미지는 필수입니다!');
			$('#imgUrl').focus();
			event.preventDefault();
		}			
	});
	
});
</script>

	
<title>프로그램 기본정보 수정 페이지</title>
<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>
</head>
<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");  //userID에 해당 세션 사용자의 값을 스트링 형식으로 바꿔서 넣어줌으로써 해당 사용자의 접속 유무를 알 수 있음
	}
	%>
	
<!-- 메뉴 부분!!!!! -->
<div class="jbMenu" style="width:100%;">
    	<nav class="navbar navbar-expand-lg navigation" id="navbar" style="background-color:#f8f8fa;">
		<div class="container" >
		 	 <div class="navbar-brand">
				<div class="myNav" style="width:100%;">
			  <ul class="navbar-nav ml-auto">
			  <li class="nav-item active"><a class="nav-link" href="<c:url value='/career/Admin/programWrite.do'/>">프로그램 등록</a></li>
			   <li class="nav-item"><a class="nav-link" href="<c:url value='/career/Admin/programList.do'/>">프로그램 조회</a></li>
			    <li class="nav-item"><a class="nav-link" href="#title2">Wanted+ 조회</a></li>
			    <li class="nav-item"><a class="nav-link" href="#title3">Notice</a></li>				
			    <a name="title"></a>   
			  </ul>	
			</div>
			</div>
		</div>
		</nav>
</div>
<!-- 메뉴 탑부분 끝!! -->


<!-- 프로그램 전체 수정 시작!!!!! -->
<section class="section blog-wrap" style="margin-top:-30px;">
	<div style = "width:980px; max-width: 100%; margin:auto;">

		<!-- 첫번째파트 폼 (program)테이블 부분 수정 -->
			<form name="proEditTotal" action="<c:url value='programEditTotal.do'/>" method="post">
				
		<!--  수정시 필요한 programNo를 hidden 필드에 넣는다-->
		
		<fieldset>
		<legend style="color:#258bf7;"><b>프로그램 내용, 수정 페이지   &nbsp;</b><i class="fas fa-eraser fa-1x"></i></legend>
		<br>
    			
									    <input type="text" name="programNo" value="${param.programNo}"/>
		<!-- 프로그램 두번째 파트 (proContents)테이블 부분 수정!!! -->
			<!-- 반복문으로 제목 내용 뿌려주기 -->
	 			<div style="margin-top:-50px;">




				<c:forEach var="proVo2" items="${proConList }">	
										<a name="title${proVo2.proConNo}"></a>		
										<br><br>			
										  <input type="text" name="proVo2List[${proVo2.proConNo-1}].programNo" value="${param.programNo}"/>
										  <input type="text" name="proVo2List[${proVo2.proConNo-1}].proConNo" value="${proVo2.proConNo}"/>
										
										<div class="parag" id="parag2" style="margin-top: 50px;">
										<label>${proVo2.proConNo}번째</label><br>
											<input type="text" class="programTitleTextField" id="proTitle" name="proVo2List[${proVo2.proConNo-1}].proTitle" value="${proVo2.proTitle }">
											<textarea id = "proContents${proVo2.proConNo}" class="description" name = "proVo2List[${proVo2.proConNo-1}].proContents" rows = "5" cols = "80">
										<div>
										${proVo2.proContents}
										</div>
									</textarea>
										</div>	
				</c:forEach>


	 									
										<!-- 제목, 내용 -->
<%-- 				<c:forEach var="proVo2" items="${proConList }">	
										<a name="title${proVo2.proConNo}"></a>		
										<br><br>
										<input type="text" name="proVo2List[${proVo2.proConNo}].programNo" value="${param.programNo }">								
										<input type="text" name="proVo2List[${proVo2.proConNo}].proConNo" value="${i}">		
										<div class="parag" id="parag2" style="margin-top: 50px;">
										<label>${proVo2.proConNo}번째</label>
											<input type="text" class="programTitleTextField" id="proTitle" name="proVo2List[${proVo2.proConNo}].proTitle" placeholder="첫번째 목차의 제목을 적어주세요" value="${proVo2.proTitle }">
									<textarea id = "proContents${proVo2.proConNo}" class="description" name = "proVo2List[${proVo2.proConNo}].proContents" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요">
										<div>
										${proVo2.proContents}
										</div>
									</textarea>
										</div>
				</c:forEach> --%>
<!-- 제목, 내용 반복문 끝!!! -->		
		<!-- 프로그램 두번째 파트 (proContents)테이블 부분 수정 끝!!! -->
	
	
		<!-- 페이지 이동 버튼 -->       
			    <div class="btnCenter" style="margin-top:80px;">
			       <input type = "submit" class="programBtn" value="저장"/>
				   <input type = "button" onclick="location.href='programAdminList.do'" class="programBtn" value="목록으로" />         
			       <input type="button" onclick="location.href='programDelete.do?proNo=${proVo.programNo}'" class="programBtn" value="삭제"/>
		        </div>

		</fieldset>
	</form>


</div>
</section>

<%@ include file="../../inc/bottom.jsp" %>  

	<!-- 캘린더 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
<script type="text/javascript">

CKEDITOR.replace("proContents1");
CKEDITOR.replace("proContents2");
CKEDITOR.replace("proContents3");
CKEDITOR.replace("proContents4");
CKEDITOR.replace("proContents5");
CKEDITOR.replace("proContents6");
CKEDITOR.replace("proContents7");


CKEDITOR.config.width = '100%';   // CSS unit (percent).
CKEDITOR.config.height = '450px';   // CSS unit (percent).


</script>
</body>
</html>



