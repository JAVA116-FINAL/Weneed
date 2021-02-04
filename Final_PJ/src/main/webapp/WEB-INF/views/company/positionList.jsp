<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/imgUpload.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/position.css'/>">
<script type="text/javascript">
$(function(){
	$('#tabImg').attr("checked", 'checked');
	
	//[이미지 / 정보] 탭 기능 구현
	$('#tabImg').click(function(){
		$('.infoSection').addClass('hide');
		$('.imgSection').removeClass('hide');
		
		$('#tabImgLabel').addClass('selectedTab');
		$('#tabInfoLabel').removeClass('selectedTab');
		
		
	});
	$('#tabInfo').click(function(){
		$('.imgSection').addClass('hide');
		$('.infoSection').removeClass('hide');
		
		$('#tabInfoLabel').addClass('selectedTab');
		$('#tabImgLabel').removeClass('selectedTab');
	});
	
	
	/* 여러개면 이것이 필요해 
	
	$('#rd-appliPassedFilter_new').attr('checked', 'checked');
	
	//리스트 아이템을 누르면 addClass removeClass를 반복한다. 이거 함수로 만들어볼깡
	$('.appli-li-filter').click(function(){
		const num=$('.appli-li-filter').index($(this));
		//선택한 (바뀔) 탭메뉴의 인덱스를 가져온다
		$('.lb-appliPassedFilter').removeClass("lb-appliPassedFilter-selected");
		//전체 리스트에 대해 셀렉티드 클래스 제거
		$('.lb-appliPassedFilter:eq('+num+')').addClass("lb-appliPassedFilter-selected");
		//선택한 탭메뉴 인덱스에 클래스 추가
	});
	
	
	*/
});


//이미지 업로드 기능 구현
	const imgFileInput= document.querySelector('#imgFileInput');
	
	$('#comServImgAddBtn').click(function(){
		imgFileInput.click();
	});
</script>
<body>
	<div class="container">
		<!-- 탭 섹션 -->
		<section class="positionTabSection">
			<div>
				<input type="radio" id="posTab-showAll" name="posTab" />
				<label for="posTab-showAll" id="tabImgLabel" class="comInfoRegiTab selectedTab">전체</label>
				<input type="radio" id="posTab-developer" name="posTab" class="comInfoRegiTab" />
				<label for="posTab-developer" id="tabInfoLabel" class="comInfoRegiTab">개발</label>
			</div>
			<div>
				<a id="positionAddBtn" class="btn btn-main btn-round-full" 
					href="<c:url value='/company/positionAdd.do'/>">포지션 추가</a>
			</div>
		</section>
		<!-- 채용중 -->
		<section class="posSection">
			<h2 class="comServTitle">채용중</h2>
			<div class="posBoxWrapper">
				<div class="posBoxWrapper2">
					<div class="posBox">
						<h4 class="posJikMu">Data & Backend Junior Developer</h4>
						<span class="posDueDate">상시</span>
					</div>
					<div class="posDueDateDiv">
						<a class="posDueDateLink" href="#">마감일 설정 <i class="fas fa-chevron-right"></i></a>
					</div>
				</div>
			</div>
		</section>
		<section class="posSection">
			<h2 class="comServTitle">심사중</h2>
			<div class="posBoxWrapper">
				<div class="posBoxWrapper2">
					<div class="posBox">
						<h4 class="posJikMu">Data & Backend Junior Developer</h4>
						<span class="posDueDate">상시</span>
					</div>
					<div class="posDueDateDiv">
						<a class="posDueDateLink" href="#">마감일 설정 <i class="fas fa-chevron-right"></i></a>
					</div>
				</div>
			</div>
		</section>
		<section class="posSection posSectionTemp">
			<h2 class="comServTitle posSectionTemp">임시 저장</h2>
			<div class="posBoxWrapper">
				<div class="posBoxWrapper2">
					<div class="posBox">
						<h4 class="posJikMu posSectionTemp">Data & Backend Junior Developer</h4>
						<span class="posDueDate posSectionTemp">상시</span>
					</div>
				</div>
			</div>
		</section>
	</div>
</body>
</html>