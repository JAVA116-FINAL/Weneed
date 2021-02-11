<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/matchupResumeModal.css'/>">
<!-- 이력서 상세보기 모달 팝업 시작 -->
<div class="modal fade bs-example-modal-lg wantedResumeDetailMD" tabindex="-1" 
	id="wantedResumeDetailMD" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" >
	  <div class="modal-dialog modal-lg">
	    <div class="modal-content">
			<div class="modal-header modal-comServHeader">
			    <h5 class="modal-title modal-comServTitle" id="wantedResumeDetailMDLabel" style="align:center">상세이력 보기</h5>
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
					        		<span class="matchupResumeName">손 OO</span>
					        		<div>
						        		<button class="matchupResumeSMBtns"><i class="far fa-save"></i> 다운로드</button>
						        		<button class="matchupResumeSMBtns" ><i class="fas fa-star"></i> 찜</button>
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
								<div class="matchupResumeMainTitle">경력</div>
								<!-- 경력, 아래 div를 경력 개수만큼 출력 -->
								<!-- 경력 시작 -->
								<div class="matchupResumeWrapper">
									<div class="matchupResumeCont matchupResumeSpace">
										<div>
											<div class="matchupResumeSubTitle">유플리트</div>
											<div>기획팀 / 기획자</div>
										</div>
										<div>2010.03 ~ 2011.03</div>
									</div>
									<!-- 성과 시작 -->
									<div class="matchupResumeCont matchupResumeSpace matchupResumeAchievement">
										<div>성과이름 프로젝트</div>
										<div class="matchupResumeMediumSpan">2010.03 ~ 2011.02</div>
									</div>
									<div>성과 상세내용 블라블라 이것도하고 저것도하고 요것도함</div>
									<div class="matchupResumeMDLightLine"></div> <!-- 연한 줄긋기 -->
									<!-- 성과 끝 -->
								</div>
								<!-- 경력 끝-->
							</section>
							<!-- 줄긋기 -->
		        			<section class="matchupResumeMDSection">
	        					<div class="matchupResumeMainTitle">학력</div>
								<!-- 학력 시작 -->
	        					<div class="matchupResumeWrapper">
		        					<div class="matchupResumeCont matchupResumeSpace">
										<div class="matchupResumeSubTitle">서울대학교</div>
										<div>2010.03 ~ 2011.03</div>
									</div>
									<div>
										<div>소프트웨어공학과</div>
										<div>연구성과 등등 상세내용 있으면 넣기</div>
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
		        					<div>
		        						어디서탔냐
		        					</div>
		        				</div>
		        			</section> 
							<section class="matchupResumeMDSection">
		        				<!-- 어학 시작-->
		        				<div class="matchupResumeMainTitle">어학</div>
								<!-- 언어 시작 -->
		        				<div>
		        					<div class="matchupResumeLang">
			        					<div>
			        						<span class="matchupResumeSubTitle">스페인어</span><span class="matchupResumeMediumSpan"> 일상회화수준</span>
			        					</div>
			        					<div class="matchupResumeCont ">
			        						<span class="matchupResumeMediumSpan matchupResumeBoldSpan">SIELE </span>
			        						<span class="matchupResumeMediumSpan"> (2010.05)</span><br>
			        					</div>
			        					<div>
			        						<span class="matchupResumeMediumSpan">744점</span><br>
			        						<span class="matchupResumeMediumSpan">(B2급)</span>
			        					</div>
		        					</div>
		        					<div>
			        					<div>
			        						<span class="matchupResumeSubTitle">영어</span><span class="matchupResumeMediumSpan"> 비즈니스회화수준</span>
			        					</div>
			        					<div class="matchupResumeCont">
			        						<span class="matchupResumeMediumSpan matchupResumeBoldSpan">OPIC </span>
			        						<span class="matchupResumeMediumSpan"> (2010.05)</span>
			        					</div>
			        					<div>
			        						<span class="matchupResumeMediumSpan">AL</span><br><span></span>
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
					<span class="matchupModalFooterGuide">*유능한 후보자는 여러 기업에서 면접 제안을 받습니다.<br>기회를 놓치지 마세요!</span>
				    <button class="btn btn-primary comServSubmitBtn" id="matchupResumeViewDetailBtn" type="submit">제안하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 이력서 상세보기 모달 팝업 끝 -->