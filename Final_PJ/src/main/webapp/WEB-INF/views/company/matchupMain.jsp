<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/matchup.css'/>">
<title>당신이 찾는 인재, MatchUp에선 훨씬 더 빠르게 찾을 수 있습니다.</title>
<script type="text/javascript">
$(function(){
	$('.matupChooseBtn1').click(function(){
		$('#matchUpPaymentServSelect').val('light').attr('selected', 'selected');
	});
	$('.matupChooseBtn2').click(function(){
		$('#matchUpPaymentServSelect').val('basic').attr('selected', 'selected');
	});
	$('.matupChooseBtn3').click(function(){
		$('#matchUpPaymentServSelect').val('unlimited').attr('selected', 'selected');
	});
});


</script>
</head>
<body>
	<!-- 첫번째 섹션 -->
	<section class="matchupMain-1stSec"
		style="background:url('${pageContext.request.contextPath}/resources/images/company/matchup_top2.png') center/cover no-repeat;"> 
		<h1>MatchUp</h1>
		<h1>어디에서도 볼 수 없는 국내 최고의 인재풀</h1>
		<h2 class="matchupMainH2-white"><br>가장 이직이 활발한 3~7년차, IT직군 인재를 만나보세요</h2>
		<a data-toggle="modal" href=".matchupServPlanMD" class="matchupMain-btn-gotoSearchPage">검증된 인재 만나기</a>
		<%@ include file="../company/modal/matchupServiceSelect.jsp" %>
	</section>
	<section class="matchupMain-2ndSec">
		<h2 class="matchupMainH2-dark">합리적인 가격으로, 우수한 인재풀을 빠르고 쉽게!</h2>
		<div class="matchupMain-3parts-wrapper"> <!-- 3가지 디브 -->
			<div class="matchupMain-3parts matchupMain-3parts-one">
				<i class="fas fa-business-time fa-5x"></i>
				<h3 class="matchupMain-3parts-title">빠른 채용</h3>
				<span class="matchupMain-3parts-contents">평균 3일 만에 면접 수락<br>채용기간 평균 15일 단축</span>
			</div>
			<div class="matchupMain-3parts matchupMain-3parts-one">
				<i class="fas fa-hands-helping fa-5x"></i>
				<h3 class="matchupMain-3parts-title">알아서 척척! 추천 AI</h3>
				<span class="matchupMain-3parts-contents">AI가 합격 가능한 인재 추천
					<br>80만건 이상의 전형 데이터를<br>바탕으로 한 높은 정확도</span>			
			</div>
			<div class="matchupMain-3parts matchupMain-3parts-one">
				<i class="fas fa-donate fa-5x"></i>
				<h3 class="matchupMain-3parts-title">혁신적 비용 절감</h3>
				<span class="matchupMain-3parts-contents">몇 명을 채용해도 추가 비용 Zero
					<br>65% 사용자가 비용 절감 경험</span>			
			</div>
		</div>
	</section>
	<section>
		<div class="matchup-productIntro-wrapper">
			<h1>MatchUp 상품안내</h1>
			<div class="matchup-productIntro-3items">
				<div class="matchup-productIntro-item">
					<h2 class="matchup-productIntro-item-title1">라이트</h2>
					<h2 class="matchup-productIntro-item-price1">500,000원</h2>
					<span class="matchup-extraFee">부가세 별도</span>
					<span class="matchup-posCnt">1~2개 포지션 채용시 추천</span>
					<div class="matchup-fakespan">     </div>
					<span>채용 수수료 무료</span>
					<span>경력/학력 등 상세 이력 확인</span>
					<span class="matchup-Strong-text matchup-Strong-text1">30개 상세 이력서 열람</span>
					<a data-toggle="modal" href=".matchupServPaymentMD" class="matupChooseBtn matupChooseBtn1">선택하기</a>
					<%@ include file="../company/modal/matchupServicePayment.jsp" %>
				</div>
				<div class="matchup-productIntro-item">
					<h2 class="matchup-productIntro-item-title2">베이직</h2>
					<h2 class="matchup-productIntro-item-price2">1,000,000원</h2>
					<span class="matchup-extraFee">부가세 별도</span>
					<span class="matchup-posCnt">3+개 포지션 채용시 추천</span>
					<div class="matchup-fakespan">     </div>
					<span>채용 수수료 무료</span>
					<span>경력/학력 등 상세 이력 확인</span>
					<span class="matchup-Strong-text matchup-Strong-text2">100개 상세 이력서 열람</span>
					<a data-toggle="modal" href=".matchupServPaymentMD" class="matupChooseBtn matupChooseBtn2">선택하기</a>
					<%@ include file="../company/modal/matchupServicePayment.jsp" %>
				</div>
				<div class="matchup-productIntro-item">
					<h2 class="matchup-productIntro-item-title3">무제한</h2>
					<h2 class="matchup-productIntro-item-price3">합격자 연봉의 7%</h2>
					<span class="matchup-extraFee">부가세 별도</span>
					<span class="matchup-posCnt">다수 포지션 채용시 추천</span>
					<div class="matchup-fakespan">     </div>
					<span>최종합격시 채용수수료 발생</span>
					<span>경력/학력 등 상세 이력 확인</span>
					<span class="matchup-Strong-text matchup-Strong-text3">무제한 상세 이력서 열람</span>
					<a data-toggle="modal" href=".matchupServPaymentMD" class="matupChooseBtn matupChooseBtn3">선택하기</a>
					<%@ include file="../company/modal/matchupServicePayment.jsp" %>
				</div>
			</div>
		</div>
	</section>
</body>
</html>