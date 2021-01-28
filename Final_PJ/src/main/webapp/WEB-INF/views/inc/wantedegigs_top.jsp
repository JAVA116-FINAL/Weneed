<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description"
	content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">
<title>원티드 긱스</title>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/images/favicon.ico" />

<!-- bootstrap.min css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/icofont/icofont.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/icofont/icomoon.css">
<!-- Slick Slider  CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/plugins/slick-carousel/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/clear.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/gaeun.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jumi.css">

<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<!-- font awesome 아이콘 사용을 위한 킷 https://fontawesome.com/ -->
<script src="https://kit.fontawesome.com/25b3da3ff3.js"
	crossorigin="anonymous"></script>
<script type="text/javascript" src = "<c:url value='/resources/js/member.js'/>"></script>

 <!-- 
    Essential Scripts
    =====================================-->

    <!-- Main jQuery -->
    <!-- Bootstrap 4.3.2 -->
    <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/popper.js"></script>
    <script src="<%=request.getContextPath() %>/resources/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/plugins/counterup/jquery.easing.js"></script>
    <!-- Slick Slider -->
    <script src="<%=request.getContextPath() %>/resources/plugins/slick-carousel/slick/slick.min.js"></script>
    <!-- Counterup -->
    <script src="<%=request.getContextPath() %>/resources/plugins/counterup/jquery.waypoints.min.js"></script>
    
    <script src="<%=request.getContextPath() %>/resources/plugins/shuffle/shuffle.min.js"></script>
    <script src="<%=request.getContextPath() %>/resources/plugins/counterup/jquery.counterup.min.js"></script>
    <!-- Google Map -->
    <script src="<%=request.getContextPath() %>/resources/plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
    
    <script src="<%=request.getContextPath() %>/resources/js/script.js"></script>
    <script src="<%=request.getContextPath() %>/resources/js/contact.js"></script>
