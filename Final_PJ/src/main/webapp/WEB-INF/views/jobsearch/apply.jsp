<!-- 내꺼!! -->  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/jobsearchApply.css'/>">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	//파일 업로드 a링크 클릭하면 인풋태그가 클릭되고, 
	$('#btUpfile').click(function(){
		$('#upfile').trigger("click");	
	});	
	//인풋파일 상태가 변경되면 파일업로드 ajax	
	$('#upfile').change(function(){
	
		if($('#upfile').val().length<1){	
			alert('업로드할 파일을 선택하세요');
			return false;
		}
		
			var form = $('#frmUpfile')[0];
	 	var formData = new FormData(form);// FormData 객체 생성
		
		  $.ajax({
			url:"<c:url value='/resume/resumefileUpload.do'/>",
			type:"POST",
			dataType:"json",
			data:formData,
			processData: false,
			contentType: false,
			cache: false,
			success:function(resUp){
				//alert(resUp);
				
				var resumeStr="";
				
				resumeStr+="<li class='li-apply_jy'>";
				resumeStr+="<div class='ap-done_jy'>";
				resumeStr+="<label for='resume_No_jy'>";
				resumeStr+="<input type='checkbox' id='resum_No_jy' name='resumeNo' value='"+resUp.resumeNo+"'>";
				resumeStr+="<i class='icon-icon_match_list_save iconSave_jy :before'></i>";
				resumeStr+="</label>";
				resumeStr+="<div class='ap-resumInfo_jy'>";
				resumeStr+="<h4 class='ap-resumInfoTitleh4_jy'>";
				resumeStr+="<p class='ap-resumName_jy'>"+resUp.resumeTitle+"</p>";
				resumeStr+="</h4>";
				resumeStr+="<div class='ap-resumeRegisterInfo_jy'>";
				resumeStr+="<span class='ap-resumedate_jy'>"+resUp.resumeRegdate+"</span>";
				resumeStr+="<span class='ap-fileFlag_jy :after'>첨부파일</span>";
				resumeStr+="</div>";
				resumeStr+="</div>";
				resumeStr+="</div>";	
				resumeStr+="</li>";
				
				$('#ulResumeList').append(resumeStr);
		
				
			},
			error:function(xhr,status,error){
				alert("error!:"+error);
			}
		}); //ajax
		
	});//change이벤트
	
	$('.ckResumeSave').click(function(){
		//alert($(this).val());
		if($(this).prop('checked')){
			$('.ckResumeSave').prop('checked',false);
			$(this).prop('checked',true);
		}
	}); 
 	
	$('#byApplySubmit').click(function(){
		//체크박스 없으면 얼럿
		//alert($('input:checkbox[name=resumeNo]:checked').length);
		if($('input:checkbox[name=resumeNo]:checked').length<1){
			alert('제출할 이력서를 선택하세요!');
			event.PreventDefault();
		}
		
		$('#frmApply').submit();
	});
	
	
});
	
</script>

