<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="../../inc/top.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    
  <!-- 지원 css -->
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


$(function(){
	
	$('form[name=proCompleteAll]').find('input[type=button]').click(function(){
		location.href='<c:url value="/career/Admin/programList.do"/>';
		});
	});
</script>	
	
<title>프로그램 내용 등록 페이지</title>
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
<%
	//String adminNo=request.getParameter("adminNo");
	
%>


<section class="section blog-wrap" style="margin-top: -30px;">

<div style = "width:980px; max-width: 100%; margin:auto;">
	<form name="proCompleteAll" action="<c:url value='/career/Admin/programDetail.do?proNo=${proVo.proNo}'/>" method="post">
		<fieldset>
		<legend style="color:#258bf7;"><b>프로그램 등록이 완료되었습니다!  &nbsp;&nbsp;</b><i class="fas fa-check"></i></legend>
		<p><b>프로그램 페이지 미리 보기를 원하실 경우 "미리 보기"를 클릭해주세요.</b></p>
		<br>
			<!-- 프로그램 번호 보내주기 -->
			
		   
			 	<!-- 프로그램 내용등록 미리보기 페이지/ 프로그램 목록으로 이동 버튼 -->       
			        <div>
			        	<div class="completeBox"  style="word-spacing:80px;">
							<span>  ${proVo.proNo } </span><br> 							
							<div style="margin-left:70px;">
								<button>
					        		<i class="far fa-eye fa-5x" style="color:#258bf7;"></i><br><br>
					       			<input type="submit" class="programComBtn" value="미리보기"/>
								</button>
								<button type="button" onclick="location.href='/career/Admin/programList.do'" style="outline:none;">
									<i class="fas fa-list fa-5x" style="color:#258bf7;"></i><br><br>
					      			<input type="button" class="programComBtn" value="프로그램 목록" style="width:130px;"/>
								</button>					      									
								<button type="button" onclick="location.href='/career/Admin/careerAdminMain.do'" style="outline:none;">
									<i class="fas fa-home fa-5x" style="color:#258bf7;"></i><br><br>
					      			<input type="button" class="programComBtn" value="커리어성장 메인으로" style="width:150px;"/>
								</button>					      									
								</div>
					  </div>
				        <br>

			  		</div>
			

		</fieldset>
	</form>
</div>



</section>



</body>
</html>