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
	
	$('form[name=proEdit1]').find('input[type=button]').click(function(){
		location.href='<c:url value="/career/Admin/programComplete1.do?proNo=${proVo.proNo}"/>';
	});
	
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

<section class="section blog-wrap" style="margin-top:-30px;">

<div style = "width:980px; max-width: 100%; margin:auto;">
	<form name="proEdit1" action="<c:url value='programComplete1.do?proNo=${pro.proNo }'/>" method="post">
		
		<!--  수정시 필요한 proNo를 hidden 필드에 넣는다-->
	    <input type="hidden" name="proNo" value="${param.proNo}"/>
		
		<fieldset>
		<legend style="color:#258bf7;"><b>프로그램 기본정보, 수정 페이지   &nbsp;</b><i class="fas fa-eraser fa-1x"></i></legend>
		<br>
    
			<!-- 프로그램 이름 -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 프로그램 이름: </label>
					<input type="text" class="programTitleTextField" id="proName" name="proName" value="${proVo.proName}">
		        </div>
			<!-- 프로그램 카테고리 -->
		        <div class="proInfoDiv" id="cateName">
					<label id="cateName" class="proWriteLabel"> 프로그램 카테고리: </label><br><br>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="인사">인사</a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="Wanted Plus"> Wanted Plus </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="커리어"> 커리어 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="경영·비즈니스"> 경영·비즈니스 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="기술/IT"> 기술/IT </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="마케팅·광고"> 마케팅·광고 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="크리에이티브"> 크리에이티브 </a></label><br>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="디자인"> 디자인 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="리더십"> 리더십 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="교육"> 교육 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="UX"> UX </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="데이터"> 데이터 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="브랜딩"> 브랜딩 </a></label>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="개발"> 개발 </a></label> 
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="핀테크"> 핀테크 </a></label> 
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="건강"> 건강 </a></label><br>
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="금융"> 금융 </a></label> 
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="영어"> 영어 </a></label> 
					<label><a><input type="checkbox" class="cateCheckBox" name="cateName" value="고객서비스·리테일"> 고객서비스·리테일 </label> 
		        </div>
		        
			<!-- 프로그램 타입 (이벤트, 북클럽, 교육강연) -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 프로그램 타입: </label>
					<select name="proType" id="proType" title="프로그램 타입" class="programTitleTextField">
						<option value="${proVo.proType}" selected></option>
						<option value="0">프로그램 타입을 선택해주세요</option>
						<option name="proType" value="1">이벤트</option>
						<option name="proType" value="2">북클럽</option>
						<option name="proType" value="3">교육 강의</option>
					
	
			<!-- 반복문 돌려서 프로그램 타입 뿌려주기 -->
		<!-- 참고하기 -->
			<%--       
		      	<c:forEach var="cgVo" items="${cgList }">
					<option value="${cgVo.categoryNo}">
						${cgVo.categoryName }</option>
				</c:forEach>   
			--%>	
			<!-- 반복문 끝 -->	
					
					</select>
		        </div>		        
		
		
			<!-- 주최자 -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 주최자: </label>
					<input type="text" class="programTitleTextField" id="proSponsor" name="proSponsor" value="${proVo.proSponsor}">
		        </div>
		
			<!-- 프로그램 시작일 -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 프로그램 시작일: </label>
					<input type="text" class="programTitleTextField" id="proStartDate" name="proStartDate" value="${proVo.proStartDate}">
		        </div>
		
			<!-- 프로그램 가격 -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 프로그램 가격: </label>
					<input type="text" class="programTitleTextField" id="proPrice" name="proPrice" value="${proVo.proPrice}">
		        </div>
		
			<!-- 프로그램 신청 마감일 -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 프로그램 신청 마감일: </label>
					<input type="text" class="programTitleTextField" id="regiEndDate" name="regiEndDate" value="${proVo.regiEndDate}">
		        </div>
		
			<!-- 프로그램 썸네일 이미지 url -->  
		        <div class="proInfoDiv">
					<label for="imgUrl" class="proWriteLabel"> 프로그램 썸네일 이미지 url: </label><br>
					<input type="file" class="" id="imgUrl" name="imgUrl" value="${proVo.imgUrl}">
		        </div>
		
		     	
		    <!-- 관리자 번호는 세션에서 넘겨주기? -->        
		        <div class="proInfoDiv">
					<!-- 관리자 번호 -->
					<input type="hidden" class="" id="adminNo" name="adminNo">
		        </div>
		        
		 	<!-- 프로그램 내용등록 페이지로 이동 버튼 -->       
		        <div class="btnCenter" style="margin-top:120px;">
		            <input type = "submit" class="programBtn" value="저장"/>
		            <input type = "Button" class="programBtn" value="취소" />         
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
/* 캘린더 */

$(function() {
       //input을 datepicker로 선언
	$.datepicker.setDefaults({
			dateFormat: 'yy-mm-dd' //Input Display Format 변경
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
           ,changeYear: true //콤보박스에서 년 선택 가능
           ,changeMonth: true //콤보박스에서 월 선택 가능          
           ,showOn: "focus" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
           ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
           ,minDate: "+1D" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
       });                    	
       
		$("#proStartDate").datepicker();
		$("#regiEndDate").datepicker();

       //초기값을 오늘 날짜로 설정
            $('#proStartDate').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)   });

});


</script>
</body>
</html>



