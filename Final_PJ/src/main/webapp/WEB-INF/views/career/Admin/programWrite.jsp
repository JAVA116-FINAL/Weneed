<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="../../inc/top.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    
  <!-- 지원 css -->

  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programJiwon.css'/>">

    
    
    <!-- ck에디터 -->
	<script src="//cdn.ckeditor.com/4.15.1/full/ckeditor.js"></script>

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

	
<title>Insert title here</title>
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

<section class="section blog-wrap">

<div style = "width:980px; max-width: 100%; margin:auto;">
<form action="projectDetail.do?proNo=" method="post">

<!-- 프로젝트 이름 -->
<label> 프로젝트 이름: </label>
<input type="text" class="programTitleTextField" id="proTitle1" name="proTitle1" placeholder="첫번째 목차의 제목을 적어주세요">


<label> 제목 1: </label>
<input type="text" class="programTitleTextField" id="proTitle1" name="proTitle1" placeholder="첫번째 목차의 제목을 적어주세요">
<textarea id = "description" name = "description" rows = "5" cols = "80"
placeholder = "상품설명을 입력하세요"></textarea> <!-- //이런 textarea가 있을때 주로 스마트에디터를 많이 사용 -->
</div>
</form>





</section>

<%@ include file="../../inc/bottom.jsp" %>  

<script type="text/javascript">
CKEDITOR.replace("description");
</script>
</body>
</html>



