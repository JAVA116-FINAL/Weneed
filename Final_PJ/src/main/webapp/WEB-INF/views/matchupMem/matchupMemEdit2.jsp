<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 내꺼!! -->  
<!-- 리스트기반 에딧고쳐서 꼭 같이 있어야 함 -->
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemList.css'/>"> 
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemRegister.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemRegister2.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>

<script type="text/javascript">
$(function(){
	setDateBox();
	
	$.getCur=function(){
    	if($('#ckcurEmployed').is(":checked")){//현재재직중
	   		 $('#curEmployed').val("Y");
    		 $.dateSetToday();	
	   	}else{
	   		$('#curEmployed').val("N");
	   	}
    }
	
	//현재재직중을 누르면 오늘날짜로 셋팅을한다.
	$.dateSetToday=function(){
		var today=new Date();
		var year=today.getFullYear();
		var month=(today.getMonth()+1);
		 $("#year2").val(year);
		 $("#month2").val(month);
	}
	
	//스킬-모달 닫을 때 스킬 인풋에 셋팅
	$('#btEduModal_jy').click(function(){
		//alert($('#eduNameModal_jy').val());
		$('#eduName').val($('#eduNameModal_jy').val());
	});	
	$('#btCareerModal').click(function(){
		//alert($('#careerinput_jy').val());
		$('#careerName').val($('#careerinput_jy').val());
	});	
	
	/*
	keyDown이벤트 넣으면 모달 input이 잘안됨
	$("#eduNameModal_jy").keydown(function(e){
		event.preventDefault();
		if(e.keyCode == 13) $('#eduName').val($('#eduNameModal_jy').val()); 
	}); 

	$("#careerinput_jy").keydown(function(e){
		event.preventDefault();
		if(e.keyCode == 13) $('#careerName').val($('#careerinput_jy').val()); 
	});  */

//전~송! 누르면 날짜체크 year.month year2.month2보다 이전인지 2번이 오늘날짜보다 뒤인지
	$('#frmMcuEdit2').submit(function(){
		if($('#eduName').val()==""){
			alert("학교명을 입력하세요. 작성할 학교명이 없는 경우 없음으로 작성해주세요");
			event.preventDefault();
		}else if($('#careerName').val()==""){
			alert("회사명을 입력하세요. 작성할 회사명이 없는 경우 없음으로 작성해주세요");
			event.preventDefault();
		}else if($("#year option:selected").val()!=""){
			if($("#year option:selected").val()>$("#year2 option:selected").val()){
				alert("종료일이 시작일보다 먼저일 수 없습니다.");
				event.preventDefault();
			}else if($("#year option:selected").val()==$("#year2 option:selected").val()){
				if($("#month option:selected").val()>$("#month2 option:selected").val()){
					alert("종료일이 시작일보다 먼저일 수 없습니다.");
					event.preventDefault();
				}
			}
		}//날짜
		//글자수 체크하고 인풋에 넣기
		var count=0;
		var list = new Array();
		$("input[type=text]").each(function(index, item){
			count+=$(item).val().length;
		});
		count+=$('#taIntro_jy').val().length;
		$('#resumeLength_jy').val(count);			
		//alert(count);
		
	});//submit!!
	  
});//jquery

function setDateBox() {
    var dt = new Date();
    var year = "";
    var com_year = dt.getFullYear();//올해년도

    // 년도 
    $("#year").append("<option value=''>YYYY</option>");
    $("#year2").append("<option value=''>YYYY</option>");

    // 올해 기준 -50년부터 +1년을 보여준다.
    for (var y = (com_year - 50); y <= (com_year + 1); y++) {
       $("#year").append("<option value='" + y + "'>" + y + "</option>");
      $("#year2").append("<option value='" + y + "'>" + y + "</option>"); 
    }

    // 월 (1월부터 12월)
    var month;
    $("#month").append("<option value=''>MM</option>");
    $("#month2").append("<option value=''>MM</option>");
    for (var i = 1; i <= 12; i++) {
      $("#month").append("<option value='" + i + "'>" + i + "</option>");
      $("#month2").append("<option value='" + i + "'>" + i + "</option>");
    }
    
    $('#year').val(${crrVo.startYear});
    $('#month').val(${crrVo.startMonth});
    $('#year2').val(${crrVo.endYear});
    $('#month2').val(${crrVo.endMonth});
     
    
}
</script>
<section class="section doctor-single machupSection_jy">
	<div class="container machupContainer1_jy">
		<div class="row machupRow_jy">
