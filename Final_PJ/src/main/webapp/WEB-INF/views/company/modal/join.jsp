<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="<c:url value='/resources/js/hyunbin.js'/>"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/member.css">
<script type="text/javascript">
$(function(){
	$('#comServjoinSubmitBtn').click(function(){
		//여기는 유효성 확인 부분
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
		
	});
	
	$('#comMemName').keyup(function(){ //아이디 인풋박스에 키업이벤트
		keyupCheck($('#comMemName'), '담당자 성함을', $('#alertSpanName'));
	});
	$('#comMemTeam').keyup(function(){ //아이디 인풋박스에 키업이벤트
		keyupCheck($('#comMemTeam'), '팀/직책을', $('#alertSpanTeam'));
	});
	$('#comMemMobile').keyup(function(){ //아이디 인풋박스에 키업이벤트
		keyupCheck($('#comMemMobile'), '연락처를', $('#alertSpanMobile'));
	});
	$('#comMemJoinId').keyup(function(){ //아이디 인풋박스에 키업이벤트
		keyupCheck($('#comMemJoinId'), '아이디를', $('#alertSpanJoinId'));
	});
	$('#comMemJoinPwd').keyup(function(){ //아이디 인풋박스에 키업이벤트
		pwdKeyupCheck($('#comMemJoinPwd'), '비밀번호를', $('#alertSpanJoinPwd'));
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
				    <span>이미 가입되어 있으신가요? </span><a class="comServ-joinProvsLink" href="#">로그인하기</a>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 관리자 계정 가입 모달 끝 -->