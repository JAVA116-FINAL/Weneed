<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">

<title>Weneed for employer</title>
<%@ include file="cssJsImports.jsp" %>
<script type="text/javascript" src="<c:url value='/resources/js/hyunbin.js'/>"></script>
<script type="text/javascript">
$(function(){
	//여기는 회원가입 유효성 확인 부분
	$('#comServjoinSubmitBtn').click(function(){
		if($('#comMemName').val().length<1){ //이름
			$('#alertSpanName').html("이름을 입력하세요.");
			$('#comMemName').focus();
			return false;
		}else if($('#comMemTeam').val().length<1){ //팀 직책
			$('#alertSpanTeam').html("팀/직책을 입력하세요.");
			$('#comMemTeam').focus();
			return false;
		}else if($('#comMemMobile').val().length<1){ //연락처
			$('#alertSpanMobile').html("연락처를 입력하세요.");
			$('#comMemMobile').focus();
			return false;
		}else if($('#comMemJoinId').val().length<1){ //아이디
			$('#alertSpanJoinId').html("아이디를 입력하세요.");
			$('#comMemJoinId').focus();
			return false;
		}else if($('#comMemJoinPwd').val().length<6){ //비밀번호
			$('#alertSpanJoinPwd').html("비밀번호를 입력하세요.");
			$('#comMemJoinPwd').focus();
			return false;
		}else{
			$('form[name=comServJoinForm]').submit();
		}
	});//유효성 확인
	
	$('#comMemName').keyup(function(){ //아이디 인풋박스에 키업이벤트
		keyupCheck($('#comMemName'), '담당자 성함을', $('#alertSpanName'));
	});
	$('#comMemTeam').keyup(function(){ 
		keyupCheck($('#comMemTeam'), '팀/직책을', $('#alertSpanTeam'));
	});
	$('#comMemMobile').keyup(function(){ 
		keyupCheck($('#comMemMobile'), '연락처를', $('#alertSpanMobile'));
	});
	$('#comMemJoinId').keyup(function(){ 
		keyupCheck($('#comMemJoinId'), '아이디를', $('#alertSpanJoinId'));
	});
	$('#comMemJoinPwd').keyup(function(){
		pwdKeyupCheck($('#comMemJoinPwd'), '비밀번호를', $('#alertSpanJoinPwd'));
	});
	
	//여기는 유효성 확인 부분 로그인
	$('form[name=comServLoginForm]').submit(function(){
//	$('#comServLoginSubmit').submit(function(){
		var msg="";
		
		if($('#comMemLoginId').val().length<1){ //아이디 빈칸일 때
			msg="아이디를 입력하세요.";
			$('#alertSpanLoginId').text(msg);
			$('#comMemLoginId').focus();
			event.preventDefault();
			return false;
		}else if($('#comMemLoginPwd').val().length<1){ //비밀번호 입력 안 했을 때
			msg="비밀번호를 입력하세요.";
			$('#alertSpanLoginPwd').html(msg);
			$('#comMemLoginPwd').focus();
			event.preventDefault();
			return false;
		}
		
		$.ajax({
			url:"<c:url value='/company/ajaxPwdCheck.do'/>",
			data:{
				comMemId:$('#comMemLoginId').val(),
				comMemPwd:$('#comMemLoginPwd').val()
			},
			type:"post",
			success:function(result){
				alert(result);
			},
			error:function(xhr, status, error){
				alert('error! '+error);
			}
		});
		
		
		/* //아이디 비밀번호 다 입력했으면 db에서 체크해보기 ajax 사용
		var id=$('#comMemLoginId').val();
		var pwd=$('#comMemLoginPwd').val();
		console.log(id);
		console.log(pwd);
		
		$.ajax({
			url:"<c:url value='/company/ajaxLoginCheck.do'/>",
			type:"post",
			dataType:"text",
			async:false,
			data:{
				'comMemId':$('#comMemLoginId').val(),
				'comMemPwd':$('#comMemLoginPwd').val()
			},
			success:function(result){
				console.log(result);
				if(result=='/company/welcome.do'){ // 로그인 실패시
					alert('비밀번호나 아이디가 일치하지 않습니다.');
					return false;
				}else{ //이미지 미등록 계정이 로그인함
					alert('로그인 성공!');
				}
					location.href=result; 
			},
			error:function(xhr, status, error){
				alert("로그인 실패! error: "+error);
			}
		});//ajax 로그인처리  */
	}); //click
	
	$('#comMemLoginId').keyup(function(){ //아이디 인풋박스에 키업이벤트
		console.log('키업이벤트 아이디');
		keyupCheck($('#comMemLoginId'), '아이디를', $('#alertSpanLoginId'));
	});
	
	$('#comMemLoginPwd').keyup(function(){ //인풋박스에 키업이벤트
		keyupCheck($('#comMemLoginPwd'), '비밀번호를', $('#alertSpanLoginPwd'));
	});
	
	//메뉴 선택 시 해당 메뉴만 하얗게 바꾸기
	$('.comServNav-item-link').click(function(){
		const num=$('.comServNav-item-link').index($(this));
		$('.comServNav-item-link').removeClass("comServSelectedMenu");		
		$('.comServNav-item-link:eq('+num+')').addClass("comServSelectedMenu");
	});
	
	
});

