<%@ include file="../inc/top.jsp" %>

<!-- 내꺼!! -->  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/resumeRegister.css'/>">
<script type="text/javascript">


$(function(){
	$('.btAdd_jy').click(function(){		
		var $plusUl=$("<ul>",{});
		var $plusli=$("<li>",{});
		var $form=$("<form>",{});
		var $div1=$("<div class='col-sm3 divblock1_jy'>",{});
		var $div2=$("<div class='col-sm9 divblock2_jy'>",{});

		$form.attr('action',"<c:url value='#'/>");
		 $form.attr('method','post');
		 
		 $form.append("<input type='hidden' value='' name='careerNo'>");
		 
	 	 $form.append("<input class='startYear_jy' type='text' value='' placeholder='YYYY'  name='startYear'>.");
		 $form.append("<input class='startMonth_jy' type='text' value='' placeholder='MM'  name='startMonth'>-");		 
		 $form.append("<input class='endYear_jy' type='text' value='' placeholder='YYYY'  name='endYear'>.");		 
		 $form.append("<input class='endMonth_jy' type='text' value='' placeholder='MM'  name='endMonth'>");		 
		 $form.append("<input class='ckCur_jy' type='checkbox' value='' name='carEmployed'>현재재직중");
		 
		 
		 $form.append("<input class='name_jy' type='text' value='' placeholder='회사명' name='carrerName'>");
		 $form.append("<input class='dep_jy' type='text' value='' placeholder='부서명/직책' name='carrerDep'>");
		 
		 $form.append("<button  type='button' class='btAdd_jy'>+ 주요 성과 추가</button>");
		 
	     
	     $plusUl.append($plusli);
	     $plusli.append($form);
	  
		$(this).after($plusUl);
		
	});
	
});

</script>
<section class="resumeWriteSection_jy">
	<div class="container container_jy">
	
		<div class="resume-basic-info_jy">
			<div class="resume-select-lang_jy">
				<div class="langselectBox_jy">
					<i class="icon-ic-language :before"></i>
					<select name="selectLangOption" class="realselect_jy">  
						<i class="icon-arrow_bottom_fill :before btselect_jy"></i>
						<option>한국어</option> 
						<option>English</option>
						<option>日本語 </option> 
						<option>繁體中文 </option> 	
					</select>
				</div>
			
			</div>
			
			<!--
			1. 이력서 새로 작성하기를 누르면 바로 insert
			2. 추가 누르면 바로 항목으로 인서트 
			 -->		
		
			<button class="btResume-down_jy" type="button" data-reactid=".0.0.0.0.0.0.0.1.0">
				<i class="icon-download" > </i>
			</button>
		
		</div>
		<!-- 이력서 기본 인적사항 나중에 value바꾸기-->
		<form name="frmRegister" method="post" action="<c:url value='/resume/resumeRegister.do'/>">
			
			<input type="hidden" name="reumeNo" value="1"> 			
			<input type="hidden" name="memNo" value="1">
			
			<!-- 엄청크게 --> 
			<div class="reumeTitle_jy">
				<input type="text" class="title-input_jy" name="resumeTitle" value="이력서 제목 1">
			</div>
			
			<div class="reumeBasicInfo_jy">
				<input type="text" class="content-input_jy" name="resumeName" value="이름"><br>
				<input type="text" class="content-input_jy" name="resumeEmail" value="이메일"><br>
				<input type="text" class="content-input_jy" name="resumeHp" value="휴대폰"><br>
			</div>
			
			<div class="resumeSubTitle_jy"> 
				<label for="resumeIntroduce">간단소개글</label><br>
			</div>
			<textarea name="resumeIntroduce" value="간단소개"  class="content-textArea_jy" placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)" rows="3" cols="50" ></textarea>
			<br>	
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">경력</div>
				<div class="divbtAdd_jy">
					<button type="button" id="btcareer_jy" class="btAdd_jy">+ 추가</button>
					
				</div>
			</div>
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">학력</div>
				<div class="divbtAdd_jy">
					<button type="button" class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			
			<div class="RWcomponent_jy">	
				<div class="resumeSubTitle_jy">수상 및 기타</div>
				<div class="divbtAdd_jy">
					<button  type="button" class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">외국어</div>
				<div class="divbtAdd_jy">
					<button  type="button" class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">링크</div>
				<div class="divbtAdd_jy">
					<button  type="button" class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			
			<!-- 임시저장 누르면 tempFlag Y 저장 누르면 N-->
			<div class="btGroup_jy">	
				<input type="button" class="buttons_jy" name="btTempSave" value="임시저장"></input>
				<button name="btRealSave" class="buttons_jy" value="작성완료">작성완료</button>
			</div>
			
		</form>
	</div><!-- 컨테이너 디브 -->
</section>		


<%-- <%@ include file="../inc/bottom.jsp" %> --%>