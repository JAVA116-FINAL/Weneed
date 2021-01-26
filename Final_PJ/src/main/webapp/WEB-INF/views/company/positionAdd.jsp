<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/position.css'/>">
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
				</div>
				<div class="positionAdd-spanDivBound">
				</div>
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">경력</span>
					<div class="positionAdd-years">
						<input type="checkbox"><label>신입</label>
						<input type="checkbox"><label>경력</label>
						<input type="number">~<input type="number"><span>년</span>
					</div>
					<span class="positionAdd-guideSpan">인턴 포지션은 등록이 불가합니다. 계약직 포지션은 계약 기간 1년 이상, 예상 연봉 4000만원 이상 등록 가능합니다.</span>
				</div>
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">채용시 예상 연봉 (최소~최대)</span>
					<span class="positionAdd-guideSpan">연봉 정보는 보상금 산정과 통계 자료로만 쓰이며, 개별 연봉 정보는 절대 공개되지 않습니다.</span>
					<input type="number">~<input type="number"><span>만 원</span>
				</div>
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">마감일</span>
					<div class="positionAdd-DueDate">
						<input type="date" placeholder="YYYY/MM/DD">
						<input type="checkbox"><label>상시</label>
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
				<input type="checkbox"><label>해외채용</label>		
			</section>
			<section class="positionAdd-2ndSec"> <!-- 지원 알림 이메일 (관리자 추가) -->
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan">지원 알림 이메일(관리자 추가)</span>
					<div class="positionAdd-managerEmail">
						<label>asb@gmail.com</label>
						<button class="positionAdd-managerEmailAddBtn"><i class="fas fa-times"></i></button>
					</div>
					<div class="positionAdd-managerEmail">
						<label>asb@gmail.com</label>
						<button class="positionAdd-managerEmailAddBtn"><i class="fas fa-times"></i></button>
					</div>
					<input class="positionAdd-mngEmailInput" type="text" placeholder="example@company.com">
				</div>
			</section>
			
			<section>
				<button>임시저장</button>
				<button>승인 요청하기</button>
			</section>
		</div>
	</div>
</body>
</html>