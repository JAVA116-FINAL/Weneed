<%@ include file="../inc/top.jsp" %>


<!-- 내꺼!! -->  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/resumeList.css'/>">

<section class="section contact-info pb-0 RWSection_jy">
	
	<div class="container RWcontainer_jy">
	
		<div class="RWTop-Wrapper_jy">
			<div class="resumeListTitle1_jy">
				<span class="sp-rwtop_jy">최근 문서 </span>
				 <button class="bt-rwtop_jy" onClick='location.href="<c:url value='/resume/resumeIntro.do'/>"'>원티드 이력서 소개 ⓘ</button><br>
			 </div>
		</div>
		
		<div class="row RWRow_jy">
			<div class="col-lg-3 col-sm-6 col-md-6">
				 <div class="contact-block mb-4 mb-lg-0 block_jy">
					 <a href="<c:url value='/resume/resumeRegister.do'/>" class="RWLink_jy">
				 		<span class="blueBox_jy">
				 			<i class="icon-new_resume :before NewResumeIcon_jy"></i>
						</span>
						
							<span class="resumeTitle_jy"> <h3>새 이력서 작성 </h3> </span>
						
						</a>					
					
				</div>
			</div>
			
			<div class="col-lg-3 col-sm-6 col-md-6">
				 <div class="contact-block mb-4 mb-lg-0 block_jy">
				 	
					 	<a href="#" class="RWLink_jy"> <!--버튼?/ 회색동그라미 만들어서 링크연결 -->
							<span class="grayBox_jy">
						 		<i class="icon-upload_resume UpResumeIcon_jy"></i>
					 		</span>
					 		<span class="resumeTitle_jy"> <h3>파일 업로드</h3> </span>	
					 	</a>		 
				 </div>
			</div>			
			<!-- 이력서 추가 -->
			<c:if test="${!empty list}">
			 	<div class="col-lg-3 col-sm-6 col-md-6">
					 <div class="contact-block mb-4 mb-lg-0 block_jy">
						<span><h3>작성 이력서 없음<h3></span>
					 </div>	
				</div>	
			</c:if>
			
<!-- 이력서가 존재하면 포이치로 받아와야함 -->		
			<c:if test="${empty list}">
				<div class="col-lg-3 col-sm-6 col-md-6">
					 <div class="contact-block mb-4 mb-lg-0 block_jy"> 
					 		<div class="resumT_jy">					 			
						 			<a href="#">
										 <span class="RWName"><h3> 이력서 이름 </h3></span>
										<span class="RWRegdate"><p> 이력서 작성일자 </p></span>
										<span class="RWMachupFlag"><p> 매치업이력서여부</p></span>
									</a>
								
							</div>
							
							<hr class="rwhrLine_jy">	
							<div class="resumeB_jy">
								<i class="icon-joblist_bottombar_cv :before icon_jy"></i>
								<span>첨부완료</span>
								<!-- 떙땡이 클릭하면 수정삭제여부나온다. -->
							   <div class="nav-item dropdown RWdropdown_jy">
									<div class="nav-link dropdown-toggle dropdowntoggle_jy"  data-toggle="dropdown">
										<i class="icon-more_vert :before icon_jy">
									</i>
										<ul class="dropdown-menu dropdownMenu_jy" >
											<li><a class="dropdown-item" href="#">이름변경</a></li>
											<li><a class="dropdown-item" href="#">다운로드</a></li>
											<li><a class="dropdown-item" href="#">삭제</a></li>
										</ul>
									</div>	
							  	</div>
						<!-- 
								c:if로 작성한 이력서고 작성중이면  
								<span class="resume-icon writing RWlang_jy">한</span>
								<span> 작성중</span>
								 
								c:if로 작성한 이력서고 작성중이면  
								<span class="resume-icon writing RWlang_jy">한</span>
								<span> 작성완료</span>
		     			  -->
							</div>							
					 </div>	 
				</div>	
			</c:if>
			
		
			
	
		</div>	
		
	</div>		
</section>	

<%@ include file="../inc/bottom.jsp" %>