function pwdKeyupCheck(inputId, inputName, alertId){ //매개변수로 인풋아이디 전체,인풋이름,얼럿표시할곳을 준다
	if(inputId.val().length<6){
		var msg=inputName+" 여섯자리 이상 입력하세요.";
		alertId.text(msg);
		alertId.show();
		inputId.focus();
		event.preventDefault();
	}else{ //입력을 뭐라도 했을 때
		alertId.hide();
	}
}
</script>
</head>
<body>
	<header>
		<div class="header-wrapper1">
			<div class="container">
				<!-- 로그인 전, 기업서비스 상단-1번 바 -->
				<div class="header-wrapper21" id="comServHeader1st">
					<div class="header-logo" id="comServHeaderLogo">
						<!-- 로그인 후 기업로고 + 기업명으로 변경? -->
						<c:if test="${empty comMemId}">
							<a class="comServNavbar-logo-link" href="<c:url value='/company/welcome.do'/>">Weneed for Employer</a>
						</c:if>
						<c:if test="${!empty comMemId}">
							<c:if test="${empty comInfoVo.comName }">
								<span id="topBuildingSpan"><i class="fas fa-building" style="color:white"></i></span>
								<span class="comServNavbar-logo-link">
									-		
								</span>
							</c:if>
							<c:if test="${!empty comInfoVo.comName }">
								<span id="topBuildingSpan"><i class="fas fa-building" style="color:white"></i></span>
								<span class="comServNavbar-logo-link">
									${comInfoVo.comName}	
								</span>
							</c:if>
						</c:if>
					</div>
					<div class="comServHeaderBtns">
						<c:if test="${empty comMemId}">
							<!-- 기업서비스 로그인 -->
							<button class="comServBtn comServLoginBtn"
								data-toggle="modal" data-target=".comServLoginMD" style="outline:none;">채용담당자 로그인</button>
							<!-- 기업서비스 관리자 계정 로그인 모달 시작-->
							<div class="modal fade docs-example-modal-sm comServLoginMD" tabindex="-1" 
								role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
								  <div class="modal-dialog">
								    <div class="modal-content">
										<div class="modal-header modal-comServHeader">
										    <p class="comServTitleWrapper"><h5 class="modal-title modal-comServTitle" 
										    	id="comServJoinModalLabel" style="align:center">관리자 계정 로그인</h5></p>
										    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
										        <span aria-hidden="true">×</span>
										    </button>
										</div>
										<div class="container comServModalCon">
											<div class="modal-body">
											    <div class="table-responsive">
											        <div class="container">
										        		<form id="comServLoginForm" name="comServLoginForm" method="post" action="<c:url value='/company/login.do'/>">
													        <div class="boundDivSpan">
														        <input class="comServ-input input-long" type="text" placeholder="로그인 아이디(회사 이메일)"
														        	id="comMemLoginId" name="comMemLoginId"/>
																<span class="alertSpan" id="alertSpanLoginId"></span>
													        </div>
													        <div class="boundDivSpan">
															<input class="comServ-input input-long" type="password" placeholder="비밀번호"
																id="comMemLoginPwd" name="comMemLoginPwd"/><br>
															<span class="alertSpan" id="alertSpanLoginPwd"></span>
													        </div>
									        				<input class="btn btn-primary comServSubmitBtn" id="comServLoginSubmit" type="submit" value="로그인">
									        				<a class="comServ-joinProvsLink" href="#">비밀번호 초기화/변경</a>
										        		</form>
										      		</div>
										        </div>
										    </div>
										</div>
										<div class="modal-footer comServJoinModalFooter">
											<div class="container comServModalFooterCon">
											    <span>계정이 없으신가요? </span>
											    <a data-toggle="modal" href=".comServJoinMD" style="outline:none;"
											    	data-dismiss="modal" aria-label="close" class="comServ-joinProvsLink" href="#">관리자 계정 만들기</a>
												<%-- <%@include file="join.jsp" %> --%>
												<button class="btn btn-primary comServFBBtn">페이스북으로 시작하기</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 기업서비스 관리자 계정 로그인 모달 끝 -->
							<!-- 기업서비스 관리자 회원가입 -->
							<button class="comServBtn comServJoinBtn"
								data-toggle="modal" data-target=".comServJoinMD" style="outline:none;">관리자 가입</button>
							<!-- 관리자 계정 가입 모달 시작-->
							<div class="modal fade docs-example-modal-sm comServJoinMD" tabindex="-1" 
								role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
								  <div class="modal-dialog">
								    <div class="modal-content">
										<div class="modal-header modal-comServHeader">
										    <h5 class="modal-title modal-comServTitle" id="comServJoinModalLabel" style="align:center">관리자 계정 만들기</h5>
										    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
										        <span aria-hidden="true">×</span>
										    </button>
										</div>
										<div class="container comServModalCon">
											<div class="modal-body">
											    <div class="table-responsive">
											        <div class="container">
										        		<form id="comServJoinForm" name="comServJoinForm" method="post" action="<c:url value='/company/member/join.do'/>">
													        <div class="div-input-onOneLine">
														        <div class="boundDivSpan">
															        <input class="comServ-input input-half" type="text" placeholder="담당자 성함" 
															        	id="comMemName" name="comMemName"/>
															        <span class="alertSpan" id="alertSpanName"></span>
														        </div>
														        <div class="boundDivSpan">
																	<input class="comServ-input input-half" type="text" placeholder="직책(or팀)" 
																		id="comMemTeam" name="comTeam"/><br>
																	<span class="alertSpan" id="alertSpanTeam"></span>
														        </div>
													        </div>
													        <div class="boundDivSpan">
																<input class="comServ-input input-long" type="text" placeholder="연락처"
																	id="comMemMobile" name="comMobile"/>
																<span class="alertSpan" id="alertSpanMobile"></span>
													        </div>
															<hr>
															<div class="boundDivSpan">
																<input class="comServ-input input-long" type="text" placeholder="회사 이메일(로그인 아이디로 사용됩니다.)" 
																	id="comMemJoinId" name="comMemId"/>
																<span class="alertSpan" id="alertSpanJoinId"></span>
															</div>
															<div class="boundDivSpan">
															<input class="comServ-input input-long" type="password" placeholder="6자리 이상 비밀번호" 
																id="comMemJoinPwd" name="comMemPwd"/>
															<span class="alertSpan" id="alertSpanJoinPwd"></span>
															</div>
										        		</form>
										      		</div>
										        </div>
										    </div>
										</div>
										<div class="modal-footer comServJoinModalFooter">
											<div class="container comServModalFooterCon">
											    <button class="btn btn-primary comServSubmitBtn" id="comServjoinSubmitBtn" type="submit">관리자 계정 생성</button>
											    <span class="comServ-joinAgree">회원가입시 <a class="comServ-joinProvsLink" href="#">개인정보 처리방침</a>을 읽었으며,
											    	<br><a class="comServ-joinProvsLink" href="#">이용약관</a>에 동의하신 것으로 간주합니다.</span>
											    <hr>
											    <span>이미 가입되어 있으신가요? </span>
											    <a data-toggle="modal" data-target=".comServLoginMD" style="outline:none;"
											   		data-dismiss="modal" aria-label="Close" class="comServ-joinProvsLink" href="#">로그인하기</a>
											    	<%-- <%@include file="login.jsp" %> --%>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 관리자 계정 가입 모달 끝 -->
							<%-- <%@include file="../company/modal/join.jsp" %> --%>
						</c:if>
						<c:if test="${!empty comMemId}">
						<!-- 기업서비스 로그인 후 담당자명+님 띄워줄 곳  -->
							<div class="comServDropdown">
								<button class="comServBtn comServBtn-name">${comMemName} 님 <i class="fas fa-chevron-down"></i></button>
								<div class="comServOptionMenu"> <!-- 내 프로필 / 로그아웃 링크 있는 곳 -->
									<a href="#">내 프로필</a>
									<a href="<c:url value='/company/logout.do'/>">로그아웃</a>
								</div>
							</div>
						</c:if>
						<a href="<c:url value='/index.do'/>" class="comServBtn gotoWantedMain">위니드 홈</a>
					</div>
				</div>
				<c:if test="${!empty comMemId}">
					<!-- 로그인 후, 기업서비스 상단-2번 바 추가 노출 -->
					<div class="header-wrapper22" id="comServHeader2nd">
						<nav class="comServNavbar">
							<ul class="comServNavs ml-auto">
								<li class="comServNav-item">
									<a class="comServNav-item-link" href="<c:url value='/company/applicants.do'/>">지원자</a></li>
								<li class="comServNav-item">
									<a class="comServNav-item-link" href="<c:url value='/company/positionList.do'/>">포지션</a></li>
								<li class="comServNav-item">
									<a class="comServNav-item-link" href="<c:url value='/company/matchupService.do'/>">매치업</a></li>
								<li class="comServNav-item">
									<a class="comServNav-item-link comServSelectedMenu" href="<c:url value='/company/comInfoModify.do'/>">기업정보</a></li>
								<li class="comServNav-item">
									<a class="comServNav-item-link" href="#">계정관리</a></li>
							</ul>
						</nav>
					</div>
				</c:if>
			</div>
		</div>
	</header>
</body>
