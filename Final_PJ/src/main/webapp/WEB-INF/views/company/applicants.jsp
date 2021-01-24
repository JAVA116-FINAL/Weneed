<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/applicants.css'/>">
<script type="text/javascript">
$(function(){
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
	
});
	
</script>
<body>
<div class="container">
	<div class="appli-wrapper">
		<aside> <!-- 해당 기업코드로 등록된 포지션들의 직군코드를 불러와 리스트에 뿌려줘야 함 -->
			<div class="appli-positionList">
				<h5 class="appli-positionList-title">채용중</h5>
				<li class="appli-positionList-pos appli-positionList-pos_selected">전체 포지션</li>
				<li class="appli-positionList-pos">JAVA 개발자</li>
			</div>
			<div class="appli-positionList appli-positionList-closed">
				<h5 class="appli-positionList-title">종료</h5>
			</div>
		</aside>
		<div> <!-- contents 영역 -->
			<section> <!-- 상단 응답률 / 안내문구 섹션 -->
				<div> <!-- 정보 조회성 영역 -->
					<div class="appli-responseInfo"> 
						<div class="appli-responseInfo_obj">
							<span class="appli-span-allResponse">전체 응답률</span>&nbsp;
							<strong class="appli-bigNumber-blue">95.0%</strong>
						</div>
						<div class="appli-responseInfo_obj">
							<span>응답 지연</span>&nbsp;
							<strong class="appli-bigNumber-red">0명</strong>
						</div>
					</div>
					<div>
						<p class="appli-notiGuide">지원자에게 15일 안에 합격/불합격 소식을 알려주세요. 좋은 후보자는 여러 곳에서 제안을 받습니다. 타이밍을 놓치지 마세요.</p>
					</div>
				</div>
			</section>
			<section> <!-- 라디오버튼 선택 시 flag에 따른 리스트 노출 섹션-->
				<div class="appli-filterNsearch"> <!-- 라디오버튼 필터 / 검색창 -->
					<div> <!-- 라디오버튼 필터 -->
						<ul class="appli-ul-filter">
							<li class="appli-li-filter">
								<input type="radio" name="rd-appliPassedFilter" id="rd-appliPassedFilter_new" checked="checked">
								<label for="rd-appliPassedFilter_new" class="lb-appliPassedFilter lb-appliPassedFilter-selected">신규 (0)</label></li>
							<li class="appli-li-filter">
								<input type="radio" name="rd-appliPassedFilter" id="rd-appliPassedFilter_doc">
								<label for="rd-appliPassedFilter_doc" class="lb-appliPassedFilter">서류통과 (0)</label></li>
							<li class="appli-li-filter">
								<input type="radio" name="rd-appliPassedFilter" id="rd-appliPassedFilter_passed">
								<label for="rd-appliPassedFilter_passed" class="lb-appliPassedFilter">최종합격 (0)</label></li>
							<li class="appli-li-filter">
								<input type="radio" name="rd-appliPassedFilter" id="rd-appliPassedFilter_rejected">
								<label for="rd-appliPassedFilter_rejected" class="lb-appliPassedFilter">불합격 (0)</label></li>
							<li class="appli-li-filter">
								<input type="radio" name="rd-appliPassedFilter" id="rd-appliPassedFilter_timeout">
								<label for="rd-appliPassedFilter_timeout" class="lb-appliPassedFilter">기간만료 (0)</label></li>
						</ul>
					</div>
					<div class="appli-searchDiv"> <!-- 검색창 -->
						<input type="text" placeholder="지원자, 포지션 검색" class="appli-searchInput" style="height: 33px;">
						<button class="appli-searchIcon"><i class="fas fa-search"></i></button>
					</div>
				</div>
							<script>
								$(function(){
									$('#appli-checkAll').change(function(){
										if($('#appli-checkAllBox').is(":checked")){
											$('#appli-checkAll').removeClass("appli-checked");
										}else{
											$('#appli-checkAll').addClass("appli-checked");
										}
									});
								});
							</script>
				<div class="appli-statusChangeDiv"> <!-- 체크올, 상태변경, 지원자에게 결과를 알림 on/off, 별표지원자 모아보기 상태변경팝업도 띄워야겠네ㅋㅋ  -->
					<div class="appli-statusChangeDiv"> <!-- 체크, 상태변경, 지원자에게 결과알림 -->
						<div class="appli-statusChangeDiv"> <!-- 체크박스, 상태변경버튼  -->
							<label class="appli-checkAll" for="appli-checkAllBox">
								<input type="checkbox" id="appli-checkAllBox" name="appli-checkAll">
							</label>
							<button class="appli-btn-statusChange">상태변경</button>
							<!-- 상태변경 모달 include -->
						</div>
						<div class="appli-resultInfo-toggleWrapper"> <!-- 지원자에게 결과를 알림 토글버튼 -->
							<span>지원자에게 결과를 알림</span>&nbsp;
							<label class="appli-lb-resultInfo-toggle">
								<input type="checkbox" checked style="display:none">
								<span class="appli-slider appli-slider-round"></span>
							</label>
						</div>
					</div>
					<div> <!-- 별표 지원자 모아보기 -->
						<input type="checkbox" id="chkBox-staredApplis">
						<label for="chkBox-staredApplis" class="chkBox-staredApplis"></i>별표 지원자 모아보기</label>
					</div>
				</div>
				<div> <!-- 리스트 뿌리기.. 디비에서 읽어온걸로, 틀만 잡아주어봅시다 -->
					<!-- 리스트에 값 없을 때 -->
					<div class="appli-list-object-none">
						<p>아직 지원자가 없습니다.</p>
					</div>
					<!-- 리스트에 값 있을 때, 1개 객체  -->
					<div class="appli-list-object">
						<div class="appli-list-object_info">
							<div>
								<input type="checkbox" class="appli-object-ele appli-object-ele-chk">
								<i class="fas fa-star appli-object-ele appli-object-ele_gold"></i>
							</div>
							<div class="appli-list-object_infoResume appli-object-ele">
								<div class="appli-list-object_infoResumeImg">
									<i class="fas fa-user"></i>
								</div>
								<div>
									<p class="appli-resume-no">No.1277</p>
									<p class="appli-name-posJikgun">이이름 · 포지션직군명</p>
								</div>
							</div>
						</div>
						<div>
							<i class="far fa-clock"></i><span class="appli-waitingDays"> 1일째 기다림</span>					
						</div>
					</div>
				</div>
				<div class="appli-paging-divs"> <!-- 페이징 영역 -->
					<div class="appli-paging-div appli-paging-div_prev"><button>이전</button></div>
					<div class="appli-paging-div appli-paging-div_page"><a href="#">1</a></div>
					<div class="appli-paging-div appli-paging-div_next"><button>다음</button></div>
				</div>
				
			</section>
			<!-- 페이징 처리 -->
		</div>
	</div>
</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp" %>