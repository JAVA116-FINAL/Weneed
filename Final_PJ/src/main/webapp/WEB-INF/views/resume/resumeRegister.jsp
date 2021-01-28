<%@ include file="../inc/top.jsp" %>

<!-- 내꺼!! -->  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/resumeRegister.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>


<script type="text/javascript">
$(function(){	
	var careerNo=0;//자식 li append 할때 위치 잡기위해 필요
	var c=0;//경력카운트
	var a=0;//성과 카운트
	 $('.soltableli_jy').sortable();
	 $('.soltableli_jy').disableSelection();
	 	 	 
	 
	 //버튼 누르면 날짜정리하기!=>날짜 컬림 나눠서 수정 210126_22:50
	 //작성완료 버튼을 누르면 글자수 체크, 임시 플래그N,
	 //유효성검사, 날짜? 
	  $('.buttons_jy').click(function(){
		  if($(this).attr("id")=="btRealSave"){
				 $('#tempFlag').val("N");
			}else{
				$('#tempFlag').val("Y");
			} 
		$('form[name=frmRegister]').submit();
	 }); 

	 
	//경력추가버튼누르면
	// $('#btcareer_jy').click(function(){
	 $('.btAdd_jy').click(function(){
		 if($(this).attr("id")=="btcareer_jy"){
			 $.ajax({
				url:"<c:url value='/career/careerRegister.do'/>",
				type:"get",
				data: "resumeNo="+${resumeVo.resumeNo},
				dataType:"json",
				success:function(res){
					//alert(res);
					if(res!=null){
						$.makeForm1(res);		
					}				
				},
				error:function(xhr,status,error){
					alert(error);
				}
			});
		 }//if
		 
		 
	 });		
	
	//성과추가버튼누르면
	 $(document).on("click","#btach_jy", function(){
		 $.ajax({
				url:"<c:url value='/achievement/achievementRegister.do'/>",
				type:"get",
				data: "careerNo="+$(this).siblings('#careerNo').val(),
				dataType:"json",
				success:function(resAch){
					//alert(resAch);
					 if(resAch!=null){
						$.makeForm2(resAch);
					 }
				},
				error:function(xhr,status,error){
					alert(error);
				}
		   });
	 });
		
	//디브를 넣을까말까... 	
	 $.makeForm1=function(res){
			 var crrStr="";
			 
			 careerNo=res.careerNo;
			 crrStr+="<li class='crrLi_jy' id='crr"+careerNo+"'>";
			 //crrStr+="<form method='post' name='frmCrr' id='frmCrr'>";			 
			 crrStr+="<input type='hidden' value='"+res.careerNo+"' id='careerNo' name='crrList["+c+"].careerNo'>";
			 crrStr+="<input type='hidden' value='"+res.resumeNo+"' id='resumeNo' name='crrList["+c+"].resumeNo'>";	 
			 crrStr+="<input type='hidden' value='N' id='curEmployed"+c+"' class='realcurEmployed' name='crrList["+c+"].curEmployed'>";	 
			 crrStr+="<input class='startYear_jy' type='text' value='' placeholder='YYYY' name='crrList["+c+"].startYear'>.";
			 crrStr+="<input class='startMonth_jy' type='text' value='' placeholder='MM' name='crrList["+c+"].startMonth'>-";		 
			 crrStr+="<input class='endYear_jy' type='text' value='' placeholder='YYYY' name='crrList["+c+"].endYear'>.";		 
			 crrStr+="<input class='endMonth_jy' type='text' value='' placeholder='MM' name='crrList["+c+"].endMonth'>";		 
			 crrStr+="<input class='ckCur_jy' type='checkbox' value='' id='ckcurEmployed"+c+"' name='crrList["+c+"].ckcm' onclick='$.getCur("+c+")'>현재재직중";			 
			 crrStr+="<input class='name_jy' type='text' value='' placeholder='회사명' name='crrList["+c+"].careerName'>";
			 crrStr+="<input class='dep_jy' type='text' value='' placeholder='부서명/직책' name='crrList["+c+"].careerDep'>";
			 crrStr+="<button type='button' class='btAdd_jy' id='btach_jy'>+ 주요 성과 추가</button>"
			 //crrStr+="<button type='button' class='btDel_jy' id='btCrrDel_jy' onclick='$.del("+res.careerNo+")'> <i class='icon-close btDel-i_jy'></i></button>";
			 crrStr+="<button type='button' class='btDel_jy' id='btCrrDel_jy' onclick='$.del(\"" + res.careerNo+ "\",\"" + 'career' + "\")'> <i class='icon-close btDel-i_jy'></i></button>";
			 crrStr+="<ul id='ul2_jy"+res.careerNo+"' name='ul2_jy' class='soltableli_jy'>";
			 crrStr+="</ul'>";
			 c++;
	    	 //crrStr+="</form>";
			 crrStr+="</li>";
			 $('#ul1_jy').append(crrStr); 
		 }
	
	    $.makeForm2=function(resAch){
		var achStr="";
			 achStr+="<li id='ach"+resAch.achNo+"'>";
			// achStr+="<form method='post' name='frmAch' id='frmAch'>";
			 achStr+="<input type='hidden' value='"+resAch.achNo+"' id='achNo' name='achList["+a+"].achNo'>";
			 achStr+="<input type='hidden' value='"+resAch.careerNo+"' name='achList["+a+"].careerNo' >";
			 //achStr+="<input type='text' value='"+a+"'>";
			 achStr+="<input type='text' value='' placeholder='·주요 성과' id='achName' name='achList["+a+"].achName'>";
			 achStr+="<input class='startYear_jy' type='text' value='' placeholder='YYYY' name='achList["+a+"].startYear'>.";
			 achStr+="<input class='startMonth_jy' type='text' value='' placeholder='MM' name='achList["+a+"].startMonth'>-";		 
			 achStr+="<input class='endYear_jy' type='text' value='' placeholder='YYYY' name='achList["+a+"].endYear'>.";		 
			 achStr+="<input class='endMonth_jy' type='text' value='' placeholder='MM' name='achList["+a+"].endMonth'>";		 
			 achStr+="<textarea class='content-textArea_jy innerTA_jy' name='achList["+a+"].achDetails' value=''   placeholder='상세 업무 내용과 성과를 기입해주세요' rows='2' cols='20' ></textarea>";
			 achStr+="<button type='button' class='btDel_jy' id='btAchDel_jy' onclick='$.del(\"" + resAch.achNo+ "\",\"" + 'ach' + "\")'><i class='icon-close btDel-i_jy'></i></button>";
			 a++;
			 //achStr+="</form>"
			 achStr+="</li>"
			$('#ul2_jy'+careerNo).append(achStr);//순서대로 붙는데.. this로 받아서 그 근처 ul2_jy에 붙게 처리하고싶다.매우.. 
	   } 
	    
	    //체크박스 선택여부에 따라 밸류지정
	    $.getCur=function(c){
	    	if($('#ckcurEmployed'+c).is(":checked")){
		   		 $('#curEmployed'+c).val("Y");
		   	}else{
		   		$('#curEmployed'+c).val("N");
		   	}
	    }	  
	    
	    //버튼 누르면 삭제하기
	     $.del=function(delNo, type){   	
	    	 if(type=="career"){ 
	    		 $.ajax({
	 				url:"<c:url value='/career/careerDelete.do'/>",
	 				type:"get",
	 				data: "careerNo="+delNo/* $(this).siblings('#careerNo').val() */,
	 				dataType:"json",
	 				success:function(delcrr){
	 					//alert(delcrr);
	 					 if(delcrr>0){
	 						$('#crr'+delNo).remove();
	 					 } 
	 				},
	 				error:function(xhr,status,error){
	 					alert(error+":에러");
	 				}
	 		   });//ajax
			}else if(type=="ach"){
				 $.ajax({
		 				url:"<c:url value='/achievement/achievementDelete.do'/>",
		 				type:"get",
		 				data:"achNo="+delNo,
		 				dataType:"json",
		 				success:function(delach){
		 					//alert(delach);
		 					  if(delach>0){
		 						$('#ach'+delNo).remove();
		 					 } 
		 				},
		 				error:function(xhr,status,error){
		 					alert(error+":에러");
		 				}
		 		   });//ajax
				
			}//if 
	    }//del함수끝
	    
	   
});


