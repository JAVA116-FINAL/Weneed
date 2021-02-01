<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/companyService/matchup.css'/>">
<script type="text/javascript">
$(function(){
	//경력 슬라이더
	$("#slider-range").slider({
		range: true,
		min: 0,
		max: 30,
		values: [ 0, 30 ],
		slide: function(event,ui) {
			$("#amount").val(ui.values[0] +" - "+ ui.values[1]+"년");
		}
	});
	$("#amount").val($("#slider-range").slider("values",0)
			+" - "+$("#slider-range").slider("values",1)+"년");
	
	//리스트 선택 시 표시해주기
	$('.matchupSearch-li').click(function(){
		var num=$(this).index(); //부모 요소를 기준으로 내가 몇번째 자식이냐
		$('.matchupSearch-li').removeClass('matchupSearch-selectedLi');
		$('.matchupSearch-li:eq('+num+')').addClass('matchupSearch-selectedLi')
	});
	
	//찜 버튼 금색 토글
	$('#matchupSearch-ZzimBtn').click(function(){
		if($(this).children('i').hasClass('goldStar')){
			$(this).children('i').removeClass('goldStar');
		}else{
			$(this).children('i').addClass('goldStar');
		}
	});
	
	
});
</script>
	<div class="container"> <!-- 가장 바깥 래퍼 --> 
		<section class="matchupSearch-1stSec"> <!-- 이름, 검색필터, 검색창, 필터 -->
			<h1>찾고 있는 인재의 직군/직무를 설정하세요</h1>
			<select id="matchupSearch-jikgunSelect" class="matchupSearch-select matchupSearch-selectShort">
				<c:forEach var="jikgunVo" items="${jikgunList}">
					<option value="${jikgunVo.jikgunCode}">${jikgunVo.jikgunName}</option>			
				</c:forEach>
			</select>
			<!-- 여기도 아작스 써야 하는데 일단 그냥 함 -->
			<select id="matchupSearch-jikmuSelect" class="matchupSearch-select matchupSearch-selectLong"> 
				<c:forEach var="jikmuVo" items="${jikmuList}">
					<option value="${jikmuVo.jikmuCode}">${jikmuVo.jikmuName}</option>			
				</c:forEach>
			</select>
			<div class="matchupSearch-searchFilter">
				<div class="matchupSearch-searchDiv">
					<input class="matchupSearch-searchInput" type="text" placeholder="회사명, 학교, 스킬 검색">
					<button class="matchupSearch-searchBtn"><i class="fas fa-search"></i></button>
				</div>
				<div class="matchupSearch-filter"> 
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>국가 선택</option>
						<option>한국</option>
						<option>일본</option>
						<option>대만</option>
						<option>홍콩</option>
						<option>싱가폴</option>
					</select>
				</div> <!-- 드롭다운 -->
				<div class="matchupSearch-filter">
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>언어 선택</option>
						<option>한국어</option>
						<option>일본어</option>
						<option>중국어</option>
						<option>영어</option>
					</select>
				</div> <!-- 드롭다운 -->
				<div class="matchupSearch-rangeSlider">
					<div class="matchupSearch-rangeSliderLabel">
						<label class="matchupSearch-label" for="amount">경력</label>
						<input type="text" id="amount" readonly style="border:0; font-weight:bold;">
					</div>
					<!-- Range Slider -->
					<div id="slider-range"></div>
				</div> 
			</div>
		</section>
		<section class="matchupSearch-2ndSec"> <!-- 목록  -->
			<div class="matchupSearch-tabBound">
				<ul class="matchupSearch-resultList">
					<li class="matchupSearch-li matchupSearch-selectedLi">목록 전체</li>
					<li class="matchupSearch-li">요청 후 받은 이력서</li>
					<li class="matchupSearch-li">찜한 목록</li>
					<li class="matchupSearch-li">미열람 목록</li>
					<li class="matchupSearch-li">열람한 목록</li>
					<li class="matchupSearch-li">면접 제안한 목록</li>
				</ul>
			</div>
			<div class="matchupSearch-resultOrderFilters">
				<input type="radio" id="matchupSearch-orderFilter-new" name="matchupSearch-orderFilter" value="new">
				<label class="matchupSearch-orderFilterLb" for="matchupSearch-orderFilter-new">최신순</label>
				<input type="radio" id="matchupSearch-orderFilter-read" name="matchupSearch-orderFilter" value="read">
				<label class="matchupSearch-orderFilterLb" for="matchupSearch-orderFilter-read">열람순</label>
			</div>
		</section>
		<section class="matchupSearch-resumeList">
			<div class="matchupSearch-resumeBound">
				<c:forEach var="matchupMemVo" items="${matchupMemList }">
					<div class="matchupSearch-resume-1st">
						<img src="#">
						<span>${matchupMemVo.resumeNo}</span>
					</div>
					<div class="matchupSearch-resume-2nd"> <!-- 이력서 목록 -->
						
						<span>직군직종명</span>
						
						<span>6년 경력</span>
						
						<span>학력대학교 무슨학과</span>
					
					</div>
					<div class="matchupSearch-resume-3rd">
						<button id="matchupSearch-ZzimBtn"><i class="fas fa-star"></i> 찜</button>
						<button>이력서 미리보기</button>
					</div>
				</c:forEach>
			</div>
			<div class="matchupSearch-resume-paging">
				<div class="matchupSearch-pagingDiv matchupSearch-pagingDiv_prev">이전</div>
				<div class="matchupSearch-pagingDiv matchupSearch-pagingDiv-page matchupSearch-pagingDiv-curPage">1</div>
				<div class="matchupSearch-pagingDiv matchupSearch-pagingDiv-page">2</div>
				<div class="matchupSearch-pagingDiv matchupSearch-pagingDiv_next">다음</div>
			</div>
		</section>			
	</div>
</body>
</html>