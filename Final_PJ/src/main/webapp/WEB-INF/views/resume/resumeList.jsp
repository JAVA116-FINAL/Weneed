<%@ include file="../inc/top.jsp" %>

<!-- 내꺼!! -->  
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  --%> 
<link rel="stylesheet" href="<c:url value='/resources/css/resumeList.css'/>">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.form/4.3.0/jquery.form.min.js" integrity="sha384-qlmct0AOBiA2VPZkMY3+2WqkHtIQ9lSdAsAn5RUJD/3vA5MKDgSGcdmIv4ycVxyn" crossorigin="anonymous"></script>
<!-- <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> -->
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
				$.makeform(resUp);
			},
			error:function(xhr,status,error){
				alert("error!:"+error);
			}
		}); //ajax
		
	});//change이벤트
	
	$.makeform=function(resUp){
		alert('파일 정상업로드 되었습니다.');
		window.location.reload();
	}
	

	 
	//토글에서 이름변경하기를 누르면 
	/*
	$.editTitle=function(resumeNo){
		$('#alocation_jy'+resumeNo).click(function(){
			$('#resumeTitleEdit_jy'+resumeNo).attr("readonly",false);		
			$('#resumeTitleEdit_jy'+resumeNo).focus();	
			ignore.preventDefault();
			return false;
		
		});
				
		$('#resumeTitleEdit_jy'+resumeNo).keyup(function(){
			$.ajax({
				url:"<c:url value='/resume/resumeTitleEdit.do'/>",
				type:"post",
				data:{"resumeTitle":$('#resumeTitleEdit_jy'+resumeNo).val(),
					  "resumeNo":resumeNo
				},
				dataType:"json",
				success:function(res){
					alert(res);
				},
				error:function(xhr,status,error){
					alert("error:"+error);
				}
			});//ajax 
		});
	
	}//타이틀 에딧함수
			
	*/
	
	//pdf로 파일객체 생성해서 저장
	$.downResume=function(resumeNo){
		$.ajax({
			url:"<c:url value='/resume/resumeDown.do'/>",
			type:"get",
			data:"resumeNo="+resumeNo,
			dataType:"json",
			success:function(resDown){
				//alert(resDown);
				if(resDown>0){
					alert("pdf 파일생성, 다운로드 되었습니다.");
				}
			},
			error:function(xhr,status,error){
				alert("error:"+error);
			}
		});//ajax
	}//downResume
	
	//이력서 삭제하기	
	$.delResume=function(resumeNo){
		
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
		
			$.ajax({
				url:"<c:url value='/resume/deleteResume.do'/>" ,
				type:"get",
				data:"resumeNo="+resumeNo,
				dataType:"json",
				success:function(resDel){
					//alert(resDel);
					 if(resDel>0){
						$('#divNo'+resumeNo).remove();
					} 
				},
				error:function(xhr,status,error){
					alert("error:"+error);
				}
			});//ajax
		}//confirm if
	}//delResume

	//이력서파일 삭제하기	=>아직안됨
	$.delResumeFile=function(resumeNo,resumeFile){
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인

			$.ajax({
				url:"<c:url value='/resume/deleteResumeFile.do'/>" ,
				type:"get",
				data:{
					  "resumeNo": resumeNo,
					  "resumeFile": resumeFile
				},
				dataType:"json",
				success:function(resDelFile){
					//alert(resDelFile);
					 if(resDelFile>0){
						alert('파일 정상 삭제 되었습니다.');
						window.location.reload();
					} 
				},
				error:function(xhr,status,error){
					alert("error:"+error);
				}
			});//ajax
		}//confirm if	
	}//delResume
	
	
});
</script>

