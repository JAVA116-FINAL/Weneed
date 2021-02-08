<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="<c:url value='/resources/css/companyService/matchup.css'/>">
<script type="text/javascript">

$(function(){
	/* //mincareer maxcareer 세팅해주기
	var minCareer=$('input[name=searchMinCareer]').val();
	console.log(minCareer);
	var maxCareer=$('input[name=searchMaxCareer]').val();
	console.log(maxCareer);
	
	if(minCareer=='전체'){
		$('#minCareerSelect option:eq(0)').attr("selected","selected");
	}else if(minCareer='신입'){
		$('#minCareerSelect option:eq(1)').attr("selected","selected");
	}else if(minCareer='1'){
		$('#minCareerSelect option:eq(2)').attr("selected","selected");
	}else if(minCareer='2'){
		$('#minCareerSelect option:eq(3)').attr("selected","selected");
	}else if(minCareer='3'){
		$('#minCareerSelect option:eq(4)').attr("selected","selected");
	}else if(minCareer='4'){
		$('#minCareerSelect option:eq(5)').attr("selected","selected");
	}else if(minCareer='5'){
		$('#minCareerSelect option:eq(6)').attr("selected","selected");
	}else if(minCareer='6'){
		$('#minCareerSelect option:eq(7)').attr("selected","selected");
	}else if(minCareer='7'){
		$('#minCareerSelect option:eq(8)').attr("selected","selected");
	}
	 
	if(maxCareer=='전체'){
		$('#maxCareerSelect option:eq(0)').attr("selected",true);
	}else if(maxCareer='신입'){
		$('#maxCareerSelect option:eq(1)').attr("selected",true);
	}else if(maxCareer='1'){
		$('#maxCareerSelect option:eq(2)').attr("selected","selected");
	}else if(maxCareer='2'){
		$('#maxCareerSelect option:eq(3)').attr("selected",true);
	}else if(maxCareer='3'){
		$('#maxCareerSelect option:eq(4)').attr("selected",true);
	}else if(maxCareer='4'){
		$('#maxCareerSelect option:eq(5)').attr("selected",true);
	}else if(maxCareer='5'){
		$('#maxCareerSelect option:eq(6)').attr("selected",true);
	}else if(maxCareer='6'){
		$('#maxCareerSelect option:eq(7)').attr("selected",true);
	}else if(maxCareer='7'){
		$('#maxCareerSelect option:eq(8)').attr("selected",true);
	}
	 */
	//리스트 선택 시 표시해주기
	$('.matchupSearch-li').click(function(){
		var num=$(this).index(); //부모 요소를 기준으로 내가 몇번째 자식이냐
		$('.matchupSearch-li').removeClass('matchupSearch-selectedLi');
		$('.matchupSearch-li:eq('+num+')').addClass('matchupSearch-selectedLi')
	});
	
	//찜 버튼 금색 토글
	$(document).on('click', '.matchupSearch-ZzimBtn', function(){
		if($(this).children('i').hasClass('goldStar')){
			$(this).children('i').removeClass('goldStar');
			//찜에서 빼기도 해야하는구만
			var resumeStr=$(this).parent().siblings('.matchupSearch-resume-1st').children('span').text();
			//console.log(resumeStr.substr(3));
			var resumeNo=parseInt(resumeStr.substr(3), 10);
			$.ajax({
				url:"<c:url value='/company/delZzim.do'/>",
				type:"get",
				dataType:"text",
				data:{"resumeNo":resumeNo},
				success:function(result){
					console.log(result);
				},
				error:function(xhr, status, error){
					console.log("에러!:"+error);
				}
			});
		}else{
			$(this).children('i').addClass('goldStar');
			//찜하기를 해볼거예요
			//이력서번호 넘기고 세션에서 컴코드 받아와서 넘기고
			//컨트롤러에서 이력서 번호로 매치업일반넘버 찾아
			var resumeStr=$(this).parent().siblings('.matchupSearch-resume-1st').children('span').text();
			//console.log(resumeStr.substr(3));
			var resumeNo=parseInt(resumeStr.substr(3), 10);
			//console.log(resumeNo);
			
			$.ajax({
				url:"<c:url value='/company/addZzim.do'/>",
				type:"get",
				dataType:"text",
				data:{"resumeNo":resumeNo},
				success:function(result){
					//alert('성공');
					console.log(result);
				},
				error:function(xhr, status, error){
					alert('error: '+error);
				}
			});
		}
	});
	
	//더보기 기능 구현
	$('#matchupSearch-viewMoreBtn').click(function(){
		//console.log('눌렀당');
		var viewMoreSize=parseInt($('#matchupSearch-record').val(), 10);
		var keyword=$('#matchupSearchkeyword').val();
		var minCareer=$('#minCareerSelect').val();
		var maxCareer=$('#maxCareerSelect').val();
		var jikmu=$('#matchupSearch-jikmuSelect').val();
		var jikgun=$('#matchupSearch-jikgunSelect').val();
		viewMoreSize+=5;
		console.log(viewMoreSize);
		$.ajax({
			url:"<c:url value='/company/viewMoreMatchupMem.do'/>",
			dataType:"json",
			type:"get",
			data:{
				"viewMoreSize":viewMoreSize,
				"searchKeyword":keyword,
				"searchMaxCareer":maxCareer,
				"searchMinCareer":minCareer,
				"searchJikmu":jikmu,
				"searchJikgun":jikgun
			},
			success:function(memList){
				//alert('성공!');
				console.log(memList);
				for(mcumem of memList){
					makeMemList(mcumem);
				}
				$('#matchupSearch-record').val(viewMoreSize);
				$('input[name=searchKeyword]').val(keyword);
				$('input[name=searchMinCareer]').val(minCareer);
				$('input[name=searchMaxCareer]').val(maxCareer);
				$('input[name=searchJikmu]').val(jikmu);
				$('input[name=searchJikgun]').val(jikgun);
				$('#matchupSearchkeyword').val(keyword);
			},
			error:function(error){
				alert('error!:'+error);
			}
		});
	});
	
	//검색버튼 클릭하면 새로고침해서 이 페이지로 돌아오기
	$('.matchupSearch-searchBtn').click(function(){
		var keyword=$('#matchupSearchkeyword').val();
		var minCareer=$('#minCareerSelect option:selected').val();
		var maxCareer=$('#maxCareerSelect option:selected').val();
		var jikmu=$('#matchupSearch-jikmuSelect').val();
		var jikgun=$('#matchupSearch-jikgunSelect').val();
		$('input[name=searchKeyword]').val(keyword);
		$('input[name=searchMinCareer]').val(minCareer);
		$('input[name=searchMaxCareer]').val(maxCareer);
		$('input[name=searchJikmu]').val(jikmu);
		$('input[name=searchJikgun]').val(jikgun);
		
		$('form[name=matchupSearchForm]').submit();
		
	});
	
	//찜한 이력서 보기.. 이 경우엔 검색어랑 경력 다 같이 가야할거같은뎅... 
	$('#matchupSearch-Zzimed-list').click(function(){
		
	});
	
});

