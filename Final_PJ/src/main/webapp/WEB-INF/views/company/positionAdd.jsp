<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/position.css'/>">
<script type="text/javascript">
$(function(){
	
	//신입 선택시 인풋입력 readonly, 경력 선택시 해제
	$('#positionAdd-oldieChk').click(function(){
		$('.positionAdd-year').prop('disabled', false);
	});
	$('.positionAdd-year').click(function(){
		$('#positionAdd-oldieChk').prop('checked', 'checked');
	});
	$('#positionAdd-newbieChk').click(function(){
		$('.positionAdd-year').prop('disabled', true);
		$('.positionAdd-year').val('');
	});
	
	//마감일 선택하면 상시 체크해제, 상시 체크하면 마감일 초기화
	console.log($('#positionAdd-everytimeChk').is(':checked'));
	$('#positionAdd-everytimeChk').click(function(){
		if($('#positionAdd-everytimeChk').is(':checked')){
			$('#positionAdd-DueDatePicker').prop('disabled', true);
			$('#positionAdd-DueDatePicker').val('yyyy-MM-dd');
		}else{
			$('#positionAdd-DueDatePicker').prop('disabled', false);
		}
	});
	
});
</script>
</head>
<body>
	<div class="container">
		<h1>포지션 추가</h1>
		<div class="positionAdd-wrapper">
			<section class="positionAdd-1stSec"> <!-- 포지션 조건 등록 영역 -->
				<div class="positionAdd-spanDivBound">
					<div class="positionAdd-jikgunjikmu">
						<div class="positionAdd-select">
							<span class="positionAdd-TitleSpan">직군</span>
							<select class="positionAdd-select">
							
							</select>
						</div>
						<div class="positionAdd-select">
							<span class="positionAdd-TitleSpan">직무</span>
							<select class="positionAdd-select">
							
							</select>
						</div>
					</div>
					<span class="positionAdd-guideSpan">포지션이 다른 경우 포지션을 각각 등록해야 합니다.</span>
					<div class="positionAdd-selectedJikMuBoundDivs">
						<div class="positionAdd-selectedJikMuBound">
							<label class="positionAdd-selectedJikmu">선택직무1dddddd</label>
							<button><i class="fas fa-times"></i></button>
						</div>
						<div class="positionAdd-selectedJikMuBound">
							<label class="positionAdd-selectedJikmu">선택직무1dddddd</label>
							<button><i class="fas fa-times"></i></button>
						</div>
						<div class="positionAdd-selectedJikMuBound">
							<label class="positionAdd-selectedJikmu">선택직무1dddddd</label>
							<button><i class="fas fa-times"></i></button>
						</div>
					</div>
				</div>
				<div class="positionAdd-spanDivBound">
				</div>
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">경력</span>
					<div class="positionAdd-years">
						<input type="radio" name="positionAdd-career" id="positionAdd-newbieChk"><label for="positionAdd-newbieChk">신입</label>
						<input type="radio" name="positionAdd-career" id="positionAdd-oldieChk"><label for="positionAdd-oldieChk">경력</label>
						<input type="number" class="positionAdd-year" name="positionAdd-startYear"><span>~</span>
						<input type="number" class="positionAdd-year" name="positionAdd-endYear"><span>년</span>
					</div>
					<span class="positionAdd-guideSpan">인턴 포지션은 등록이 불가합니다. 계약직 포지션은 계약 기간 1년 이상, 예상 연봉 4000만원 이상 등록 가능합니다.</span>
				</div>
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">채용시 예상 연봉 (최소~최대)</span>
					<input type="number">
					<span>~</span>
					<input type="number"><span>만 원</span>
					<span class="positionAdd-guideSpan">연봉 정보는 보상금 산정과 통계 자료로만 쓰이며, 개별 연봉 정보는 절대 공개되지 않습니다.</span>
				</div>
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">마감일</span>
					<div class="positionAdd-DueDate">
						<input type="date" id="positionAdd-DueDatePicker" placeholder="YYYY/MM/DD">
						<input type="checkbox" id="positionAdd-everytimeChk">
						<label for="positionAdd-everytimeChk">상시</label>
					</div>
				</div>
				<div class="positionAdd-contentsWrapper">
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">포지션명</span>
						<input type="text">
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">포지션 공고·서론</span>
						<textarea></textarea>
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">주요업무</span>
						<textarea></textarea>
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">자격요건</span>
						<textarea></textarea>
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">우대사항(선택)</span>
						<textarea></textarea>
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">혜택 및 복지</span>
						<textarea></textarea>
					</div>
				</div>
				<div class="positionAdd-abroadBound">
					<input type="checkbox" id="positionAdd-abroadChk">
					<label for="positionAdd-abroadChk">해외채용</label>
					<select class="positionAdd-select">
						<option>국가 선택</option>
					</select>	
				</div>
			</section>
			<section class="positionAdd-2ndSec"> <!-- 지원 알림 이메일 (관리자 추가) -->
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">지원 알림 이메일(관리자 추가)</span>
					<div class="positionAdd-managerEmail">
						<label>asb@gmail.com</label>
						<button class="positionAdd-managerEmailDelBtn"><i class="fas fa-times"></i></button>
					</div>
					<div class="positionAdd-managerEmail">
						<label>asb@gmail.com</label>
						<button class="positionAdd-managerEmailDelBtn"><i class="fas fa-times"></i></button>
					</div>
					<div class="positionAdd-mngEmailAddBound">
						<input class="positionAdd-mngEmailInput" type="text" placeholder="example@company.com">
						<button class="positionAdd-mngEmailAddBtn">추가</button>
					</div>
				</div>
			</section>
		</div>
	</div>
	<section class="positionAdd-btnSec">
		<div class="container">
		<button class="positionAdd-btn positionAdd-btn-temp">임시저장</button>
		<button class="positionAdd-btn positionAdd-btn-request">승인 요청하기</button>
		</div>
	</section>
</body>
</html>