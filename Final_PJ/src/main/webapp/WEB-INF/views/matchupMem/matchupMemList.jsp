<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- 내꺼!! -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemList.css'/>"> 

    
<section class="section doctor-single machupSection_jy">
	<div class="container machupContainer1_jy">
		<div class="row machupRow_jy">
<!-- 프로필구역 -->		
			<aside class="col-lg-3 col-md-6 machupAside_jy" >
				<!-- 프로필상자, 사진업로드?-->
				<div class="profileblock_jy">
					<header class="profileHeader_jy">
						<div class="member-img_jy" style='background-image: url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png"), url("https://static.wanted.co.kr/images/profile_default.png")'>
						 <!-- 폼은 어디갔니 -->
							<input class="inputimg_jy" type="file" accept="image/*">
							<i class="icon-camera_icon camerai_jy"></i> 
							
						</div>
						<div class="asideMe_jy">
							<div class="asideName_jy">이자연</div>
							<div class="asideMail_jy">nature1119@naver.com</div>
							<div class="asideHp_jy">010-9524-4545</div>
						</div>
						<button type="button" class="btEdit_jy" value="기본정보수정">기본정보 수정</button>
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
					<div class="text-md machupTitlediv_jy">
<!-- 이력서 글자수세서넣기 -->
						<p class="resumeLenth-p_jy">이력서 글자 수 : <span class="resumeLenth-sp_jy">576자 </span> / 최소 400자  </p>
						<p class="static-label_jy">이제 면접제안을 받아보실 수 있습니다. 최신 정보를 유지하고 경쟁력을 높이세요. </p>
					</div>	
				
					<div class="machupSection_jy">
						<header class="form-header_jy">	
							<dl class="form-title_jy">
								<dt class="machupTitle-dt_jy">기본 이력서</dt>
							</dl>
						</header>	
						
						<div class="divformblock_jy">
							<div class="divformblock-contents_jy">
								<div>
									<div class="staticlabel_jy resume-p_jy">기본 이력서 선택</div>
									<div class="staticbody_jy">
										<div class="staticbodyinnerdiv_jy">
											<button class="DefaultResumeSelector-resumeLang ResumeSelector-button_jy" type="button">
												<div class="resumeLand_jy">한</div>
												<span class="innersp_jy">이자연 1(이력서이름)</span>
												<span class="textbt_jy">▼</span> 
											</button>
										</div>
									</div>
									
									<div class="MainResume-fieldset_jy">
										<div class="static-label_jy">학교</div>
										<div class="static-body_jy">
											<span class="ResumeEntry-major_jy innersp_jy :before">대학교</span>
											<span class="distributor_jy">|</span> 
											<span class="ResumeEintry-major_jy innersp_jy">전공미입력</span>
										</div>
										<div class="static-label_jy">직장</div>
										<div class="static-body_jy">
											<span class="ResumeEntry-major_jy innersp_jy :before">아이티윌</span>
											<span class="distributor_jy">|</span> 
											<span class="ResumeEintry-major_jy innersp_jy"> 직책 미입력</span>
										</div>
										<!-- 연필클릭하면 이력서 수정페이지 이동-->
			
										<a href="<c:url value='resume/resumeWrite.do?resumeNo='/>" class="pendil1-a_jy"> 
											<i class="icon-edit pencilEdit_jy2"></i>
									
										</a>
									</div> <!-- 필드셋디브 -->
									<div class="MainResume-about_jy">
										안녕하세요. 5년차 급여, 보상 전문가 입니다.
										1. 150여명 규모 인사관리
										-입사자 관리: 입사서류 안내 및 취합, ERP 등록 밎 인적사항 기록 관리, 중소기업취업청년
									</div>									
								</div>
							</div>
						</div>
					</div>	
						
						
					<div class="machupSection_jy">
						<header class="form-header_jy">	
							<dl class="form-title_jy">
								<dt class="machupTitle-dt_jy">전문분야 설정</dt>
							</dl>
						</header>	
						<div class="divformblock_jy">
							<div class="divformblock-contents_jy">
								<div class="EnterInterestArea-fieldset_jy">
									<div class="jobarea_jy">	
										<div class="staticlabel_jy">직군</div>
										<div class="staticbody_jy ">인사</div>
									</div>
									<div class="jobarea_jy">	
										<div class="staticlabel_jy">직무</div>
										<div class="staticbody_jy ">급여담당</div>
									</div>
									<div class="jobarea_jy">	
										<div class="staticlabel_jy">경력</div>
										<div class="staticbody_jy">6년</div>
									</div>
									<div class="jobarea_jy">	
										<div class="staticlabel_jy">현재연봉</div>
										<div class="staticbody_jy">연간/5,000만원</div>
									</div>
									<div class="jobarea_jy">	
										<div class="staticlabel_jy">스킬</div>
										<div class="staticbody_jy">java, ERP</div>
									</div>
								<!-- 매치업 전문분야 편집하기 ajax로 이동하면 좋을듯 -->
									<a href="<c:url value='/matchupMem/matchupMemRegister.do'/>" class="pendil2-a_jy"> 
<%-- 									<a href="<c:url value='/matchupMem/matchupEdit.do'/>" class="pendil2-a_jy">  --%>
										<i class="icon-edit pencilEdit_jy1"></i>
									</a>
								</div>
							</div>
						</div>
						
						<div class="divformblock_jy">
							<div class="divformblock-contents_jy">
								<div class="ectbtgroup_jy">
									<div class="formButton_jy">
										<h6 class="formButton-label_jy">추천인 선택</h6>
										<button type="button" class="btselect_jy">
											"선택하기"
											 <i class="icon-arrow_right :before arrowIcon_jy"></i>
										</button>
									</div>
								
									<div class="formButton_jy">
										<h6 class="formButton-label_jy exceptconOption_jy">제외기업설정</h6>
										<button type="button" class="btselect_jy">
											"선택하기"
											 <i class="icon-arrow_right :before arrowIcon_jy"></i>
										</button>
									</div>
								<!-- 기타옵션  -->		
									<div class="inputgroup_jy">
										<h6 class="InputGroup-label_jy"></h6>
										<div class="InputGroup-body_jy">
											<div class="JobSearchIntentionSelector-wrapper_jy">
												구직여부 설정
												<select class="JobSearchIntentionSelector-select_jy">
													<option value="NOW">현재 구직 중</option>
													<option value="INTEREST">관심 있음 </option>
													<option value="NO">전혀 관심 없음</option>
												</select>
											</div>
											<span class="distributor_jy">|</span>
											<span class="JobSearchIntentionSelector-status_jy">
												이력서 공개중
											</span>
										</div>
									</div> <!--기타옵션 inputdiv  -->

									<!-- 모달?? -->
								</div>	
							</div>
						</div>
					</div>
													
				</div>
					
					
				
				</div>
			</div> <!-- aside옆 Maindiv -->
			
			
		</div><!-- row -->
	</div><!-- container -->
</section>

<%-- <%@ include file="../inc/bottom.jsp" %> --%>