<script type="text/javascript">
	$(function() {
		$('#login-email').focus();
		$('#join-email').focus();

		//회원가입처리
		$('#joinPwdOk-error').hide();
		$("#registerBtn").click(function() {
			$.ajax({
				url : "<c:url value='/memberJoin.do'/>",
				type : "POST",
				data : {
					'name' : $("#join-name").val(),
					'hp' : $("#join-hp").val(),
					'email' : $("#join-email").val(),
					'pwd' : $("#join-pwd").val()
				},
				success : function(res) {
					//alert(res);
					var msg = ""
					if (res) { //true이면 회원가입 성공
						msg = "회원가입 성공! 로그인을 해주세요.";
						$('#join').modal('hide');
						$('#join-email').val('');
						$('#join-name').val('');
						$('#join-hp').val('');
						$('#join-pwd').val('');
						$('#join-pwdOk').val('');
					} else {
						msg = "회원가입 실패";
						$('#join').modal('hide');
						$('#join-email').val('');
						$('#join-name').val('');
						$('#join-hp').val('');
						$('#join-pwd').val('');
						$('#join-pwdOk').val('');
					}
					alert(msg);
				},
				error : function(xhr, status, error) {
					alert('error! : ' + error);
				}
			});
		});

		$('#join-email').keyup(function() {
			var email = $(this).val();

			if (validate_email(email) && email.length >= 2) {
				$.ajax({
					url : "<c:url value='/ajaxCheckEmail.do'/>",
					type : "get",
					data : {
						email : email
					},
					success : function(res) {
						var msg = ""
						if (res) { //true면 이미 존재
							msg = "이미 등록된 이메일 입니다.";
						} else { //사용 가능
							//msg = "사용 가능한 이메일 입니다.";
						}
						$('#joinEmail-error').html(msg);
					}
				});
			} else if (!validate_email(email)) {
				$('#joinEmail-error').html("이메일 규칙에 맞지 않습니다.");
			}

			if (email.length == 0) {
				$('#joinEmail-error').html("");
			}
		});

		$('#join-hp').keyup(function() {
			var hp = $(this).val();

			if (validate_hp(hp)) {
				$.ajax({
					url : "<c:url value='/ajaxCheckHp.do'/>",
					type : "get",
					data : {
						hp : hp
					},
					success : function(res) {
						var msg = ""
						if (res) { //true면 이미 존재
							msg = "이미 등록된 휴대폰 번호입니다.";
						} else { //사용 가능
							//msg = "사용 가능한 이메일 입니다.";
						}
						$('#joinHp-error').html(msg);
					}
				});
			} else if (!validate_hp(hp)) {
				$('#joinHp-error').html("올바른 휴대폰 번호 형식이 아닙니다.");
			}

			if (hp.length == 0) {
				$('#joinHp-error').html("");
			}
		});

		$('#join-pwdOk').keyup(function() {
			var pwd = $('#join-pwd').val();
			var pwdOk = $('#join-pwdOk').val();
			if (pwd != "" || pwdOk != "") {
				if (pwd == pwdOk || pwdOk.length < 1) {
					$('#joinPwdOk-error').hide();
				} else {
					$('#joinPwdOk-error').show();
				}
			}
		});

		//체크박스 전체 선택, 해제
		$('input[name="chkAll"]').click(
				function() {
					var checked = $(this).is(':checked');

					if (checked) {
						$('.checkbox-group').find('input[type=checkbox]').prop(
								'checked', true);
					} else {
						$('.checkbox-group').find('input[type=checkbox]').prop(
								'checked', false);
					}
				});

		//체크박스 개별 선택
		$('.ge-agree1').click(function() {
			var is_checked = true;

			$('.ge-agree1').each(function() {
				is_checked = is_checked && $(this).is(':checked');
			});

			$('input[name="chkAll"]').prop('checked', is_checked);
		});

		//모달 닫히면 체크박스 초기화
		$('.modal').on('hidden.bs.modal', function() {
			$('input[type=checkbox]').prop('checked', false);
		});

		//회원가입버튼 비활성화, 활성화 여부
		btnDisabled();

		$('#join-email').on('input', setToggleEmail);
		$('#join-name').on('input', setToggleName);
		$('#join-hp').on('input', setToggleHp);
		$('#join-pwd').on('input', setTogglePwd);
		$('#join-pwdOk').on('input', setTogglePwdOk);
		var toggleEmail = 0;
		var toggleName = 0;
		var toggleHp = 0;
		var togglePwd = 0;
		var togglePwdOk = 0;

		function btnDisabled() {
			$('#registerBtn').css('background-color', '#9b9b9b');
			$('#registerBtn').attr('disabled', true);
		}

		function btnEnabled() {
			$('#registerBtn').css('background-color', '#3366ff');
			$('#registerBtn').attr('disabled', false);
		}

		function setToggleEmail() {
			var input = $("#join-email").val();
			if (input.length > 0) {
				toggleEmail = 1;
			} else {
				toggleEmail = 0;
			}
			judgeBtn();
		}

		function setToggleName() {
			var input = $("#join-name").val();
			if (input.length > 0) {
				toggleName = 1;
			} else {
				toggleName = 0;
			}
			judgeBtn();
		}

		function setToggleHp() {
			var input = $("#join-hp").val();
			if (input.length > 0) {
				toggleHp = 1;
			} else {
				toggleHp = 0;
			}
			judgeBtn();
		}

		function setTogglePwd() {
			var input = $("#join-pwd").val();
			if (input.length > 0) {
				togglePwd = 1;
			} else {
				togglePwd = 0;
			}
			judgeBtn();
		}

		function setTogglePwdOk() {
			var input = $("#join-pwdOk").val();
			if (input.length > 0) {
				togglePwdOk = 1;
			} else {
				togglePwdOk = 0;
			}
			judgeBtn();
		}

		function judgeBtn() {
			if (toggleEmail == 1 && toggleName == 1 && toggleHp == 1
					&& togglePwd == 1 && togglePwdOk == 1) {
				btnEnabled();
			} else {
				btnDisabled();
			}
		}
		//회원가입버튼 비활성화, 활성화 여부 끝

		////////////////////////////////
		//로그인 처리
		$("#loginBtn").click(function() {
			$.ajax({
				url : "<c:url value='/memberLogin.do'/>",
				type : "POST",
				data : {
					'email' : $("#login-email").val(),
					'pwd' : $("#login-pwd").val()
				},
				async : false,
				success : function(res) {
					//alert(res);
					var msg = ""
					if (res != "") {
						var sessionName = res;
						msg = sessionName + "님, 로그인되었습니다.";
						$('#login-email').val('');
						$('#login-pwd').val('');
					} else {
						msg = "이메일이 존재하지 않거나, 비밀번호가 일치하지 않습니다.";
						$('#login-email').val('');
						$('#login-pwd').val('');
					}
					alert(msg);
				},
				error : function(xhr, status, error) {
					alert('error! : ' + error);
				}
			});
		});

		$('.profileButton').click(function() {
			$('.profileImg').toggleClass('profile-border');
		})

	});
