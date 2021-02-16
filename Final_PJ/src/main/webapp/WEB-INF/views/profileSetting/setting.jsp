<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/profileSetting.css'/>">
<script type="text/javascript">
	$(function(){
		$('.notificationNavBtn').addClass('linkActive');
		$('.changePasswordNavBtn').removeClass('linkActive');
		$('.leaveNavBtn').removeClass('linkActive');
		$('#setNotification').show();
		$('#changePassword').hide();
		$('#leave').hide();
		$('.notificationNavBtn').click(function(){
			$('.notificationNavBtn').addClass('linkActive');
			$('.changePasswordNavBtn').removeClass('linkActive');
			$('.leaveNavBtn').removeClass('linkActive');
			$('#setNotification').show();
			$('#changePassword').hide();
			$('#leave').hide();
		});
		$('.changePasswordNavBtn').click(function(){
			$('.changePasswordNavBtn').addClass('linkActive');
			$('.notificationNavBtn').removeClass('linkActive');
			$('.leaveNavBtn').removeClass('linkActive');
			$('#setNotification').hide();
			$('#changePassword').show();
			$('#leave').hide();
		});
		$('.leaveNavBtn').click(function(){
			$('.leaveNavBtn').addClass('linkActive');
			$('.changePasswordNavBtn').removeClass('linkActive');
			$('.notificationNavBtn').removeClass('linkActive');
			$('#setNotification').hide();
			$('#changePassword').hide();
			$('#leave').show();
		});
		
		$("#resetPwdBtn").click(function(){
  	  		$.ajax({
  				url:"<c:url value='/resetPwd.do'/>",
  				type:"POST",
  				data:{
  					'email':$("#resetEmail").val()
  				},
  				async:false,
  				success:function(res){
  					var msg ="이메일로 비밀번호 재설정 링크를 발송하였습니다.";
  	  				alert(msg);
  				},
  				error:function(xhr, status, error){
  					alert('error! : ' + error);
  				}  				
  			});
		});
		
		$("#withdrawBtn").click(function(){
  	  		$.ajax({
  				url:"<c:url value='/withdraw.do'/>",
  				type:"POST",
  				data:"",
  				success:function(res){
  					var msg ="위니드 회원 탈퇴가 완료되었습니다. 그동안 위니드를 이용해 주셔서 감사드립니다.";
  	  				alert(msg);
  				},
  				error:function(xhr, status, error){
  					alert('error! : ' + error);
  				}  				
  			});
		});
		
	});
</script>
<style>
/* The switch - the box around the slider */
.switch {
  position: relative;
  display: inline-block;
  width: 50px;
  height: 22px;
  vertical-align:middle;
  float:right;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 18px;
  width: 18px;
  left: 3px;
  bottom: 2px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}

</style>

<div class="setting-container-wrap">
	<div class="container">
		<div class="setting-left-nav">
			<h2 class="setting-left-nav-title"><p>계정 설정</p></h2>
		</div>
		<div class="setting-left-nav-detail">
			<div class="nav-detail-btn">
				<ul>
					<li><button class="notificationNavBtn" style="outline:none;">알림 설정</button></li>
					<li><button class="changePasswordNavBtn" style="outline:none;">비밀번호 설정</button></li>
					<li><button class="leaveNavBtn" style="outline:none;">회원 탈퇴</button></li>
				</ul>
			</div>
			
			<section>
				<div id="setNotification">
					<h3>마케팅 정보 수신</h3>
					<div class="setNotificationCon">
						<dl>
							<dt>마케팅 정보 수신 동의를 하시면, 내 직군 직무에 맞는 큐레이션 뉴스레터를 받을 수 있습니다.</dt>
							<dd>
								<label class="switch">
  									<input type="checkbox">
  									<span class="slider round"></span>
								</label>
							</dd>
						</dl>
					</div>
				</div>
				<div id="changePassword">
					<h3>비밀번호 설정</h3>
					<input type="email" placeholder="sample@wanted.co.kr" value="" id="resetEmail">
					<p>* 비밀번호를 재설정 할 이메일 계정을 입력해주세요.</p>
					<button type="button" id="resetPwdBtn" style="outline:0;">전송</button>
				</div>
				<div id="leave">
					<h3>탈퇴 시 주의 사항</h3>
					<ul>
						<li>탈퇴 시 회원님의 이력서를 포함하여 회원님의 계정에 저장된<b>모든 정보가 영구적으로 삭제되며, 다시는 복구할 수 없습니다.</b></li>
						<li>이력서의 저장을 원하실 경우, 탈퇴 이전에 <a href="#">이력서 관리 페이지</a>에서 다운로드 해주세요.</li>
						<li>다른 계정에 이미 제출된 추천 정보는 추천받은 계정의 소유로 간주되어 <b>자동으로 삭제되지 않으며, 탈퇴 시 수정이나 삭제가 불가능합니다.</b></li>
						<li>제출된 추천서의 수정이나 삭제를 원하실 경우, 탈퇴 이전에 <a href="#">추천 페이지</a>에서 추천서를 수정, 또는 삭제 해주세요.</li>
						<li><b>원티드 회원에서 탈퇴하실 경우, 추천 및 채용 보상금을 받으실 수 없습니다.</b> 받으실 보상금이 있으시다면 탈퇴 이전에 모든 수속을 마쳐주세요.</li>
						<li><b>포인트는 자동으로 환급되지 않으며, 재가입시에도 복구되지 않습니다.</b></li>
						<li><b>교육 및 이벤트 참가 신청은 자동으로 취소되지 않습니다.</b> 취소를 원하실 경우 탈퇴 이전에 별도로 요청해주세요.</li>
						<li>기업 서비스에 등록되어 있는 계정일 경우, <b>기업 서비스 접속권한도 동시에 삭제됩니다.</b></li>
						<li>이상의 내용에 동의하여 탈퇴를 원하실 경우, 아래의 “동의하기” 버튼을 클릭 부탁드립니다.</li>
					</ul>
					<button type="button" class="withdraw-agree" style="outline:0;" data-toggle="modal" data-target="#withdraw" href="#" data-dismiss="modal">동의하기</button>
					<!-- modal 탈퇴하기 -->
						<div class="modal fade docs-example-modal-sm" id="withdraw" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
						  <div class="modal-dialog" style="padding-left:45px; top:20%;">
						    <div class="modal-content" style="width:400px; overflow-y:auto; height:100%;">
						      <div class="modal-header gaeun-modal-header">
						        <h5 class="modal-title h6 modal-wanted-title" id="mySmallModalLabel">탈퇴하기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline:none;">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body gaeun-modal-body" style="border-bottom-left-radius:.3rem;border-bottom-right-radius:.3rem;">
						        <div class="gaeun-modal-body-con2">
							        <form name="frmSearchPwd" method="post" action="">
							        	<div class="gaeun-login-emailBox">
							        		<p class="withdrawLabel">정말로 탈퇴하시겠습니까?</p>
							        	</div>
							        	<input type ="submit" class="withdrawBtn" id="withdrawBtn" value="확인" style="outline:none;">
							        </form>
						        </div>
						      </div>
						    </div>
						  </div>
						</div>
					<!-- modal 탈퇴하기 끝 -->
				</div>
			</section>
		</div>
	</div>
</div>