</script>
<section class="resumeWriteSection_jy">
	<div class="container container_jy">
		<!-- 이력서 기본 인적사항 나중에 value바꾸기-->
		<form name="frmRegister" method="post" action="<c:url value='/resume/resumeRegister.do'/>">
			
		<div class="resume-basic-info_jy">
			<div class="resume-select-lang_jy">
				<div class="langselectBox_jy">
					<i class="icon-ic-language :before"></i>
					<select name="resumeVo.langFlag" class="realselect_jy selectLangOption">  
						<i class="icon-arrow_bottom_fill :before btselect_jy"></i>
						<option value="KR" <c:if test="${resumeVo.langFlag=='KR'}"> selected="selected"</c:if>>한국어</option> 
						<option value="EN" <c:if test="${resumeVo.langFlag=='EN'}"> selected="selected"</c:if>>English</option>
						<option value="JP" <c:if test="${resumeVo.langFlag=='JP'}"> selected="selected"</c:if>>日本語 </option> 
						<option value="CH" <c:if test="${resumeVo.langFlag=='CH'}"> selected="selected"</c:if>>繁體中文 </option> 	
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
			
			<input type="hidden" name="resumeVo.resumeNo" value="${resumeVo.resumeNo}"> 			
			<input type="hidden" name="resumeVo.memNo" value="${resumeVo.memNo}">
			<input type="hidden" id="tempFlag" name="resumeVo.tempFlag" value="${resumeVo.tempFlag}">
			<!-- 엄청크게 --> 
			<div class="reumeTitle_jy">
				<input type="text" class="title-input_jy" name="resumeVo.resumeTitle" value="${resumeVo.resumeTitle}">
			</div>
			<div class="reumeBasicInfo_jy">
				<input type="text" class="content-input_jy" name="resumeVo.resumeName" value="${resumeVo.resumeName}"><br>
				<input type="text" class="content-input_jy" name="resumeVo.resumeEmail" value="${resumeVo.resumeEmail}"><br>
				<input type="text" class="content-input_jy" name="resumeVo.resumeHp" value="${resumeVo.resumeHp}"><br>
			</div>
			<div class="resumeSubTitle_jy"> 
				<label for="resumeIntroduce">간단소개글</label><br>
			</div>
			<textarea name="resumeVo.resumeIntroduce" value="${resumeVo.resumeIntroduce}"  class="content-textArea_jy" placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)" rows="3" cols="50" ></textarea>
			<br>	
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">경력</div>
				<div class="divbtAdd_jy">
					<button type="button" id="btcareer_jy" class="btAdd_jy" >+ 추가</button>
					<!-- 값이 있다면 여기에 ul li로  list추가! -->
				 	<ul id="ul1_jy" class='soltableli_jy'>
				 		
				 	</ul>
				</div>
			</div>
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">학력</div>
				<div class="divbtAdd_jy">
					<button type="button" id="btEdu_jy"  class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			<div class="RWcomponent_jy">	
				<div class="resumeSubTitle_jy">수상 및 기타</div>
				<div class="divbtAdd_jy">
					<button  type="button" id="btAddInfo_jy" class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">외국어</div>
				<div class="divbtAdd_jy">
					<button  type="button" id="btlang_jy" class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">링크</div>
				<div class="divbtAdd_jy">
					<button  type="button" id="btlink_jy" class="btAdd_jy">+ 추가</button>
				</div>
			</div>
			
			<!-- 임시저장 누르면 tempFlag Y 저장 누르면 N-->
			<div class="btGroup_jy">	
				<input type="submit" name="btTempSave" id="btTempSave" class="buttons_jy" value="임시저장"></input>
				<button name="btRealSave" id="btRealSave" class="buttons_jy" value="작성완료">작성완료</button>
			</div>
		</form>
	</div><!-- 컨테이너 디브 -->
	
</section>		


<%-- <%@ include file="../inc/bottom.jsp" %> --%>