<!-- 프로필구역 -->		
			<aside class="col-lg-3 col-md-6 machupAside_jy" >
				<!-- 프로필상자, 사진업로드?-->
				<div class="profileTitle-dt_jy">프로필</div>
				<div class="profileblock_jy">
					<header class="profileHeader_jy">
						<div class="member-img_jy" style='background-image: url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png"), url("https://static.wanted.co.kr/images/profile_default.png")'>
						 <!-- 폼은 어디갔니 -->
							<input class="inputimg_jy" type="file" accept="image/*">
							<i class="icon-camera_icon camerai_jy"></i> 
						</div>
						<div class="asideMe_jy">
							<div class="asideName_jy">${memVo.name}</div>
							<div class="asideMail_jy">${memVo.email}</div>
							<div class="asideHp_jy">${memVo.hp}</div>
						</div>
						<button type="button" class="btEdit_jy" value="기본정보수정" onClick="location.href='<c:url value="#"/>'">기본정보 수정</button>
					</header>
					<div class="info-block mt-4 infoblock_jy">
						<a href="#" class="profileInfo-a_jy">
							<span class="spWant_jy">원해요</span>
							<strong class="wantCount_jy">0</strong>
						</a>
						<a href="#" class="profileInfo-a_jy">
							<span class="spOpen_jy">열람</span>
							<strong class="openCount">0</strong>
						</a>
						<a href="#" class="profileInfo-a_jy">
							<span class="spSuggest">받은제안</span>
							<strong class="suggestCount">0</strong>
						</a>
					</div>
				</div>
			</aside>		

			<div class="col-lg-9 col-md-6 machupWrapperdiv_jy">
				<div class="doctor-details mt-4 mt-lg-0 machupinner_jy">
				<form id="frmMcuEdit2" class="appoinment-form" method="post" action="<c:url value='/matchupMem/matchupMemEdit2.do'/>">
					<div class="machupSection_jy">
							<%-- <input type="hidden" name="mcumemVo.mcumemNo" value="${mcuVo.mcumemNo}"> --%>					
							<input type="hidden" name="resumeVo.memNo" value="${resumeVo.memNo}">		 		
							<input type="hidden" name="resumeVo.resumeNo" value="${resumeVo.resumeNo}">		 		
							<input type="hidden" id="resumeLength_jy" name="resumeVo.resumeLength" value="${resumeVo.resumeLength}">	 		
							<header class="form-header_jy">	
								<dl class="form-title_jy">
									<dt class="machupTitle-dt_jy">학교·직장등록</dt>
									<dd class="infoIcon_dd_jy"><a class="infoIcon_a_jy" href="<c:url value='/matchupMem/matchupMemIntro.do'/>"> 매치업 서비스 소개</a><i class="icon-info_icon infoIcon_jy"></i></dd>
								</dl>
							</header>	
						
							<div class="divformblock-contents_jy">
								<div class="ectbtgroup_jy">
									<div class="formButton_jy">
										<h6 class="formButton-label_jy mcuEditsal_jy">학교</h6>
							<!-- 학교 -->
										<div class="spSalary_jy divEdu_jy" id="divEdu_jy">
											<input type="hidden" name="eduVo.eduNo" id="eduNo" value="${eduVo.eduNo}">
											<input type="text" name="eduVo.eduName" id="eduName" placeholder="학교명 입력" readonly="readonly" value="${eduVo.eduName}">
										</div>
										<button type="button" class="btselect_jy mcuEditbtSelect_jy1"  data-toggle="modal" data-target="#eduModal">
											<i class="icon-arrow_right :before arrowIcon_jy"></i>
										</button>
									</div>
								
									<div class="formButton_jy">
										<h6 class="formButton-label_jy exceptconOption_jy mcuEditskil_jy">직장</h6>
							<!-- 직장 -->	
										<span class="spSkills_jy" id="spSkills_jy">
											<input type="hidden" name="careerVo.careerNo"  id="careerNo" value="${crrVo.careerNo }">
											<input type="text" name="careerVo.careerName"  id="careerName" placeholder="직장명입력" readonly="readonly" value="${crrVo.careerName}">
											<button type="button" class="btselect_jy mcuEditbtSelect_jy" data-toggle="modal" data-target="#careerModal">	
												<i class="icon-arrow_right :before arrowIcon_jy"></i>
											</button>
														
											<span class="periodAria_jy">
												<select name="careerVo.startYear" id="year" title="시작년도" class="custom-select"></select>.
												<select name="careerVo.startMonth" id="month" title="시작월" class="custom-select"></select>-
												<select name="careerVo.endYear" id="year2" title="종료년도" class="custom-select"></select>.
												<select name="careerVo.endMonth" id="month2" title="종료월" class="custom-select"></select>
											</span>
											<span class="spckbox_jy">
												<label for="ckcurEmployed">
													<input type="checkbox" name="ckcurEmployed" <c:if test="${crrVo.curEmployed eq 'Y'}">checked="checked"</c:if> id="ckcurEmployed" onClick="$.getCur()"> 현재 재직중
												</label>
												<input type='hidden' value='${crrVo.curEmployed }' id='curEmployed' class='realcurEmployed' name='careerVo.curEmployed'>
											</span>
										</span>
									</div>
									<div class="formButton_jy">
										<h6 class="formButton-label_jy exceptconOption_jy mcuEditskil_jy simpleIntroTitle_jy">간단소개글</h6>
										<p class="tooltipP_jy">직무내용, 경험, 목표 등을 추가해서 더욱 멋진 소개글을 작성해 보세요</p>
							<!-- 간단소개글 -->	
										<span class="spInroduce_jy">
											<textarea  id="taIntro_jy"class="taIntroduce_jy" rows="5" cols="50" name="resumeVo.resumeIntroduce"></textarea>
										</span>
									</div>
									
						<!-- 모달1 학교 -->
									<div class="modal fade modalOuter_jy" id="eduModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
										<div class="modal-dialog modalDialog_jy"  role="document">
											<div class="modal-content modalContent_jy">
												<div class="modal-header modalHeader_jy">
													<h5 class="modal-title modalTitle_jy" id="modalLabel_jy">학교입력</h5>
													<button type="button" class="close btCloseModal_jy" id="btEduModal_jy" data-dismiss="modal" aria-label="Close"> 
														<span class="closeIcon_jy" aria-hidden="true">x</span>
													</button>
												</div>
												<div class="modal_body modalBody_jy">
													<div class="modalbodyinnderDiv_jy">
														</div>
														<div class="MosaldivInput_jy">
															<i class="icon-search"></i>
															<input type="hidden" value="">
															<input type="text" name="eduNameModal_jy" id="eduNameModal_jy" placeholder="학교명을 입력해주세요" value="">
														</div>
													</div>
												</div>
											</div>
										</div>
									 <!-- 모달디브 -->
								<!-- 모달2 직장-->
									<div class="modal fade modalOuter_jy" id="careerModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
										<div class="modal-dialog modalDialog_jy"  role="document">
											<div class="modal-content modalContent_jy">
												<div class="modal-header modalHeader_jy">
													<h5 class="modal-title modalTitle_jy" id="modalLabel_jy">직장입력</h5>
													<button type="button" class="close btCloseModal_jy" id="btCareerModal" data-dismiss="modal" aria-label="Close"> 
														<span class="closeIcon_jy" aria-hidden="true">x</span>
													</button>
												</div>
												<div class="modal_body modalBody_jy">
													<div class="modalbodyinnderDiv_jy">
														<div class="modalDivSelect1_jy">
															<div class="skillinputDiv">																	
																<i class="icon-search"></i>
																<input type="hidden" value="">
																<input type="text" name="careerinput_jy" id="careerinput_jy" placeholder="회사명을 입력해주세요" value="" >
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div> <!-- 모달디브 -->
								</div>
								
								<div class="machupMemEdit-btOk_jy mcuRegisterdiv">
									<button type="submit" class="btMachupEdit_jy mcuRegisterbt" >
										<span class="spbtText">수정완료</span>
									</button>
								</div> 
							</div>
						</div>
					</form> 	
				</div>
			</div> <!-- aside옆 Maindiv -->
		</div><!-- row -->
	</div><!-- container -->
		
</section>