function makeMemList(mcumem){
	var str="";
	str+='<div class="matchupSearch-resumeBound">';
	str+='<div class="matchupSearch-resume-1st">';
	str+='<i class="fas fa-user-tie"></i>';
	str+='<span>No.'+ mcumem.RESUMENO +'</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-2nd">';
	str+='<span>직군직종명</span>';
	str+='<span>';
	
	if(mcumem.CAREER == '신입'){
		str+=mcumem.CAREER+'</span>';
	}else{
		str+=mcumem.CAREER+'년 경력</span>';
	}
	str+='<span>'+mcumem.EDUNAME+' '+mcumem.EDUMAJOR+'</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-3rd">';
	str+='<button class="matchupSearch-ZzimBtn"><i class="fas fa-star"></i> 찜</button>';
	str+='<button>이력서 미리보기</button>';
	str+='</div></div>';

	$('#matchupSearch-resumeListDiv').append(str);
	
}

</script>
	<form name="matchupSearchForm" method="post" action="#">
		<input type="hidden" id="matchupSearch-record" value="0">
		<input type="hidden" value="${searchVo.searchJikgun }" name="searchJikgun">
		<input type="hidden" value="${searchVo.searchJikmu }" name="searchJikmu">
		<input type="hidden" value="${searchVo.searchKeyword }" name="searchKeyword">
		<input type="text" value="${searchVo.searchMinCareer }" name="searchMinCareer">
		<input type="text" value="${searchVo.searchMaxCareer }" name="searchMaxCareer">
	</form>
	<div class="container"> <!-- 가장 바깥 래퍼 --> 
		<section class="matchupSearch-1stSec"> <!-- 이름, 검색필터, 검색창, 필터 -->
			<h1>찾고 있는 인재의 직군/직무를 설정하세요</h1>
			<select id="matchupSearch-jikgunSelect" class="matchupSearch-select matchupSearch-selectShort">
				<c:forEach var="jikgunVo" items="${jikgunList}">
					<option value="${jikgunVo.jikgunCode}">${jikgunVo.jikgunName}</option>			
				</c:forEach>
			</select>
			<select id="matchupSearch-jikmuSelect" class="matchupSearch-select matchupSearch-selectLong"> 
				<option value="all">전체</option>
				<c:forEach var="jikmuVo" items="${jikmuList}">
					<option value="${jikmuVo.jikmuCode}">${jikmuVo.jikmuName}</option>			
				</c:forEach>
			</select>
			<div class="matchupSearch-searchFilter">
				<!-- <div class="matchupSearch-filter"> 
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>국가 선택</option>
						<option>한국</option>
						<option>일본</option>
						<option>대만</option>
						<option>홍콩</option>
						<option>싱가폴</option>
					</select>
				</div>  -->
				<!-- 드롭다운 -->
				<!-- 분량이 안될거같으면 삭제 <div class="matchupSearch-filter">
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>언어 선택</option>
						<option>한국어</option>
						<option>일본어</option>
						<option>중국어</option>
						<option>영어</option>
					</select>
				 드롭다운 -->
				 <div class="matchupSearch-filter"> 
				 	<span style="font-weight: bold; font-size: 0.8em;">최소 경력</span>
					<select id="minCareerSelect" class="matchupSearch-select matchupSearch-select-sub">
						<option value="전체"
							<c:if test="${searchVo.searchMinCareer eq '전체'}">
								selected
							</c:if>
						>전체</option>
						<option value="신입"<c:if test="${searchVo.searchMinCareer eq '신입'}">
								selected
							</c:if>
						>신입</option>
						<option value="1"
							<c:if test="${searchVo.searchMinCareer eq '1'}">
								selected
							</c:if>
						>1년</option>
						<option value="2"
							<c:if test="${searchVo.searchMinCareer eq '2'}">
								selected
							</c:if>
						>2년</option>
						<option value="3"
							<c:if test="${searchVo.searchMinCareer eq '3'}">
								selected
							</c:if>
						>3년</option>
						<option value="4"
							<c:if test="${searchVo.searchMinCareer eq '4'}">
								selected
							</c:if>
						>4년</option>
						<option value="5"
							<c:if test="${searchVo.searchMinCareer eq '5'}">
								selected
							</c:if>
						>5년</option>
						<option value="6"
							<c:if test="${searchVo.searchMinCareer eq '6'}">
								selected
							</c:if>
						>6년</option>
						<option value="7"
							<c:if test="${searchVo.searchMinCareer eq '7'}">
								selected
							</c:if>
						>7년</option>
						<option value="8"
							<c:if test="${searchVo.searchMinCareer eq '8'}">
								selected
							</c:if>
						>8년</option>
						<option value="9"
							<c:if test="${searchVo.searchMinCareer eq '9'}">
								selected
							</c:if>
						>9년</option>
						<option value="10"
							<c:if test="${searchVo.searchMinCareer eq '10'}">
								selected
							</c:if>
						>10년 이상</option>
					</select>
				</div> 
				<div class="matchupSearch-filter"> 
					<span style="font-weight: bold; font-size: 0.8em;">최대 경력</span>
					<select id="maxCareerSelect" class="matchupSearch-select matchupSearch-select-sub">
						<option value="전체"
							<c:if test="${searchVo.searchMaxCareer eq '전체'}">
								selected
							</c:if>
						>전체</option>
						<option value="신입"
							<c:if test="${searchVo.searchMaxCareer eq '신입'}">
								selected
							</c:if>
						>신입</option>
						<option value="1"
							<c:if test="${searchVo.searchMaxCareer eq '1'}">
								selected
							</c:if>
						>1년</option>
						<option value="2"
							<c:if test="${searchVo.searchMaxCareer eq '2'}">
								selected
							</c:if>
						>2년</option>
						<option value="3"
							<c:if test="${searchVo.searchMaxCareer eq '3'}">
								selected
							</c:if>
						>3년</option>
						<option value="4"
							<c:if test="${searchVo.searchMaxCareer eq '4'}">
								selected
							</c:if>
						>4년</option>
						<option value="5"
							<c:if test="${searchVo.searchMaxCareer eq '5'}">
								selected
							</c:if>
						>5년</option>
						<option value="6"
							<c:if test="${searchVo.searchMaxCareer eq '6'}">
								selected
							</c:if>
						>6년</option>
						<option value="7"
							<c:if test="${searchVo.searchMaxCareer eq '7'}">
								selected
							</c:if>
						>7년</option>
						<option value="8"
							<c:if test="${searchVo.searchMaxCareer eq '8'}">
								selected
							</c:if>
						>8년</option>
						<option value="9"
							<c:if test="${searchVo.searchMaxCareer eq '9'}">
								selected
							</c:if>
						>9년</option>
						<option value="10"
							<c:if test="${searchVo.searchMaxCareer eq '10'}">
								selected
							</c:if>
						>10년 이상</option>
					</select>
				</div> 
				<div class="matchupSearch-searchDiv">
					<input class="matchupSearch-searchInput" id="matchupSearchkeyword" type="text" 
						value="${searchVo.searchKeyword }" placeholder="회사명, 학교, 스킬 검색">
					<button class="matchupSearch-searchBtn"><i class="fas fa-search"></i></button>
				</div>
				<!-- <div class="matchupSearch-rangeSlider">
					<div class="matchupSearch-rangeSliderLabel">
						<label class="matchupSearch-label" for="amount">경력</label>
						<input type="text" id="amount" readonly style="border:0; font-weight:bold;">
					</div>
					Range Slider
					<div id="slider-range"></div>
				</div>  -->
			</div>
		</section>
		<section class="matchupSearch-2ndSec"> <!-- 목록  -->
			<div class="matchupSearch-tabBound">
				<ul class="matchupSearch-resultList">
					<li class="matchupSearch-li matchupSearch-selectedLi">목록 전체</li>
					<li class="matchupSearch-li" id="matchupSearch-Zzimed-list">찜한 이력서</li>
					<li class="matchupSearch-li">미열람 이력서</li>
					<li class="matchupSearch-li">열람한 이력서</li>
					<li class="matchupSearch-li">면접 제안한 이력서</li>
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
			<div id="matchupSearch-resumeListDiv">
			<!-- 
			 select m.resume_no as resumeNo, m.mem_no as memNo, m.expertise_no as expertiseNo, 
				  m.jobsearch_flag as jobSearchFlag, m.resumeopen_flag as resumepenFlag,
				  r.resume_title as resumeTitle, r.resume_name as resumeName, r.resume_introduce as resumeIntroduce, 
				  r.lang_flag as langFlag from matchupMem m join resume r 
				  on m.resume_No = r.resume_no 
			 -->
			 	<c:if test="${!empty emptyCheck }">
			 		<div style="text-align: center; padding: 50px 100px;">
				 		<span>검색결과가 없습니다. 다시 검색해 주세요.</span>
			 		</div>
			 	</c:if>
			 	<c:if test="${empty emptyCheck }">
					<c:forEach var="mcumemMap" items="${memList }">
						<div class="matchupSearch-resumeBound">
							<div class="matchupSearch-resume-1st">
								<i class="fas fa-user-tie"></i>
								<span>No.${mcumemMap.RESUMENO}</span>
							</div>
							<div class="matchupSearch-resume-2nd"> <!-- 이력서 목록 -->
								<span>직군직종</span>
								<span>
									<c:if test="${mcumemMap.CAREER eq '신입' }">
										${mcumemMap.CAREER}
									</c:if>
									<c:if test="${mcumemMap.CAREER ne '신입' }">
										${mcumemMap.CAREER}년 경력
									</c:if>
								</span>
								<span>${mcumemMap.EDUNAME} ${mcumemMap.EDUMAJOR}</span>
							</div>
							<div class="matchupSearch-resume-3rd">
								<button class="matchupSearch-ZzimBtn">
									<i class="fas fa-star <c:if test="${mcumemMap.CNT eq 1}">goldStar</c:if>
									"></i> 찜</button>
								<button>이력서 미리보기</button>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
			<c:if test="${fn:length(memList)==5}">
				<div class="matchupSearch-resume-paging">
					<div id="matchupSearch-viewMoreBtn" class="matchupSearch-pagingDiv matchupSearch-pagingDiv_next" >더보기</div>
				</div>
		 	</c:if>
		</section>			
	</div>
</body>
</html>