<section class="section contact-info pb-0 RWSection_jy">
	<div class="container RWcontainer_jy">
		<div class="RWTop-Wrapper_jy">
			<div class="resumeListTitle1_jy">
				<span class="sp-rwtop_jy">최근 문서 </span>
				 <button class="bt-rwtop_jy" onClick='location.href="<c:url value='/resume/resumeIntro.do'/>"'>원티드 이력서 소개 ⓘ</button><br>
			 </div>
		</div>
		
		<div class="row RWRow_jy">
			<div class="col-lg-3 col-sm-4 col-md-4">
				 <div class="contact-block mb-4 mb-lg-0 block_jy">
					 <button class="RWLink_jy" type="button" onClick='location.href="<c:url value='/resume/resumeRegister.do'/>"'>
					 	<span class="blueBox_jy">
				 			<i class="icon-new_resume :before NewResumeIcon_jy"></i>
						</span>
						<span class="resumeTitle_jy"> <h3>새 이력서 작성</h3> </span>
					 </button>
				</div>
			</div>
			
			<div class="col-lg-3 col-sm-4 col-md-4">
				 <div class="contact-block mb-4 mb-lg-0 block_jy">
				 	<form name="frmUpfile" id="frmUpfile" method="post" enctype="multipart/form-data" action="<c:url value='/resume/resumefileUpload.do'/>">
					 	<input type="file" name="upfile"  id="upfile" >
					 	<button type="button" class="RWLink_jy" id="btUpfile"> <!--버튼?/ 회색동그라미 만들어서 링크연결 -->
							<span class="grayBox_jy">
						 		<i class="icon-upload_resume UpResumeIcon_jy"></i>
					 		</span>					 		
					 		<span class="resumeTitle_jy"><h3>파일 업로드</h3></span>
						</button>
					 </form>		 
				 </div>
			</div>		
				
			<!-- 이력서 추가 -->
			<c:if test="${empty resumeList}">
			 	<div class="col-lg-3 col-sm-4 col-md-4">
					 <div class="contact-block mb-4 mb-lg-0 block_jy">
						<span class="resumT_jy">
							<span class="noResume_jy">작성 이력서 없음</span>
						</span>
					 </div>	
				</div>	
			</c:if>
			
