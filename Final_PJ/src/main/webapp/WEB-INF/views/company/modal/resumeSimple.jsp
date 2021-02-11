<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/matchupResumeModal.css'/>">
<!-- 이력서 간단보기 모달 팝업 시작 -->
<div id="wantedResumeSimpleMD" class="modal fade bs-example-modal-lg wantedResumeSimpleMD" tabindex="-1" 
	role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
			<div class="modal-header modal-comServHeader">
			    <h5 class="modal-title modal-comServTitle" id="wantedResumeSimpleMDLabel" style="align:center">이력서 미리보기</h5>
			    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">×</span>
			    </button>
			</div>
			<div class="container comServModalCon">
				<div class="modal-body">
				    <div class="table-responsive">
				        <div class="container">
				        	<section class="matchupResumeMDSection matchupResumeMDSectionFirst">
				        		<div class="matchupResume1stSec_div"> <!-- 최상단 이름, 다운로드, 찜버튼 -->
					        		<span class="matchupResumeName"></span>
					        		<div>
						        		<button class="matchupSearch-ZzimBtn matchupResumeSMBtns" id="matchupResumeSimpleZzimBtn"><i class="fas fa-star"></i> 찜</button>
					        		</div>
				        		</div>
				        		<div>
				        			<div>
					        			<span class="matchupResumeSubTitle">E-mail </span><span>연락처는 면접 제안 단계에서 공개됩니다.</span>
				        			</div>
				        			<div>
				        				<span class="matchupResumeSubTitle">Mobile </span><span>연락처는 면접 제안 단계에서 공개됩니다.</span>
				        			</div>
				        		</div>
			        		</section>
			        		<!-- 줄긋기 -->
							<section class="matchupResumeMDSection">
								<div id="matchupResumeCareerDiv" class="matchupResumeMainTitle">경력</div>
								<!-- 경력, 아래 div를 경력 개수만큼 출력 -->
								<!-- 경력 시작 -->
								<div class="matchupResumeWrapper">
									<div class="matchupResumeCont matchupResumeSpace">
										<div>
											<div class="matchupResumeSubTitle"></div>
											<div></div>
										</div>
										<div></div>
									</div>
								</div>
								<!-- 경력 끝-->
							</section>
							<!-- 줄긋기 -->
		        			<section class="matchupResumeMDSection">
	        					<div class="matchupResumeMainTitle">학력</div>
								<!-- 학력 시작 -->
	        					<div class="matchupResumeWrapper">
		        					<div class="matchupResumeCont matchupResumeSpace">
										<div class="matchupResumeSubTitle"></div>
										<div></div>
									</div>
									<div>
										<div></div>
									</div>
		        					<div class="matchupResumeMDLightLine"></div>
	        					</div>
		        				<!-- 학력 끝 -->
		        			</section>
		        			<section class="matchupResumeMDSection">
		        				<div class="matchupResumeMainTitle">수상 및 기타</div>
		        				<!-- 수상 및 기타 시작.. 기타활동사항 -->
		        				<div class="matchupResumeWrapper">
		        					<div class="matchupResumeCont matchupResumeSpace">
			        					<div class="matchupResumeSubTitle">상이름</div>
			        					<div>2010.05</div>
		        					</div>
		        					<!-- <div>
		        						어디서탔냐
		        					</div> -->
		        				</div>
		        			</section> 
							<section class="matchupResumeMDSection">
		        				<!-- 어학 시작-->
		        				<div class="matchupResumeMainTitle">어학</div>
								<!-- 언어 시작 -->
		        				<div class="matchupResumeWrapper">
		        					<div class="matchupResumeLang">
			        					<div>
			        						<span class="matchupResumeSubTitle">스페인어</span><span class="matchupResumeMediumSpan"> 일상회화수준</span>
			        					</div>
			        					<div class="matchupResumeCont matchupResumeLangTestCont">
			        						<span class="matchupResumeMediumSpan matchupResumeBoldSpan">SIELE </span>
			        						<span class="matchupResumeMediumSpan"> (2010.05)</span><br>
			        					</div>
			        					<div>
			        						<span class="matchupResumeMediumSpan">744점</span>
			        						<span class="matchupResumeMediumSpan">(B2급)</span>
			        					</div>
		        					</div>
		        				</div>
		        			</section> 
			      		</div>
			        </div>
			    </div>
			</div>
			<div class="modal-footer comServJoinModalFooter">
				<div class="container comServModalFooterCon matchupResumeSpace">
					<span>*이력서 상세보기를 하면 열람권 1회가 차감됩니다.</span>
					<button class="btn btn-primary comServSubmitBtn" id="matchupResumeViewDetailBtn" type="button"
				      data-resumeno="${mcumemMap.RESUMENO}">상세이력 보기</button> 
<%-- 				    <button class="btn btn-primary comServSubmitBtn" id="matchupResumeViewDetailBtn" type="button"
				      data-toggle="modal" data-target=".wantedResumeSimpleMD" data-resumeno="${mcumemMap.RESUMENO}">상세이력 보기</button>  --%>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 이력서 간단보기 모달 팝업 끝 -->