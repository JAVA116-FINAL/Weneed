
<!-- 내꺼!! -->  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/jobsearchApply.css'/>">

<aside class="col-lg-4 asideApply_jy" style="margin-left:-30px;"> 
	<div class="outerdiv-apply_jy">
		<form action="<c:url value='/jobsearch/apply.do'/>" method="post" enctype="multipart/form-data">
			<header class="header-apply_jy">
				<h2 class="h2-apply_jy">지원하기</h2>
				<button type="button" class="btback-apply_jy" onclick="location.href='<c:url value="#"/>'">뒤로</button>
			</header>
			
			<div id="modaldiv_jy">
				<div class="applyinfo_jy">
				
					<h3 class="h3-apply_jy">지원정보</h3>
					<div class="infotmation_jy">
						<label for="name" class="lb-apply_jy">
							<h4 class="lbName-apply_jy">이름</h4>
							<input type="text" name="memName" value="이름">
						</label>
						<label for="email" class="lb-apply_jy">
							<h4 class="lbName-apply_jy">이메일</h4>
							<input disabled type="text" name="memEmail" value="na@naver.com">
						</label>
						<div class="lb-apply_jy">
							<h4 class="lbName-apply_jy">연락처</h4>
							<button type="button" class="hasmobile_jy">
								+8201092534565
								<i class="icon-arrow_right :before"></i>
							</button>
						</div>
					</div>
					<div class="lb-apply_jy">
						<h4 class="lbName-apply_jy">추천인</h4>
						<button type="button" class="selectOptionbt_jy" >
							선택사항
							<i class="icon-arrow_right arrowicon_jy :before"></i>
						</button>
					</div>
					
					<h3 class="lbName-apply_jy">첨부파일</h3>
					<ul class="ul-apply_jy">
	<!-- 이력서 있으면넣기(forEach) 조건:매치업이력서냐? 작성중/작성완료냐? 첨부파일이냐?-->
	<!-- 작성중인 이력서 matched일때만 매치업span보이기-->
						<li class="li-apply_jy">
							<div class="editing_jy">
								<label for="resume_No_jy">
									<input type="checkbox" id="resum_No_jy" disabled>
									<i class="icon-icon_match_list_save iconSave_jy :before"></i>
								</label>
							
								<div class="ap-resumInfo_jy matched_jy">
									<h4 class="ap-resumInfoTitleh4_jy">
										<p class="ap-resumName_jy"> 이력서 이름1</p>
										<span class="ap-mcuFlagsp_jy">매치업여부</span>
									</h4>
									<div class="ap-resumeRegisterInfo_jy">
										<span class="ap-resumelang_jy">한국어</span>
										<span class="ap-resumedate_jy">2021.01.21</span>
										<span class="ap-tempFlag_jy">작성 중</span>
									</div>
								</div>
								<a href="<c:url value='#이력서수정페이지로 이동'/>" class="ap-resumEdit_jy" >
									<i class="icon-icon_match_btn_next iconNextMcubt_jy :after"></i>
								</a>
							</div>	
						</li>
	<!-- 작성완료이력서 -->						
						<li class="li-apply_jy">
							<div class="ap-done_jy">
								<label for="resume_No_jy">
									<input type="checkbox" id="resum_No_jy">
									<i class="icon-icon_match_list_save iconSave_jy :before"></i>
								</label>
							
								<div class="ap-resumInfo_jy">
									<h4 class="ap-resumInfoTitleh4_jy matched">
										<p class="ap-resumName_jy"> 이력서 이름1</p>
										<span class="ap-mcuFlagsp_jy">매치업여부</span>
									</h4>
									<div class="ap-resumeRegisterInfo_jy">
										<span class="ap-resumelang_jy :after">한국어</span>
										<span class="ap-resumedate_jy :after">2021.01.21</span>
										<span class="ap-tempFlag_jy :after">작성 완료</span>
									</div>
								</div>
								<a href="<c:url value='#이력서수정페이지로 이동'/>" class="ap-resumEdit_jy" >
									<i class="icon-icon_match_btn_next iconNextMcubt_jy :after"></i>
								</a>
							</div>	
						</li>
	<!-- 첨부파일이력서인경우 -->						
						<li class="li-apply_jy">
							<div class="upfileresume_jy">
								<label for="resume_No_jy">
									<input type="checkbox" id="resum_No_jy">
									<i class="icon-icon_match_list_save iconSave_jy :before"></i>
								</label>
								<div class="ap-resumInfo_jy">
									<h4 class="ap-resumInfoTitleh4_jy">
										<p class="ap-resumName_jy"> 입사지원서양식_JAVA_BAK 2021-01-17 16.04.53.doc</p>
									</h4>
									<div class="ap-resumeRegisterInfo_jy">
										<span class="ap-resumedate_jy">2021.01.21</span>
										<span class="ap-fileFlag_jy :after">첨부파일</span>
									</div>
								</div>
								<a href="<c:url value='#이력서수정페이지로 이동'/>" class="none_jy" >
									<i class="icon-icon_match_btn_next iconNextMcubt_jy :after"></i>
								</a>
							</div>	
						</li>
					</ul>
					
					<div class="filediv-apply_jy">
						<input type="file" multiple autocomplete="off" tabindex="-1" style="display: none">
						<button type="button" class="fileup-apply_jy" name="resumeFile">파일업로드</button>
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
				<button type="submit" class="btapply_jy">제출하기</button>
			</footer>
		</form>	   
	</div>

</aside>