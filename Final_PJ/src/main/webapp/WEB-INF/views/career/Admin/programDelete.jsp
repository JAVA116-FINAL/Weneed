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
		$('form[name=proDelete]').submit(function(){
			if($('#pwd').val().length<1){
				alert('비밀번호를 입력하세요');
				$('#pwd').focus();
				event.preventDefault();
			}else if(!confirm('삭제하시겠습니까?')){
				event.preventDefault();
			}
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
			  <li class="nav-item active"><a class="nav-link" href="#title">프로그램 등록</a></li>
			   <li class="nav-item"><a class="nav-link" href="#title1">프로그램 조회</a></li>
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
	<form name="proDelete" action="<c:url value='/career/Admin/programDelete.do'/>" method="post">
		<fieldset>
		<legend style="color:#258bf7;"><b>프로그램 삭제  &nbsp;&nbsp;</b><i class="fas fa-trash-alt"></i></legend>
		<p><b>한번 삭제된 프로그램은 다시 불러올 수 없습니다.</b></p>
		<br>
			<!-- 프로그램 번호 보내주기 -->
			
		    <div class="deleteBox">
	
				<!-- 프로그램 이름 -->
			        <div>
			        	<div class="delLine">
							<span> " ${proVo.proNo } " </span><span style="color:gray;"> 번 프로그램을</span><br> 							
							<br>
							<div>정말로 삭제하시겠습니까?</div>		        
			        	</div>
				        <br>
				      
				        
				       <div style="text-align:center;">           
				           <label for="pwd">비밀번호</label>
				           <input type="password" id="pwd" name="pwd" style="height:30px;"/>   
			      	  </div>
			  		</div>
			
	           
			 	<!-- 프로그램 내용등록 페이지로 이동 버튼 -->       
			        <div class="btnDelCenter">
			       		<input type="submit" class="programBtn" value="삭제"/>
			      		<input type="button" class="programBtn" value="글목록" OnClick="location.href='<c:url value="/career/Admin/programList.do"/>'" />
			        </div>
		        
		  </div>
		        

		</fieldset>
	</form>
</div>



</section>



</body>
</html>