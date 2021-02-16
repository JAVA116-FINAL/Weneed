<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/position.css'/>">
<script type="text/javascript">
//메일주소 합쳐주기
function emailBounding(){
	var emailBounds="";
	var emailCount=$('.positionAdd-managerEmail').length;
	console.log(emailCount);
	for(var i=1; i<=emailCount+1; i++){
		console.log('text: '+$('.positionAdd-managerEmail:nth-child('+i+') > label').text());
		if(emailBounds.length<1){
			emailBounds=$('.positionAdd-managerEmail:nth-child('+i+') > label').text();
		}else{
			emailBounds=emailBounds+","+$('.positionAdd-managerEmail:nth-child('+i+') > label').text();
		}
		console.log("emailBounds="+emailBounds);
	}		
	return emailBounds;
}

$(function(){
	//신입 선택시 경력인풋 disabled, 경력 선택시 해제
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
	//console.log($('#positionAdd-everytimeChk').is(':checked'));
	$('#positionAdd-everytimeChk').click(function(){
		if($('#positionAdd-everytimeChk').is(':checked')){
			$('#positionAdd-DueDatePicker').prop('disabled', true);
			$('#positionAdd-DueDatePicker').val();
		}else{
			$('#positionAdd-DueDatePicker').prop('disabled', false);
		}
	});
	
	//지원 알림 이메일 추가
	var emailCnt=1;
	$('#positionAdd-mngEmailAddBtn').click(function(){
		var addEmail="";
		//이메일 개수 한정
		if(emailCnt==5){
			alert('이메일 주소는 최대 5개까지 입력할 수 있습니다.');
			return false;
		}
		if($('#posMngEmails').val().length<1){
			alert('이메일 주소를 입력하세요.');
			$('#posMngEmails').focus();
			return false;
		}
		
		var email=$('#posMngEmails').val();
		console.log(email);
		//어쨌든 입력했으면 추가 노출
		addEmail+='<div class="positionAdd-managerEmail">';
		addEmail+='<label>'+email+'</label>';
		addEmail+='<button class="positionAdd-managerEmailDelBtn"><i class="fas fa-times"></i></button></div>'
		$('.positionAdd-mngEmailAddBound').before(addEmail);
		emailCnt++;
		console.log(emailCnt);
	});
	
	//이메일주소 삭제 기능, $(document)로 시작해야 함. 최초 화면 진입시엔 해당 클래스가 반영된 엘리먼트가 없음.
	$(document).on('click', '.positionAdd-managerEmailDelBtn', function(){
		console.log('삭제버튼 누름');
		$(this).parent().remove();
		emailCnt--;
		console.log(emailCnt);
	});
	
	var checkDate = document.getElementById('positionAdd-DueDatePicker');
	
	//임시저장 버튼 클릭하면  필수값 포지션명만 확인 후 저장
	$('#positionAdd-btn-temp').click(function(){
		if($('#posName').val().length<1){
			alert('포지션명을 입력하세요.');
			$('#posName').focus();
			return false;
		}
		
		//직무값 넣어주기
		for(var i=0;i<jikmus.length; i++){
			console.log(jikmus[i]);
			$('#posJikmu'+(i+1)).val(jikmus[i]);
		}
		
		$('#posEmails').val(emailBounding());
		$('#positionAddForm').submit();
	});	
	
	var jikmuCodes=[];
	var jikmus=[];
	var jikmuCnt=0;
	var jikmuNo=0;
	
	//승인요청 버튼 선택 시 (모두 검사함)
	$('#positionAdd-btn-request').click(function(){
		//유효성 검사
		var jikmuDivs=document.getElementById('positionAdd-selectedJikMuBoundDivs');
		//console.log(jikmuDivs.childElementCount);
		if( jikmuDivs.childElementCount < 1 ){
			alert('직무를 한 개 이상 선택하세요.');
			$('#positionAdd-jikgun').focus();
			return false;
		} 
		if(
			(
				!$('#positionAdd-oldieChk').is(':checked') //경력이 아예 체크 안된 경우
				&&	!$('#positionAdd-newbieChk').is(':checked')
			)
		 	||
		 	(
		 		$('#positionAdd-oldieChk').is(':checked') && //경력으로 체큰데
		 		(
		 			$('#pos_startYear').val().length<1 || //인풋 둘중에 하나라도 입력 안됐으면
		 	 		$('#pos_endYear').val().length<1
		 	 	)
		 	 )
		 ) {
		//신입이 선택되지 않았고 && 경력도 선택되지 않았다 || 경력이 선택됐고 인풋이 하나라도 비었다 
			alert('경력을 입력하세요.');
			$('#positionAdd-newbieChk').focus();			
			return false;
		}
		if($('#posMinSal').val().length<1 || $('#posMaxSal').val().length<1){
			alert('연봉정보를 입력하세요.');
			$('#posMinSal').focus();
			return false;
		}
		
		//console.log(checkDate.value);
		if(
			(checkDate.value == null)
			&& !$('#positionAdd-everytimeChk').is(':checked')
		){
			alert('마감일을 입력하세요.');
			$('#positionAdd-DueDatePicker').focus();
			return false;
		}
		if($('#posName').val().length<1){
			alert('포지션명을 입력하세요.');
			$('#posName').focus();
			return false;
		}
		if($('#posContext').val().length<1){
			alert('포지션 공고·서론을 입력하세요.');
			$('#posContext').focus();
			return false;
		}
		if($('#posCareer').val().length<1){
			alert('주요업무를 입력하세요.');
			$('#posCareer').focus();
			return false;
		}
		if($('#qualification').val().length<1){
			alert('자격요건을 입력하세요.');
			$('#qualification').focus();
			return false;
		}
		if($('#welfareBenefits').val().length<1){
			alert('혜택 및 복지를 입력하세요.');
			$('#welfareBenefits').focus();
			return false;
		}
		if(emailCnt<1){
			alert('이메일을 한 개 이상 입력하세요.');
			$('#posMngEmails').focus();
			return false;
		}
		
		//직무를 어딘가에 넣어줘야 함 최대 3개.. input hidden에 세팅해야 하나..
		for(var i=0;i<jikmus.length; i++){
			console.log(jikmus[i]);
			$('#posJikmu'+(i+1)).val(jikmus[i]);
		}
		
		//메일주소 바운딩		
		$('#posEmails').val(emailBounding());
		//상태값 승인요청 hidden = 2
		/* 채용포지션 상태 1 임시저장, 2 승인요청, 3 승인됨, 4 종료 */
		$('#posStatus').val('2');
		$('#positionAddForm').submit();
	});
	
	//직무 드롭다운 변경 시 해당 내용을 배열에 추가하고 tag노출. 배열은 submit 할 때 db로 넘어감
	$('#positionAdd-jikmu').change(function(){
		var jikmuName=$('#positionAdd-jikmu option:selected').text();
		var jikmuCode=$('#positionAdd-jikmu option:selected').val();
		var addJikmuDiv="";
		console.log(jikmuName);
		console.log(jikmuCode);
		if(jikmuName!='선택'){
			if(jikmuCnt>=3){
				alert('직무는 최대 3개까지만 선택 가능합니다.');
				return false;
			}else if(jikmus.includes(jikmuCode)){
				alert('이미 선택한 직무입니다.');
				return false;
			}else{
				jikmus.push("positionAdd-delJikmuBtn"+jikmuCode);
				console.log(jikmus);
				
				addJikmuDiv='<div class="positionAdd-selectedJikMuBound">';
				addJikmuDiv+='<label class="positionAdd-selectedJikmu">';
				addJikmuDiv+=jikmuName+"</label>";
				addJikmuDiv+='<button type="button" id="positionAdd-delJikmuBtn'+jikmuCode+'" class="positionAdd-delJikmuBtn">';
				addJikmuDiv+='<i class="fas fa-times"></i></button></div>';
				
				console.log(addJikmuDiv);
				
				$('#positionAdd-selectedJikMuBoundDivs').append(addJikmuDiv);
				jikmuCnt++;
				jikmuNo++;
			}
		}
	});
	
	//직무 삭제
	$(document).on('click', '.positionAdd-delJikmuBtn', function(){
	 	//직무 배열에서 빼주고 
		var jikmu=$(this).attr('id'); //형제의 텍스트값
		console.log(jikmu);
		console.log("인덱스: "+jikmus.indexOf(jikmu));
		jikmus.splice(jikmus.indexOf($(this)), 1); //배열에서 원소 제거
		//리무브 해주고
		$(this).parent().remove();
		jikmuCnt--;
	});
	
	//해외채용 선택 시
	$('#nationNameKr').change(function(){
		if($(this).val() != 'KR'){
			$('#positionAdd-abroadChk').prop('checked', 'checked');
		}else{
			$('#positionAdd-abroadChk').prop('checked', false);
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
				<form method="post" name="positionAddForm" id="positionAddForm" action="#">
					<input type="hidden" id="posStatus" name="posStatus" value="1">
					<input type="hidden" id="posJikmu1" name="posJikmus">
					<input type="hidden" id="posJikmu2" name="posJikmus">
					<input type="hidden" id="posJikmu3" name="posJikmus">
					<input type="hidden" id="posEmails" name="comEmails" value="${sessionScope.comMemId}">
				
					<div class="positionAdd-spanDivBound">
						<div class="positionAdd-jikgunjikmu">
							<div class="positionAdd-select">
								<span class="positionAdd-TitleSpan">직군</span>
								<select class="positionAdd-select" name="jikgunCode">
									<c:forEach var="jkVo" items="${jkList}">
										<option value="${jkVo.jikgunCode}">${jkVo.jikgunName}</option>
									</c:forEach>
								</select>
							</div>
							<div class="positionAdd-select">
								<span class="positionAdd-TitleSpan">직무</span>
								<select id="positionAdd-jikmu" class="positionAdd-select">
									<option>선택</option>
									<c:forEach var="jmVo" items="${jmList }">
										<option value="${jmVo.jikmuCode}">${jmVo.jikmuName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<span id="positionAdd-guidSpan-jikmuAdd" class="positionAdd-guideSpan">포지션이 다른 경우 포지션을 각각 등록해야 합니다.</span>
						<div id="positionAdd-selectedJikMuBoundDivs" class="positionAdd-selectedJikMuBoundDivs">
							<!-- jquery로 추가됨 -->
						</div>
					</div>
					<div class="positionAdd-spanDivBound">
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">경력</span>
						<div class="positionAdd-years">
							<input type="radio" name="posYear" id="positionAdd-newbieChk"><label for="positionAdd-newbieChk">신입</label>
							<input type="radio" name="posYear" id="positionAdd-oldieChk"><label for="positionAdd-oldieChk">경력</label>
							<input type="number" class="positionAdd-year" id="pos_startYear" name="minYear"><span>~</span>
							<input type="number" class="positionAdd-year" id="pos_endYear" name="maxYear"><span>년</span>
						</div>
						<span class="positionAdd-guideSpan">인턴 포지션은 등록이 불가합니다. 계약직 포지션은 계약 기간 1년 이상, 예상 연봉 4000만원 이상 등록 가능합니다.</span>
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">채용시 예상 연봉 (최소~최대)</span>
						<input type="number" id="posMinSal" name="posMinSal">
						<span>~</span>
						<input type="number" id="posMaxSal" name="posMaxSal" ><span>만 원</span>
						<span class="positionAdd-guideSpan">연봉 정보는 보상금 산정과 통계 자료로만 쓰이며, 개별 연봉 정보는 절대 공개되지 않습니다.</span>
					</div>
					<div class="positionAdd-spanDivBound">
						<span class="positionAdd-TitleSpan">마감일</span>
						<div class="positionAdd-DueDate">
							<input type="date" id="positionAdd-DueDatePicker" name="endDate">
							<input type="checkbox" id="positionAdd-everytimeChk">
							<label for="positionAdd-everytimeChk">상시</label>
						</div>
					</div>
					<div class="positionAdd-contentsWrapper">
						<div class="positionAdd-spanDivBound">
							<span class="positionAdd-TitleSpan">포지션명</span>
							<input type="text" id="posName" name="posName">
						</div>
						<div class="positionAdd-spanDivBound">
							<span class="positionAdd-TitleSpan">포지션 공고·서론</span>
							<textarea id="posContext" name="posContext"></textarea>
						</div>
						<div class="positionAdd-spanDivBound">
							<span class="positionAdd-TitleSpan">주요업무</span>
							<textarea id="posCareer" name="posCareer"></textarea>
						</div>
						<div class="positionAdd-spanDivBound">
							<span class="positionAdd-TitleSpan">자격요건</span>
							<textarea id="qualification" name="qualification"></textarea>
						</div>
						<div class="positionAdd-spanDivBound">
							<span class="positionAdd-TitleSpan">우대사항(선택)</span>
							<textarea id="preferentialTreatment" name="preferentialTreatment"></textarea>
						</div>
						<div class="positionAdd-spanDivBound">
							<span class="positionAdd-TitleSpan">혜택 및 복지</span>
							<textarea id="welfareBenefits" name="welfareBenefits"></textarea>
						</div>
					</div>
					<div class="positionAdd-abroadBound">
						<input type="checkbox" id="positionAdd-abroadChk" name="overseas">
						<label for="positionAdd-abroadChk">해외채용</label>
						<select class="positionAdd-select" id="nationNameKr" name="nationNameKr">
							<c:forEach var="nationVo" items="${nationList}">
								<option value="${nationVo.nationCode }">${nationVo.nationNameKr}</option>
							</c:forEach>
						</select>	
					</div>
				</form>
			</section>
			<section class="positionAdd-2ndSec"> <!-- 지원 알림 이메일 (관리자 추가) -->
				<div class="positionAdd-spanDivBound">
					<span class="positionAdd-TitleSpan" id="positionAdd-EmailTitle">지원 알림 이메일(관리자 추가)</span>
					<div class="positionAdd-managerEmail">
						<label>${sessionScope.comMemId}</label>
						<button class="positionAdd-managerEmailDelBtn"><i class="fas fa-times"></i></button>
					</div>
					<div class="positionAdd-mngEmailAddBound">
						<input class="positionAdd-mngEmailInput" id="posMngEmails" type="text" placeholder="example@company.com">
						<button class="positionAdd-mngEmailAddBtn" id="positionAdd-mngEmailAddBtn">추가</button>
					</div>
				</div>
			</section>
		</div>
	</div>
	<section class="positionAdd-btnSec">
		<div class="container">
		<button class="positionAdd-btn positionAdd-btn-temp" id="positionAdd-btn-temp">임시저장</button>
		<button class="positionAdd-btn positionAdd-btn-request" id="positionAdd-btn-request">승인 요청하기</button>
		</div>
	</section>
</body>
</html>