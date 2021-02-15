<%@ include file="../../inc/admin_top.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<jsp:useBean id="today" class="java.util.Date"/>

	<!-- 지원 css -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programJiwon.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/js/jquery-ui.min.css'/>"> 

    
    <!-- ck에디터 -->
	<script src="//cdn.ckeditor.com/4.15.1/full/ckeditor.js"></script>
<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>    
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">



</script>

	
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



<div style = "width:980px; max-width: 100%; margin:auto;">
	<form name="proWrite2" action="<c:url value='/career/Admin/programWrite2.do'/>" method="post">
		<fieldset>
		<legend style="color:#258bf7; font-size:22px;"><b>프로그램 등록, 두번째 단계   &nbsp;</b><i class="far fa-folder-open" ></i></legend>
		<p><b>총 7가지의 구분이 가능합니다! </b></p>		

									<input type="text" name="programNo" value="${param.programNo }">								
			<!-- 제목, 내용 -->

 			<div style="margin-top:-50px;">
				<c:forEach var="i" begin="1" end="7" step="1">
								<div class="programBodyContents2" style="margin-top:80px;">
									<input type="text" name="proVo2List[${i-1}].programNo" value="${param.programNo }">								
									<input type="text" name="proVo2List[${i-1}].proConNo" value="${i}">								
									<label for="proConNo" id="proConNo" style="color:#258bf7; font-size:18px;"> ${i}번째: </label>
									<input type="text" class="programTitleTextField" id="proTitle" name="proVo2List[${i-1}].proTitle" placeholder="첫번째 목차의 제목을 적어주세요">
									<textarea id = "proContents${i}" class="description" name = "proVo2List[${i-1}].proContents" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요">
										<div>
										
										</div>
									</textarea>
									<br> 
								</div>
				</c:forEach>



<%-- 
								<div class="programBodyContents2" style="margin-top:80px;">
									<input type="text" name="proVo2List[0].programNo" value="${param.programNo }">								
									<input type="text" name="proVo2List[0].proConNo" value="1">								
									<label for="proConNo" id="proConNo" style="color:#258bf7; font-size:18px;"> 1번째: </label>
									<input type="text" class="programTitleTextField" id="proTitle" name="proVo2List[0].proTitle" placeholder="첫번째 목차의 제목을 적어주세요">
									<textarea id = "proContents1" class="description" name = "proVo2List[0].proContents" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요">
										<div>
										
										</div>
									</textarea>
									<br> 
								</div>


		 --%>						


		 	<!-- 프로그램 내용2 등록 페이지로 이동 버튼 -->       
		        <div class="btnCenter">
		        <input type="submit" class="programBtn" value="등록하기"/>
		        </div>
		        
		</fieldset>
	</form>
</div>



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

CKEDITOR.replace("descriptionImg",{

	//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
	 
	    filebrowserUploadUrl : "${path}/imageUpload.do"

	//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.

	});
</script>
<%@ include file="../../inc/admin_bottom.jsp" %>  