<!-- 이력서가 존재하면 포이치로 받아와야함 -->		
			<c:if test="${!empty resumeList}">
				<c:forEach var="rVo" items="${resumeList}">
					<div class="col-lg-3 col-sm-4 col-md-4" id="divNo${rVo.resumeNo}">
						 <div class="contact-block mb-4 mb-lg-0 block_jy"> 
					 		<div class="resumT_jy">		
					 		<!--첨부파일이 아니면? -->
								<c:if test="${rVo.resumeUpfileflag eq 'N' }">
						 			<form name="frmEditName" action="" method="post">			 			
							 			<a href="<c:url value='/resume/resumeDetail.do?resumeNo=${rVo.resumeNo}'/>" id="alocation_jy"+${rVo.resumeNo }>
											<span class="RWName">
												<h3>
												<label for="resumeTitle"> 
														<c:if test="${fn:length(rVo.resumeTitle)>=27}">
															${fn:substring(rVo.resumeTitle, 0,27) } ...
														</c:if>
														<c:if test="${fn:length(rVo.resumeTitle)<27}">						
															${rVo.resumeTitle}
														</c:if>							
													<%-- ${rVo.resumeTitle} --%>
													<input type="hidden" name="resumeTitle" id="resumeTitleEdit_jy"+${rVo.resumeNo} readonly="readonly" value="${rVo.resumeTitle}" class="nameEdit_jy"></input>
													<input type="hidden" name="resumeNo" id="resumeNo_jy" value="${rVo.resumeNo}"></input>
												</label>
												</h3>
											</span>
											<span class="RWRegdate"><p><fmt:formatDate value="${rVo.resumeRegdate}" pattern="yyyy.MM.dd"/></p></span>
						<!-- 매치업  넣기 -->				
											<c:if test="${rVo.resumeNo eq mcuResumeNo}">
												<span class="RWMachupFlag"><p> 매치업이력서</p></span>
											</c:if>  
											
										   </a>
									   </form>
								    </c:if>
						<!-- 첨부파일이면, 파일이름 두줄로 보여주고, 날짜보여주고, 클릭시 파일 다운로드 -->
									<c:if test="${rVo.resumeUpfileflag eq 'Y' }">
										<span class="rFileName_jy">
											<a href="<c:url value='/resume/resumeFileDown.do?resumeNo=${rVo.resumeNo}&resumeFile=${rVo.resumeFile}'/>">
												<c:if test="${fn:length(rVo.resumeTitle)>=27}">
													${fn:substring(rVo.resumeTitle, 0,27) } ...
												</c:if>
												<c:if test="${fn:length(rVo.resumeTitle)<27}">						
													${rVo.resumeTitle}
												</c:if>
											<%-- ${rVo.resumeTitle} --%>
											<%-- 
											<span class="RWName">
												<h3>
													<input type="text" name="resumeTitle" id="resumeTitleEdit_jy"+${rVo.resumeNo} readonly="readonly" value="${rVo.resumeTitle}" class="nameEdit_jy"></input>
													<input type="hidden" name="resumeNo" id="resumeNo_jy" value="${rVo.resumeNo}"></input>
												</h3>
											</span> 
											--%>
											</a>
										</span>
										<span class="RWRegdate"><p><fmt:formatDate value="${rVo.resumeRegdate}" pattern="yyyy.MM.dd"/></p></span>
									</c:if>	
								</div>
								
								<div class="resumeB_jy">
					<!-- 첨부파일이Y면 보여주기 위에 a href경로 다르게 주기-다운로드로-->
									<c:if test="${rVo.resumeUpfileflag eq 'Y' }">
										<i class="icon-joblist_bottombar_cv :before icon_jy"></i>
										<span>첨부완료</span>
									</c:if>		
									<c:if test="${rVo.resumeUpfileflag eq 'N'}">
										<span class="resume-icon writing RWlang_jy">
											<c:if test="${rVo.langFlag=='KR'}">한</c:if>
											<c:if test="${rVo.langFlag=='EN'}">A</c:if>
											<c:if test="${rVo.langFlag=='CH'}">文</c:if>
											<c:if test="${rVo.langFlag=='JP'}">あ</c:if>
										</span>
										<c:if test="${rVo.tempFlag eq 'Y'}">
											<span>작성중</span>
										</c:if>
										<c:if test="${rVo.tempFlag eq 'N'}">
											<span>작성완료</span>
										</c:if>
									</c:if>
					<!-- 떙땡이 클릭하면 수정삭제여부나온다. -->
								    <div class="nav-item dropdown RWdropdown_jy">
										<div class="nav-link dropdown-toggle dropdowntoggle_jy"  data-toggle="dropdown">
											<i class="icon-more_vert :before icon_jy"></i>
											<ul class="dropdown-menu dropdownMenu_jy">
												
												<!-- 만약 파일이면 파일다운로드 -->
												<c:if test="${rVo.resumeUpfileflag eq 'Y' }">
													<li><button type="button" class="dropdown-item" id="downResume_jy" onClick='location.href="<c:url value='/resume/resumeFileDown.do?resumeNo=${rVo.resumeNo}&resumeFile=${rVo.resumeFile}'/>"'>다운로드</button></li>
													<li><button type="button" class="dropdown-item" id="resumeDel_jy" onClick="$.delResumeFile('${rVo.resumeNo}','${rVo.resumeFile}')">삭제</button></li>
												</c:if>
												<c:if test="${rVo.resumeUpfileflag eq 'N' }">
												<%-- <li><button type="button" class="dropdown-item" id="TitleEdit_jy"  onClick="$.editTitle(${rVo.resumeNo})">이름변경</button></li> --%>
													<li><button type="button" class="dropdown-item" id="TitleEdit_jy"  onClick="location.href='<c:url value="/resume/resumeDetail.do?resumeNo=${rVo.resumeNo}"/>'">수정하기</button></li>
													<li><button type="button" class="dropdown-item" id="downResume_jy" onClick="$.downResume(${rVo.resumeNo})">다운로드</button></li>
													<li><button type="button" class="dropdown-item" id="resumeDel_jy" onClick="$.delResume(${rVo.resumeNo})">삭제</button></li>
												</c:if>
													
											</ul>
										</div>	
								  	 </div>
							 	</div>							
						 	</div>	 
						 </div>
				 	</c:forEach>		
				</c:if> <!-- 이력서가 있으면 -->
			</div>	
		</div>		
</section>	

<%@ include file="../inc/bottom.jsp" %>