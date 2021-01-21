<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/member.css">
<script type="text/javascript">
$(function(){
	$('#comServLoginSubmit').click(function(){
		//여기는 유효성 확인 부분
		var msg="";
		
		if($('#comMemId').val().length<1){ //아이디 빈칸일 때
			msg="아이디를 입력하세요.";
			$('#alertSpanId').text(msg);
			$('#comMemId').focus();
			event.preventDefault();
			return false;
		}else if($('#comMemPwd').val().length<1){ //비밀번호 입력 안 했을 때
			msg="비밀번호를 입력하세요.";
			$('#alertSpanPwd').html(msg);
			$('#comMemPwd').focus();
			event.preventDefault();
			return false;
		}
		
		$('#comMemId').keyup(function(){ //아이디 인풋박스에 키업이벤트
			keyupCheck($('#comMemId'), '아이디', $('#alertSpanId'));
		});
		
		$('#comMemPwd').keyup(function(){ //인풋박스에 키업이벤트
			keyupCheck($('#comMemPwd'), '비밀번호', $('#alertSpanPwd'));
		});
		
		/* //아이디 비밀번호 다 입력했으면 db에서 체크해보기 ajax 사용
		var id=$('#comMemId').val();
		var pwd=$('#comMemPwd').val();
		$.ajax({
			url:"<c:url value='/company/member/login.do'/>",
			dataType:"json",
			type:"post",
			data:{
				comMemId:id,
				comMemPw:pwd
			},
			success:function(result){
				if(result=='success_reged'){ //기업정보, 이미지 모두 등록된 계정이 로그인함
					alert('로그인 성공!');
					location.href="/company/applicants.jsp"; //지원자 화면으로 이동
				}else if(result=='success_img_not_reged'){ //이미지 미등록 계정이 로그인함
					alert('로그인 성공!');
					location.href="/company/imgUpload.jsp"; //이미지 등록 화면으로 이동
				}else if(result=='success_info_not_reged'){ //기업정보 미등록된 계정이 로그인함
					alert('로그인 성공!');
					location.href="/company/register.jsp"; //기업정보 등록 화면으로 이동
				}else if(result=='fail'){
					alert('비밀번호나 아이디를 다시 확인해주세요.'); //로그인 팝업 유지?
				}
			},
			error:function(xhr, status, error){
				alert("로그인 실패! error: "+error);
			}
				
		});//ajax 로그인처리 */
	}); //click
});

function keyupCheck(inputId, inputName, alertId){ //매개변수로 인풋아이디 전체,인풋이름,얼럿표시할곳을 준다
	if(inputId.val().length<1){
		var msg=inputName+"를 입력하세요.";
		alertId.text(msg);
		alertId.show();
		inputId.focus();
		event.preventDefault();
	}else{ //입력을 뭐라도 했을 때
		alertId.hide();
	}
}
		
</script>
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
			        		<form id="comServLoginForm" name="comServLoginForm" method="post" action="<c:url value='/company/member/login.do'/>">
						        <div class="boundDivSpan">
							        <input class="comServ-input input-long" type="text" placeholder="로그인 아이디(회사 이메일)"
							        	id="comMemId" name="comMemId"/>
									<span class="alertSpan" id="alertSpanId"></span>
						        </div>
						        <div class="boundDivSpan">
								<input class="comServ-input input-long" type="password" placeholder="비밀번호"
									id="comMemPwd" name="comMemPwd"/><br>
								<span class="alertSpan" id="alertSpanPwd"></span>
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
				    <span>계정이 없으신가요? </span><a class="comServ-joinProvsLink" href="#">관리자 계정 만들기</a>
					<button class="btn btn-primary comServFBBtn">페이스북으로 시작하기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 기업서비스 관리자 계정 로그인 모달 끝 -->