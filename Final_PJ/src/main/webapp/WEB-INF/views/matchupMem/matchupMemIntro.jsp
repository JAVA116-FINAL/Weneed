<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../inc/top.jsp" %>
<!-- 내꺼!! -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemIntro.css'/>">    

    
<section class="banner mcuIntrobanner_jy">
	<div class="mcuIntrocontainer_jy">
		<div class="mcuIntrorow_jy">
			<div class="col-lg-12 col-md-12 col-xl-7 mcuIntrodiv-col_jy">
				<div class="block mcuIntroblock_jy">
					<h1 class="col-lg-12 mt-3 mcuIntroTitle_jy">찾아오는 면접 제안, MatchUp</h1>
					<p class="col-lg-12 pr-5 mcuIntro-p_jy"">프로필 등록 한번으로 인사담당자에게 직접 면접 제안을 받으세요.</p>
					<div class="btn-container mcuIntrobtContainerdiv_jy">
						<button class="btn btn-main-2 btn-icon btn-round-full mcuRegisterbt_jy" onclick="location.href='<c:url value="/matchupMem/matchupMemRegister.do"/>'">매치업 등록하기</button>
					</div>
					<div class="matchupIntroimg_jy"></div>
					
				</div>
			</div>
		</div>
	</div>
</section>

<section class="features mcuIntrofeatures_jy">
	<div class="mcuIntrocontainer_jy">
		<div class="mcuIntrorow_jy mcuIntrofSectionrow_jy">
			<div class="col-lg-12 mcuIntrodiv-col_jy mcuIntrofSection_jy">
				<div class="feature-block d-lg-flex">
					<div class="feature-item mb-5 mb-lg-0 featureItem_jy">
						<div class="feature-icon mb-4 featureIcon_jy">
							<!-- 연필 -->
							<div class="icon pen"></div>
						</div>
						<h4 class="mb-3 featureSectionTitle_jy">편리한<br> 프로필 등록</h4>
						<p class="mb-4 featureSectionContents_jy">복잡하고 어려운 이직을 스마트하게. 이력서 무한작성은 이제 그만. 딱 한번의 손쉬운 프로필 등록으로 이직 준비 끝</p>
					</div>
				
					<div class="feature-item mb-5 mb-lg-0 featureItem_jy">
						<div class="feature-icon mb-4 featureIcon_jy">
							<!-- 자물쇠 -->
							<div class="icon lock"></div>
						</div>
						<h4 class="mb-3 featureSectionTitle_jy">개인정보는<br> 안전하게</h4>
						<p class="mb-4 featureSectionContents_jy">구직활동 노출이 걱정되시나요? 경력 정보만 공개, 개인정보는 안전하게 지켜드릴게요.</p>				
					</div>
				
					<div class="feature-item mb-5 mb-lg-0 featureItem_jy">
						<div class="feature-icon mb-4 featureIcon_jy">
							<!-- 머니 -->
							<div class="icon kr"></div>
						</div>
						<h4 class="mb-3 featureSectionTitle_jy">합격 보상금<br> 50만원까지</h4>
						<p class="mb-4 featureSectionContents_jy">면접 제안으로 합격해도 50만원의 합격 축하 보상금이 당신을 찾아갑니다. 지금 기회를 잡아보세요!</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>


    
 <section class="section service gray-bg mcuIntroSectionGray_jy">
	<div class="mcuIntroContentCenter_jy">
			<div class="col-lg-12 mcuIntroTextCenter_jy">
				<div class="section-title mcuIntroSectionTitle_jy">
					<h2 class="mcuIntrosectionGray-h2_jy">인사담당자들이 검증한 인재 검색 서비스</h2>
					<p class="mcuIntro-p_jy">지금도 인사담당자들의 적극적인 면접 제안이 이루어지고 있습니다</p>
				</div>
			</div>
		</div>
	
	<div class="mcuIntrocontainer2_jy">
		<div class="mcuIntrorow2_jy">
			<div class="mb-3 mcuIntroCol2_jy">
				<div class="mb-4 mcuIntroServiceItem2_jy">
					<div class="mcuIntroContent2_jy">
						<p class="mb-4 featureSectionContents_jy">수동적으로 이력서를 기다리는 것 보다 저희와 fit한 인재를 직접 찾아 볼 수 있다는 것이 가장 마음에 들었어요.</p>
					</div>
					<div class="mcuIntrorivuewSectionlinearrow_jy"></div>
					<div class="icon d-flex align-items-center mcuIntroAlignItem_jy">
						<h4 class="mt-3 mb-3 featureSectionTitle_jy">대기업 N사, 채용담당자</h4>
						<div class="point-starts nCompany_jy"></div>
					</div>	
					
				</div>
				
			</div>

			<div class="mb-3 mcuIntroCol2_jy">
				<div class="mb-4 mcuIntroServiceItem2_jy">
					<div class="mcuIntroContent2_jy">
						<p class="mb-4 featureSectionContents_jy">6개월 동안 채용하지 못한 개발자를 1개월 만에 매치업 면접 제안을 통해 찾을 수 있었어요.</p>
					</div>
					<div class="mcuIntrorivuewSectionlinearrow_jy"></div>
					<div class="icon d-flex align-items-center mcuIntroAlignItem_jy">
						<h4 class="mt-3 mb-3 featureSectionTitle_jy">외국계기업 A사, 리크루터</h4>
						<div class="point-starts aCompany_jy"></div>
					</div>
				</div>
				
			</div>
			
			<div class="mb-3 mcuIntroCol2_jy">
				<div class="mb-4 mcuIntroServiceItem2_jy">
					<div class="mcuIntroContent2_jy">
						<p class="mb-4 featureSectionContents_jy">현재 구직의사가 있는지 먼저 확인한 후에 면접 제안을 보낼 수 있어서 편리했어요.</p>
					</div>
					<div class="mcuIntrorivuewSectionlinearrow_jy"></div>
					<div class="icon d-flex align-items-center mcuIntroAlignItem_jy">
						<h4 class="mt-3 mb-3 featureSectionTitle_jy">스타트업 C사, 인사담당자</h4>
						<div class="point-starts cCompany_jy"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="section clients mcuIntroSectionReview_jy">
	<div class="mcuIntrocontainer3_jy">
		<div class="justify-content-center mcuIntrorow3_jys">
			<div class="mcuIntroCol7_jy">
				<div class="section-title text-center mcuIntroreviewTitle_jy">
					<h2 class="mcuIntroh2Title_jy">10,000개 이상의 글로벌 기업들이 매치업을 통해 인재를 찾고 있습니다.<br> 지금 바로 이력서 등록하고 인사담당자들과 만나보세요.</h2>
				</div>
			</div>
		</div>
	</div>

	<div class="mcuIntrocontainer_jy">
		<div class="clients-logo rwoClientLogo_jy">
			<div class="col-lg-2 col-lg2_jy">
				<div class="companies-images_jy"></div>
			</div>
				<div class="btn-container mcuIntrobtContainerdiv_jy">
						<button class="btn btn-main-2 btn-icon btn-round-full mcuRegisterbt_jy" onclick="location.href='<c:url value="/matchupMem/matchupMemRegister.do"/>'">매치업 시작하기</button>
				</div>
		</div>
	</div>
</section>   
    
<%@ include file="../inc/bottom.jsp" %>