</script>
<style type="text/css">
.error {
	font-size: 12px;
	font-weight: 600;
	color: red;
	padding: 5px 0 0 5px;
}

#profile-li:hover {
	background-color: #fff;
}

.profile-border {
	border: 1px solid #3366ff;
}

</style>
</head>

<body id="top">

	<header>
		<div class="header-div">
			<nav class="navbar navbar-expand-lg navigation navbar-border"
				id="navbar">
				<div class="container container-top" style="margin-bottom: 10px">
					<a class="navbar-logo"
						href="${pageContext.request.contextPath}/freelancer/freelancerMain.do">
						<img
						src="${pageContext.request.contextPath}/resources/images/freelancer/wantedgigsLogo.png"
						alt="" class="img-fluid top-logo" style="margin-top: 10px">
					</a>

					<aside class="beforeLoginAside">
						<ul>
							<!-- 메인에서 로그인 안된 경우  -->
							<c:if test="${empty sessionScope.email }">
								<li><a href="${pageContext.request.contextPath}/freelancer/expertRegister/expertRegister1.do"
											class="grayButton">전문가 등록
								</a></li>
								<li><a
									href="${pageContext.request.contextPath}/freelancer/projectRegister/projectRegister1.do" class="blueButton">
										프로젝트 등록
								</a></li>
								<li><button class="grayButton" data-toggle="modal"
										data-target=".docs-example-modal-sm" style="outline: none; color:black;">회원가입/로그인</button></li>
							</c:if>

							<!-- 로그인 된 경우 -->
							<c:if test="${!empty sessionScope.email }">
								<li><a
									href="${pageContext.request.contextPath}/freelancer/projectRegister/projectRegister1.do" class="blueButton">
										프로젝트 등록
								</a></li>
								<li><a href="${pageContext.request.contextPath}/freelancer/expertRegister/expertRegister1.do"
											class="grayButton">전문가 등록
								</a></li>
								<li><a href="<c:url value='/freelogout.do'/>" class="grayButton" style="outline: none;" >로그아웃</a></li>
							</c:if>

							<!-- modal#1 로그인 시작-->
							<div class="modal fade docs-example-modal-sm" id="loginModal"
								tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" style="padding-left: 45px; top: 2%;">
									<div class="modal-content"
										style="width: 400px; overflow-y: auto;">
										<div class="modal-header gaeun-modal-header">
											<h5 class="modal-title h6 modal-wanted-title"
												id="mySmallModalLabel">
												<img
													src="${pageContext.request.contextPath}/resources/images/wantedLogo.png"
													alt="" class="img-fluid modalLogin-logo">
											</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close" style="outline: none;">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body gaeun-modal-body"
											style="height: calc(100vh - 130px); overflow-y: auto; border-bottom-left-radius: .3rem; border-bottom-right-radius: .3rem;">
											<div class="gaeun-modal-body-con1">
												<h1>
													직장인을 위한<br>커리어 플랫폼, 원티드!
												</h1>
												<h2>
													커리어 성장과 행복을 위한 여정<br>지금 원티드에서 시작하세요.
												</h2>
											</div>
											<div class="gaeun-modal-body-con2">
												<form name="frmLogin" method="post" action="">
													<div class="gaeun-login-emailBox">
														<label for="email" class="ge-labelEmail">이메일</label>
														<div class="ge-emailBox">
															<input type="email" placeholder="이메일을 입력해주세요."
																id="login-email" class="ge-inputEmail" value="">
															<div id="loginEmail-error" class="error"></div>
														</div>
													</div>
													<div class="gaeun-login-pwdBox">
														<label for="password" class="ge-labelPwd">비밀번호</label>
														<div class="ge-pwdBox">
															<input type="Password" placeholder="비밀번호를 입력해주세요."
																id="login-pwd" class="ge-inputPwd" value="">
															<div id="loginPwd-error" class="error"></div>
														</div>
													</div>
													<div class="lostOrJoin">
														<span><a data-toggle="modal"
															data-target="#lost-pwd" href="#" data-dismiss="modal">비밀번호
																찾기</a></span> <span><a data-toggle="modal"
															data-target="#join" href="#" data-dismiss="modal"> |
																회원가입</a></span>
													</div>
													<div class="other-login">
														<button type="submit" class="loginBtn" id="loginBtn"
															style="outline: none;">로그인</button>
														<div class="or"></div>
														<button class="facebook-login-btn social-login-btn"
															style="outline: none;">
															<i class="fab fa-facebook"
																style="color: #3366ff; margin-right: 10px;"></i>페이스북으로
															시작하기
														</button>
														<button class="apple-login-btn social-login-btn"
															style="outline: none;">
															<i class="fab fa-apple"
																style="color: #000; margin-right: 10px;"></i>Apple로 시작하기
														</button>
														<button class="google-login-btn social-login-btn"
															style="outline: none;">
															<i class="fab fa-google"
																style="color: #d50000; margin-right: 10px;"></i>Google로
															시작하기
														</button>
													</div>
												</form>
												<p class="login-modal-desc">
													걱정마세요! 여러분의 지원 활동은 SNS에 노출되지 않습니다.<br> 회원가입 시 <a
														class="login-modal-anchor" href="#">개인정보 처리방침</a>과 <a
														class="login-modal-anchor" href="#">이용약관</a>을 확인하였으며,
													동의합니다.
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- modal#1 로그인 끝-->

							<!-- modal#2 회원가입-->
							<div class="modal fade docs-example-modal-sm" id="join"
								tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" style="padding-left: 45px; top: 2%;">
									<div class="modal-content"
										style="width: 400px; overflow-y: auto;">
										<div class="modal-header gaeun-modal-header">
											<h5 class="modal-title h6 modal-wanted-title"
												id="mySmallModalLabel">회원가입</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close" style="outline: none;">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body gaeun-modal-body"
											style="height: calc(100vh - 135px); overflow-y: auto; border-bottom-left-radius: .3rem; border-bottom-right-radius: .3rem;">
											<div class="gaeun-modal-body-con2">
												<form name="frmJoin" method="post">
													<div class="gaeun-login-emailBox">
														<label for="email" class="ge-labelEmail">이메일</label>
														<div class="ge-emailBox">
															<input type="email" placeholder="이메일을 입력해주세요."
																id="join-email" class="ge-inputEmail" value="">
															<div id="joinEmail-error" class="error"></div>
														</div>
													</div>
													<div class="gaeun-joinBox">
														<label for="userName" class="ge-labelName">이름</label>
														<div class="ge-joinBox">
															<input type="text" placeholder="이름을 입력해주세요."
																id="join-name" class="ge-inputName" value="">
														</div>
													</div>
													<div class="gaeun-joinBox">
														<label for="hp" class="ge-labelHp">휴대폰 번호</label>
														<div class="ge-joinBox">
															<input type="text" placeholder="(예시)01034567890"
																id="join-hp" class="ge-inputHp" value="">
															<div id="joinHp-error" class="error"></div>
														</div>
													</div>
													<div class="gaeun-joinBox">
														<label for="pwd" class="ge-labelPwd">비밀번호</label>
														<div class="ge-joinBox">
															<input type="Password" placeholder="비밀번호를 입력해 주세요"
																id="join-pwd" class="ge-inputPwd" value="">
														</div>
													</div>
													<div class="gaeun-joinBox">
														<label for="pwd" class="ge-labelPwdOk">비밀번호 확인</label>
														<div class="ge-joinBox">
															<input type="Password" placeholder="비밀번호를 다시 한번 입력해 주세요."
																id="join-pwdOk" class="ge-inputPwdOk" value="">
															<div id="joinPwdOk-error" class="error">비밀번호가 일치하지
																않습니다.</div>
														</div>
													</div>
													<div class="checkbox-group">
														<div class="gaeun-agreeBox">
															<div class="all-agree">
																<input type="checkbox" name="chkAll" class="ge-chkAll"
																	style="outline: none;"><span>전체 동의</span>
															</div>
														</div>
														<div class="gaeun-joinAgree">
															<div class="agree1">
																<input type="checkbox" name="agree" class="ge-agree1"
																	style="outline: none;">
																<div class="ge-agree1Con">
																	개인정보 수집 및 이용 동의 (필수)<a href="#">자세히</a>
																</div>
															</div>
														</div>
														<div class="gaeun-joinAgree">
															<div class="agree1">
																<input type="checkbox" name="agree" class="ge-agree1"
																	style="outline: none;">
																<div class="ge-agree1Con">
																	이벤트 소식 등 알림 정보 받기<a href="#">자세히</a>
																</div>
															</div>
														</div>
													</div>
													<input type="button" id="registerBtn" class="registerBtn"
														value="회원가입하기" style="outline: none;">
													<p class="reLogin">
														* 이미 회원이신 가요?<a data-toggle="modal"
															data-target=".docs-example-modal-sm" href="#"
															data-dismiss="modal">&nbsp;로그인 하기</a>
													</p>
													<!--  </form>-->
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- modal#2 회원가입 끝 -->

							<!-- modal#3 비밀번호찾기 -->
							<div class="modal fade docs-example-modal-sm" id="lost-pwd"
								tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
								aria-hidden="true">
								<div class="modal-dialog" style="padding-left: 45px; top: 20%;">
									<div class="modal-content"
										style="width: 400px; overflow-y: auto; height: 100%;">
										<div class="modal-header gaeun-modal-header">
											<h5 class="modal-title h6 modal-wanted-title"
												id="mySmallModalLabel">비밀번호 찾기</h5>
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close" style="outline: none;">
												<span aria-hidden="true">&times;</span>
											</button>
										</div>
										<div class="modal-body gaeun-modal-body"
											style="border-bottom-left-radius: .3rem; border-bottom-right-radius: .3rem;">
											<div class="gaeun-modal-body-con2">
												<form name="frmSearchPwd" method="post" action="">
													<div class="gaeun-login-emailBox">
														<label for="email" class="ge-labelEmail">이메일</label>
														<div class="ge-emailBox">
															<input type="email" placeholder="이메일을 입력해주세요." id="email"
																class="ge-inputEmail" value="">
														</div>
													</div>
													<input type="button" class="sendBtn" id="pwdSearchBtn"
														value="전송" style="outline: none;">
												</form>
												<p>* 가입하신 이메일 계정으로 임시 비밀번호를 전송해 드립니다.</p>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- modal#3 비밀번호찾기 끝 -->
						</ul>
					</aside>
				</div>
			</nav>
		</div>
	</header>