<!-- <aside class="col-lg-4 asideApply_jy" style="margin-left:-30px;" id="asideApply">  -->
	<div class="outerdiv-apply_jy">
		
		<header class="header-apply_jy">
			<h2 class="h2-apply_jy">지원하기</h2>
			<!-- <button type="button" class="btback-apply_jy" onclick="$.backbt()">뒤로</button> -->
		</header>
			
		<div id="modaldiv_jy">
			<div class="applyinfo_jy">
				<form action="<c:url value='/jobsearch/apply.do'/>" method="post" name="frmApply" id="frmApply">					
					<h3 class="h3-apply_jy">지원정보</h3>
						<%-- 포지션번호 넣기! <input type="hidden" name="posNo" value="${posNo}"> --%>
						<input type="hidden" name="posNo" value="27">
						<input type="hidden" name="memNo" value="${memVo.memNo }">
					<div class="infotmation_jy">
						<label for="name" class="lb-apply_jy">
							<h4 class="lbName-apply_jy">이름</h4>
							<input type="text" name="applyName" value="${memVo.name }">
						</label>
						<label for="email" class="lb-apply_jy">
							<h4 class="lbName-apply_jy">이메일</h4>
							<input disabled type="text" name="email" value="${memVo.email}">
						</label>
						<div class="lb-apply_jy">
							<h4 class="lbName-apply_jy">연락처</h4>
							<input type="text" name="applyHp" value="${memVo.hp }">
							<!-- <button type="button" class="hasmobile_jy">
								+8201092534565
								<i class="icon-arrow_right :before"></i>
							</button> -->
						</div>
					</div>
					<div class="lb-apply_jy">
						<h4 class="lbName-apply_jy">추천인</h4>
						<input type="text" name="refName" value="" placeholder="선택사항">
						<button type="button" class="selectOptionbt_jy" >
							<i class="icon-arrow_right arrowicon_jy :before"></i>
						</button>
					</div>
					
					<h3 class="lbName-apply_jy">첨부파일</h3>
					<ul class="ul-apply_jy" id="ulResumeList">
	<!-- 이력서 있으면넣기(forEach) 조건:매치업이력서냐? 작성중/작성완료냐? 첨부파일이냐?-->
	<!-- 작성중인 이력서 matched일때만 매치업span보이기-->
						<c:if test="${empty resumeList }">
						
						</c:if>
						<c:if test="${!empty resumeList }">
							<c:forEach var="rVo" items="${resumeList }">
								<%-- <c:if test="${rVo.resumeUpfileflag eq 'N' }"> --%>
									<li class="li-apply_jy">
										<div <c:if test="${rVo.tempFlag eq 'Y'}">class="editing_jy"</c:if>    
											 <c:if test="${rVo.tempFlag eq 'N'}">class="ap-done_jy"</c:if>
											 <c:if test="${rVo.resumeUpfileflag eq 'Y'}">class="upfileresume_jy"</c:if>
										>
											<label for="resume_No_jy">
											<!-- 만약 작성중이면 디스에이블드 -->
												<c:if test="${rVo.tempFlag eq 'Y'}">
													<input type="checkbox" id="ckResumeTemp" name="ckResumeNo" disabled value="${rVo.resumeNo }">
												</c:if>
												<c:if test="${rVo.tempFlag eq 'N'}">
													<input type="checkbox" id="ckResumeSave" class="ckResumeSave" name="resumeNo" value="${rVo.resumeNo }">
												</c:if>
												<%-- <input type="text" value="${rVo.resumeNo}"> --%>
											</label>
											<c:if test="${rVo.resumeUpfileflag eq 'N' }">
												<div class="ap-resumInfo_jy matched_jy">
													<h4 class="ap-resumInfoTitleh4_jy">
														<p class="ap-resumName_jy">${rVo.resumeTitle }</p>
														<c:if test="${rVo.resumeNo eq mcuResumeNo }">
															<span class="ap-mcuFlagsp_jy">매치업</rspan>
														</c:if>
													</h4>
													
													<div class="ap-resumeRegisterInfo_jy">
														<span class="ap-resumelang_jy">
															<c:if test="${rVo.langFlag eq 'KR' }">한국어</c:if>
															<c:if test="${rVo.langFlag eq 'EN' }">ENGLISH</c:if>
															<c:if test="${rVo.langFlag eq 'CH' }">繁體中文</c:if>
															<c:if test="${rVo.langFlag eq 'JP' }">日本語</c:if>
														</span>
														<span class="ap-resumedate_jy"><fmt:formatDate value="${rVo.resumeRegdate }" pattern="yyyy.MM.dd"/></span>
														<span class="ap-tempFlag_jy">
															<c:if test="${rVo.tempFlag eq 'Y'}">작성 중</c:if>
															<c:if test="${rVo.tempFlag eq 'N'}">작성완료</c:if>
														</span>
													</div>
												</div>
												<a href="<c:url value='/resume/resumeDetail.do?resumeNo=${rVo.resumeNo}'/>" class="ap-resumEdit_jy" >
													<i class="icon-icon_match_btn_next iconNextMcubt_jy :after"></i>
												</a>
											</c:if>
											<c:if test="${rVo.resumeUpfileflag eq 'Y' }">
												
												<div class="ap-resumInfo_jy">
													<h4 class="ap-resumInfoTitleh4_jy">
														<p class="ap-resumName_jy">${rVo.resumeTitle}</p>
													</h4>
													<div class="ap-resumeRegisterInfo_jy">
														<span class="ap-resumedate_jy"><fmt:formatDate value="${rVo.resumeRegdate }" pattern="yyyy.MM.dd"/></span>
														<span class="ap-fileFlag_jy :after">첨부파일</span>
													</div>
												</div>
													
											</c:if>
										</div>	
									</li>
							</c:forEach>
						</c:if>	
	
					</ul>
				</form>	
				<div class="filediv-apply_jy">
					<form id="frmUpfile"  name="frmUpfile" method="post" enctype="multipart/form-data" action="<c:url value='/resume/resumefileUpload.do'/>" >
						<input type="file" name="upfile"  id="upfile" style="display: none" >
						<button type="button" class="fileup-apply_jy" id="btUpfile"  name="btUpfile">파일업로드</button>
					</form>
				</div>
				<button type="button" class="resumeRegister-apply_jy" onclick="location.href='<c:url value="/resume/resumeRegister.do"/>'">새 이력서 작성</button>
				<div class="ap-wantedResumediv1_jy">
					<div class="ap-wantedResumediv2_jy">
						<p class="ap-wantedResumeP_jy">원티드 이력서로 지원하면 최종 합격률이 40% 높아집니다.</p>
					</div>
				</div>
				
			</div>
		</div>
		
		<footer class="applyfooter_jy">
			<button type="button" class="btapply_jy" id="byApplySubmit">제출하기</button>
		</footer>
		   
	</div>
<!-- </aside> -->