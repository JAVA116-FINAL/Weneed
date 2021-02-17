<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file="../../inc/admin_top.jsp" %>  
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
<script src="http://code.jquery.com.jquery-3.5.1.min.js"></script>
<script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>    
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

/* 메뉴bar 상단 고정 */

	
/* 유효성 검사 */	
$(function(){
	$('#proName').focus();
	
	$('form[name=proEdit1]').find('input[type=button]').click(function(){
		location.href='<c:url value="/career/Admin/programComplete1.do?programNo=${proVo.programNo}"/>';
	});
	
	$('form[name=proEdit1]').submit(function(){
		if($('#proName').val().length<1){
			alert('프로그램 이름을 입력하세요');
			$('#proName').focus();
			event.preventDefault();
		}else if($('#cateName').val()=='0'){
			alert('카테고리를 선택하세요');
			$('#cateName').focus();
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
	
<!-- 메뉴 부분!!!!! -->

<!-- 메뉴 탑부분 끝!! -->

<section class="section blog-wrap">

<div style = "width:980px; max-width: 100%; margin:auto;">
	<form name="proEdit1" action="<c:url value='/career/Admin/programEdit1.do'/>" method="post" enctype="multipart/form-data">
		
		<!--  수정시 필요한 programNo를 hidden 필드에 넣는다-->
	    <input type="hidden" name="programNo" value="${param.programNo}"/>
		
		<fieldset>
		<legend style="color:#258bf7; font-size:30px;"><b>프로그램 기본정보, 수정 페이지   &nbsp;</b><i class="fas fa-eraser fa-1x"></i></legend>
		<br>
    
			<!-- 프로그램 이름 -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 프로그램 이름: </label>
					<input type="text" class="programTitleTextField" id="proName" name="proName" value="${proVo.proName}">
		        </div>
		        
			<!-- 프로그램 카테고리 -->
			<div class="proInfoDiv" id="">	
				<label for="proCateNo">프로그램 카테고리</label>
	            <select name="proCateNo" id="proCateNo" title="카테고리" class="programTitleTextField" onchange="formChange(this.form)"">
	            	<option value="0">선택하세요</option>
	            	<!-- 반복문 시작 -->	
	            	<c:forEach var="ccgVo" items="${ccgList }">
						<c:if test="${ccgVo.proCateNo == proVo.proCateNo}">
				            	<option value="${ccgVo.proCateNo }" selected>${ccgVo.proCateName }</option>
						</c:if>
						<c:if test="${ccgVo.proCateNo != proVo.proCateNo}">
				            	<option value="${ccgVo.proCateNo }">${ccgVo.proCateName }</option>				            					
						</c:if>
					</c:forEach> 

	 				<!-- 반복문 끝 -->	         
	            </select>            
			  </div>
		        
		        
		        
			<!-- 프로그램 타입 (이벤트, 북클럽, 교육강연) -->
		        <div class="proInfoDiv">
					<label class="proWriteLabel"> 프로그램 타입: </label>
					<select name="proType" id="proType" title="프로그램 타입" class="programTitleTextField" onchange="formChange(this.form)">
						<c:if test="${proVo.proType == 1}">
							<option name="proType" value="1" selected>이벤트</option>
							<option name="proType" value="2">북클럽</option>
							<option name="proType" value="3">교육 강의</option>
						</c:if>
						<c:if test="${proVo.proType == 2}">
							<option name="proType" value="1">이벤트</option>
							<option name="proType" value="2" selected>북클럽</option>
							<option name="proType" value="3">교육 강의</option>
						</c:if>
						<c:if test="${proVo.proType == 3}">
							<option name="proType" value="1">이벤트</option>
							<option name="proType" value="2">북클럽</option>
							<option name="proType" value="3" selected>교육 강의</option>
						</c:if>

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
					<input type="text" class="programTitleTextField" id="regiEndDate" name="regiEndDate" value="${proVo.regiEndDate }">
		        </div>

			<!-- 프로그램 썸네일 이미지 url -->  
	        <div class="proInfoDiv">
						 <label for="imageUpload1" class="proWriteLabel">이미지</label><br>
						 <div class="select_img1"><img src="<c:url value='/programImgUpload/${proVo.proImage }'/>" /></div>
						 
						 <script>
						  $("#imageUpload1").change(function(){
						   if(this.files && this.files[0]) {
						    var reader = new FileReader;
						    reader.onload = function(data) {
						     $(".select_img1 img").attr("src", data.target.result).width(500);        
						    }
						    reader.readAsDataURL(this.files[0]);
						   }
						  });
						 </script>
						</div>
						
						 <label for="imageUpload" class="proWriteLabel">수정 이미지</label><br>
						 <input type="file" id="imageUpload" name="imageUpload" />
						 <div class="select_img"><img src="" /></div>
						 
						 <script>
						  $("#imageUpload").change(function(){
						   if(this.files && this.files[0]) {
						    var reader = new FileReader;
						    reader.onload = function(data) {
						     $(".select_img img").attr("src", data.target.result).width(500);        
						    }
						    reader.readAsDataURL(this.files[0]);
						   }
						  });
						 </script>
						</div>
		 		</div>
		
		     	
		    <!-- 관리자 번호는 세션에서 넘겨주기? -->        
		        <div class="proInfoDiv">
					<!-- 관리자 번호 -->
					<input type="hidden" class="" id="adminNo" name="adminNo" value="${proVo.adminNo }">
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

<%@ include file="../../inc/admin_bottom.jsp" %>  

	<!-- 캘린더 -->
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
<script type="text/javascript">
/* 캘린더 */

$(function() {
       //input을 datepicker로 선언
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd 00:00:00' //Input Display Format 변경
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

});


</script>
</body>
</html>



