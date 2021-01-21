<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/member.css">
<script type="text/javascript">
$(function(){
	$('#comServLoginForm').submit(function(){
		var msg="";
		//여기는 유효성 확인 부분
		if($('#comMemName').val().length<1){ //이름입력
			
		}else if(){ //비밀번호 입력 안 했을 때 
			
		}else if(){
			
		}
		
		//아이디 비밀번호 다 입력했으면 db에서 체크해보기 ajax 사용
		
	});
});
		
function validate_comMemId(id){
	var pattern = new RegExp(/^[a-zA-Z0-9_]+$/g);
	return pattern.test(id);
	/*
	a~z의 문자, A~Z의 문자, 0~9의 숫자나 _로 시작하거나 끝나야 한다는 의미. 닫기 대괄호 뒤의 +기호는 이 패턴이 한 번 이상 반복된다는 의미
	이메일 패턴 만들 수 있을까..?
	*/
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
			        		<form id="comServJoinForm" method="post" action="<c:url value='/company/member/join.do'/>">
						        <div class="div-input-onOneLine">
							        <input class="comServ-input input-half" type="text" placeholder="담당자 성함" 
							        	id="comMemName" name="comMemName"/>
									<input class="comServ-input input-half" type="text" placeholder="직책(or팀)" 
										id="comMemTeam" name="comMemTeam"/><br>
						        </div>
								<input class="comServ-input input-long" type="text" placeholder="연락처"
									id="comMemMobile" name="comMemMobile"/>
								<hr>
								<input class="comServ-input input-long" type="text" placeholder="회사 이메일(로그인 아이디로 사용됩니다.)" 
									id="comMemId" name="comMemId"/>
								<input class="comServ-input input-long" type="text" placeholder="6자리 이상 비밀번호" 
									id="comMemPwd" name="comMemPwd"/>
			        		</form>
			      		</div>
			        </div>
			    </div>
			</div>
			<div class="modal-footer comServJoinModalFooter">
				<div class="container comServModalFooterCon">
				    <button class="btn btn-primary comServSubmitBtn" type="submit" data-dismiss="modal">관리자 계정 생성</button>
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