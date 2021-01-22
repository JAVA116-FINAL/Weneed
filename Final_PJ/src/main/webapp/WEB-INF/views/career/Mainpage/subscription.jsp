<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/top.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
.fixed {
     position: fixed;
     top: 0px;
}
.subscribeBody {
 } 
</style>

<title>Wanted Plus: 무제한으로 즐기는 직군별 커리어 콘텐츠</title>
</head>
<body>


<!-- 구독권신청 탑 부분!!!!! -->
<div class="jbMenu" style="width:100%; background-color:#f8f8fa;">
    	<nav class="navbar navbar-expand-lg navigation" id="navbar" style="background-color:#f8f8fa;">
		<div class="container" style="background-color:#f8f8fa;">
		 	 <div class="navbar-brand" style="width:100%; background-color:#f8f8fa;">
				<div class="myNav">
			  <ul class="navbar-nav ml-auto">
			  <li class="nav-item active"><a class="nav-link" href="#title">Home</a></li>
			   <li class="nav-item"><a class="nav-link" href="#title1">Benefits</a></li>
			    <li class="nav-item"><a class="nav-link" href="#title2">Plan</a></li>
			    <li class="nav-item"><a class="nav-link" href="#title3">Notice</a></li>				
			    <a name="title"></a>   
				<button onclick="location.href='/career/subscribe/subsRegister.do'" class="btnFilter" style="margin-left:500px; border:none; border-radius:3em; outline:none; width:160px; height:50px;padding:0px, 7px; background-color:#3366ff; font-size:14px; color:white"><b>3개월권 구독</b></button>
				<button onclick="location.href='<c:url value='/career/subscribe/subsRegister.do'/>'" class="btnFilter" style="border:0.3px solid blue; border-radius:3em; outline:none; width:160px; height:50px; margin-left: 20px; padding:0px, 7px; background-color:#fff; font-size:14px; color:black"><b>6개월권 구독</b></button>
			  </ul>	
			</div>
			</div>
		</div>
		</nav>
</div>
<div style="width:100%; height: 100px; background-color:#f8f8fa;">
	<div style="width: 100%; font-size: 24px; text-align:center; color: black;float:left; margin-top:40px; margin-bottom:20px; "><p>결제 완료 후 상단 메뉴 모음 'MY 원티드'에 들어가면, 바로 영상 시청이 가능합니다</p></div>
</div>

<!-- 구독권 신청 탑부분 끝!! -->

<!-- 몸통부분!!! -->
<div class="subscribeBody">
	<img alt="https://static.wanted.co.kr/images/temp/f5c32b52.jpg" src="https://static.wanted.co.kr/images/temp/f5c32b52.jpg" class="campus-recruit-img" style="width:100%;">
</div>

<div style="background-color:black; text-align:center">
	<iframe width="920" height="550" src="https://www.youtube.com/embed/IdJC_uxblVI?rel=0;autoplay=1;playsinline=1;" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen="" ></iframe>
</div>

<!-- Benefits 섹션 -->
<div>
	<img alt="https://static.wanted.co.kr/images/events/1012/5c990abe.jpg" src="https://static.wanted.co.kr/images/events/1012/5c990abe.jpg" class="campus-recruit-img" style="width:100%;">
</div>
<a name="title1"></a>

<div>
	<img alt="https://static.wanted.co.kr/images/events/1012/85b26153.png" src="https://static.wanted.co.kr/images/events/1012/85b26153.png" class="campus-recruit-img" style="width:100%;">
</div>


<div>
	<img alt="https://static.wanted.co.kr/images/events/1012/958ea27f.jpg" src="https://static.wanted.co.kr/images/events/1012/958ea27f.jpg" class="campus-recruit-img" style="width:100%;">
</div>
<div>
	<img alt="https://static.wanted.co.kr/images/events/1012/10014943.png" src="https://static.wanted.co.kr/images/events/1012/10014943.png" class="campus-recruit-img" style="width:100%;">
</div>

<div>
	<img alt="https://static.wanted.co.kr/images/events/1012/13fbd062.jpg" src="https://static.wanted.co.kr/images/events/1012/13fbd062.jpg" class="campus-recruit-img" style="width:100%;">
</div>
<a name="title2"></a>

<!-- 이용권 (Plan) 섹션 -->
<div>
	<img alt="https://static.wanted.co.kr/images/events/1012/04a2ac8e.png" src="https://static.wanted.co.kr/images/events/1012/04a2ac8e.png" class="campus-recruit-img" style="width:100%;">
<a name="title3"></a>
</div>

<!-- 안내사항 (Notice) 섹션 -->

<div>
	<img alt="https://static.wanted.co.kr/images/temp/560d0fad.png" src="https://static.wanted.co.kr/images/temp/560d0fad.png" class="campus-recruit-img" style="width:100%;">	
</div>


<!-- 함께보면 좋은 이벤트 부분!!!! -->
<div style="width: 100%; height: 300px; margin-top:30px; margin-bottom:40px;">
	<%@ include file="together.jsp" %>
</div>


</body>
</html>