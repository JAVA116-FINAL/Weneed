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
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">

    
    
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
<div class="jbMenu" style="width:100%; opacity:1;">
    	<nav class="navbar navbar-expand-lg navigation" id="navbar" style="background-color:#f8f8fa;">
		<div class="container" >
		 	 <div class="navbar-brand">
				<div class="myNav" style="width:100%;">
			  <ul class="navbar-nav ml-auto">
			  <li class="nav-item active"><a class="nav-link" href="<c:url value='/career/Admin/programWrite.do'/>">프로그램 등록</a></li>
			   <li class="nav-item"><a class="nav-link" href="<c:url value='/career/Admin/programAdminList.do'/>">프로그램 조회</a></li>
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

<section class="section blog-wrap" style="margin-top:-30px;">


<div style = "width:980px; max-width: 100%; margin:auto;">
	<form name="proWrite2" action="<c:url value='/career/Admin/programCompleteAll.do?proNo=${proVo.proNo}'/>" method="post">
		<fieldset>
		<legend style="color:#258bf7;"><b>프로그램 등록, 두번째 단계   &nbsp;</b><i class="far fa-folder-open" ></i></legend>
		<p><b>총 7가지의 구분이 가능합니다! </b></p>		
		<br>
		        
		
			<!-- 제목1 내용1 -->
				<div class="programBodyContents2" style="margin-top:-3px;">
					<label proWriteLabel> 첫번째: </label>
					<input type="text" class="programTitleTextField" id="proTitle1" name="proTitle1" placeholder="첫번째 목차의 제목을 적어주세요">
					<textarea id = "description1" name = "description1" class="description" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요"></textarea> 
				</div>
			
			<!-- 제목2 내용2 -->
				<div class="programBodyContents2">
					<label proWriteLabel> 두번째: </label>
					<input type="text" class="programTitleTextField" id="proTitle2" name="proTitle2" placeholder="첫번째 목차의 제목을 적어주세요">
					<textarea id = "description2" name = "description2" class="description" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요"></textarea> 
				</div>
			
			<!-- 제목3 내용3 -->
				<div class="programBodyContents2">
					<label proWriteLabel> 세번째: </label>
					<input type="text" class="programTitleTextField" id="proTitle3" name="proTitle3" placeholder="첫번째 목차의 제목을 적어주세요">
					<textarea id = "description3" name = "description3" class="description" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요"></textarea> 
				</div>
			
			<!-- 제목4 내용4 -->
				<div class="programBodyContents2">
					<label proWriteLabel> 네번째: </label>
					<input type="text" class="programTitleTextField" id="proTitle4" name="proTitle4" placeholder="첫번째 목차의 제목을 적어주세요">
					<textarea id = "description4" name = "description4" class="description" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요"></textarea> 
				</div>
			
			<!-- 제목5 내용5 -->
				<div class="programBodyContents2">
					<label proWriteLabel> 다섯번째: </label>
					<input type="text" class="programTitleTextField" id="proTitle5" name="proTitle5" placeholder="첫번째 목차의 제목을 적어주세요">
					<textarea id = "description5" name = "description5" class="description" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요"></textarea> 
				</div>
			
			<!-- 제목6 내용6 -->
				<div class="programBodyContents2">
					<label proWriteLabel> 여섯번째: </label>
					<input type="text" class="programTitleTextField" id="proTitle6" name="proTitle6" placeholder="첫번째 목차의 제목을 적어주세요">
					<textarea id = "description6" name = "description6" class="description" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요"></textarea> 
				</div>
				
			<!-- 제목7 내용7 -->
				<div class="programBodyContents2">
					<label proWriteLabel> 일곱번째: </label>
					<input type="text" class="programTitleTextField" id="proTitle7" name="proTitle7" placeholder="첫번째 목차의 제목을 적어주세요">
					<textarea id = "description7" name = "description7" class="description" rows = "5" cols = "80" placeholder = "상품설명을 입력하세요"></textarea> 
				</div>
				
		 	<!-- 프로그램 내용2 등록 페이지로 이동 버튼 -->       
		        <div class="btnCenter">
		        <input type="submit" class="programBtn" value="등록하기"/>
		        </div>
		        
		</fieldset>
	</form>
</div>



<script type="text/javascript">
CKEDITOR.replace("description1");
CKEDITOR.replace("description2");
CKEDITOR.replace("description3");
CKEDITOR.replace("description4");
CKEDITOR.replace("description5");
CKEDITOR.replace("description6");
CKEDITOR.replace("description7");


CKEDITOR.config.width = '100%';   // CSS unit (percent).
CKEDITOR.config.height = '450px';   // CSS unit (percent).

CKEDITOR.replace("descriptionImg",{

	//CKEDITOR.replace와 id("description")를 잘 적어주면 그 태그가 smart editor 스타일로 바뀌게 된다. 
	 
	    filebrowserUploadUrl : "${path}/imageUpload.do"

	//파일을 업로드 해야하기 때문에 filebrowserUploadUrl을 사용하고, 서버쪽에 코드를 완성해주어야 한다.

	});
</script>
</body>
</html>