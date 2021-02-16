<%@ include file="../../inc/admin_top.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  

    
  <!-- 지원 css -->
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programJiwon.css'/>">

<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>    
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>

<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>


<body>
	<%
		String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");  //userID에 해당 세션 사용자의 값을 스트링 형식으로 바꿔서 넣어줌으로써 해당 사용자의 접속 유무를 알 수 있음
	}
	%>
	

<%
	//String adminNo=request.getParameter("adminNo");
	
%>


<section class="section blog-wrap">

<div style = "width:980px; max-width: 100%; margin:auto;">
	<form name="proCompleteAll" action="<c:url value='/career/Admin/programDetail.do?programNo='/>" method="get">
		<fieldset>
		<legend style="color:#258bf7;"><b>프로그램 등록이 완료되었습니다!  &nbsp;&nbsp;</b><i class="fas fa-check"></i></legend>
		<p><b>프로그램 페이지 미리 보기를 원하실 경우 "미리 보기"를 클릭해주세요.</b></p>
		<br>
			<!-- 프로그램 번호 보내주기 -->
			
			 	<!-- 프로그램 내용등록 미리보기 페이지/ 프로그램 목록으로 이동 버튼 -->       
			        <div>
			        	<div class="completeBox"  style="word-spacing:80px;">
							<span>   </span><br> 							
							<div style="margin-left:70px;">
								<button type="button" onclick="location.href='<c:url value="/career/Admin/programDetail.do?programNo=${param.programNo }"/>'" style="cursor:pointer; outline:none; border:none; background-color:transparent;">
					        		<i class="far fa-eye fa-5x" style="color:#258bf7;"></i><br><br>
					       			<input type="button" class="programComBtn" value="미리보기"/>
								</button>
								<button type="button" onclick="location.href='<c:url value="/career/Admin/programAdminList.do"/>'" style="cursor:pointer; outline:none; border:none; background-color:transparent;">
									<i class="fas fa-list fa-5x" style="color:#258bf7;"></i><br><br>
					      			<input type="button" class="programComBtn" value="프로그램 목록" style="width:130px;"/>
								</button>					      									
								<button type="button" onclick="location.href='<c:url value="/career/Admin/careerAdminMain.do"/>'" style="cursor:pointer; outline:none; border:none; background-color:transparent;">
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