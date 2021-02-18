<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypageMain.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/mypage/profileEdit.css'/>">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<%-- <script type="text/javascript" src = "<c:url value='/resources/js/member.js'/>"></script> --%>
<script type="text/javascript">
$(function(){
	$('#btUpfile').click(function(){
		//alert("버튼클릭");
		$('#upfile').trigger("click");
	});
	$('#upfile').change(function(){
		if($('#upfile').val().length<1){	
			alert('업로드할 파일을 선택하세요');
			return false;
		}
   		var form = $('#frmUpfile')[0];
	 	var formData = new FormData(form);// FormData 객체 생성		
		  $.ajax({
			url:"<c:url value='/mypage/fileUpload.do'/>",
			type:"POST",
			dataType:"text",
			data:formData,
			processData: false,
			contentType: false,
			cache: false,
			success:function(resUp){
				//alert(resUp);
				var imgStr="";
				imgStr="<img class='img_member_jy'  src='"+resUp+"'>";
				$('#memberImg').empty();
				$('#memberImg').html(imgStr);
				
			},
			error:function(xhr,status,error){
				alert("error!:"+error);
			}
		}); //ajax
		
	});//change이벤트
	
	$('#inputEmail').keyup(function(){
		var email=$(this).val();
		//alert("키업이벤트!");
		if(validate_email(email)&& email.length>=2){
			$.ajax({
					url:"<c:url value='/ajaxCheckEmailEdit.do'/>",
					type:"get",
					data:{
						email:email
					},
					success:function(res){
						var msg = ""
						if(res){ //true면 이미 존재
							msg = "이미 등록된 이메일 입니다.";
						}else{ //사용 가능
							//msg = "사용 가능한 이메일 입니다.";
						}
						$('#email_error').html(msg);
					}
				});
			
		}else if(!validate_email(email)){
			$('#email_error').html("email 규칙에 맞지 않습니다.");
		}
		if(email.length==0){
			$('#email_error').html("");
		}
		
	});
	
	$('#inputHp').keyup(function(){
			var hp = $(this).val();
			
			if(validate_hp(hp)){
				$.ajax({
					url:"<c:url value='/ajaxCheckHpEdit.do'/>",
					type:"get",
					data:{
						hp:hp
					},
					success:function(res){
						var msg = ""
						if(res){ //true면 이미 존재
							msg = "이미 등록된 휴대폰 번호입니다.";
						}else{ //사용 가능
							//msg = "사용 가능한 이메일 입니다.";
						}
						$('#hp_error').html(msg);
					}
				});
			}else if(!validate_hp(hp)){
				$('#hp_error').html("올바른 휴대폰 번호 형식이 아닙니다.");
			}
			
			if(hp.length==0){
				$('#hp_error').html("");
			}
		});
	$('#inputName').keyup(function(){
		if($('#inputName').val().length>0){
			$('#name_error').html("");
		}
	});
	
	$('#profileEdit').click(function(){
		if($('#inputName').val()==""){
			//alert("이름을 입력하세요");
			event.preventDefault();
			$('#inputName').focus();
			$('#name_error').html("이름을 입력하세요");
			 
		}else if(!validate_email($('#inputEmail').val())||$('#email_error').html().length>0){
			event.preventDefault();
			$('#inputEmail').focus();
			$('#email_error').html("email을 확인하세요");
		}else if(!validate_hp($('#inputHp').val())||$('#hp_error').html().length>0){
			event.preventDefault ();
			$('#inputHp').focus();
			$('#hp_error').html("휴대폰 번호를 확인하세요");
		}
		/* $('#frmProfileEdit').submit(); */
	});
	
});

 function validate_email(email){
  	var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  	return pattern.test(email);
}

function validate_hp(hp){
	var pattern = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	return pattern.test(hp);
} 

</script>
<div class="container">
	<h2 class="mypageTitle">MY 위니드</h2>
	<div class="divWrapper">
		<div class="leftSideDivGroup">
			<div class="leftDiv">
				<div class="proImg" >
					<div class="memberImg" id="memberImg">
						<c:if test="${empty memVo.fileName }">
							<i class="fas fa-user fa-5x"></i>
						</c:if>
						<c:if test="${!empty memVo.fileName }">
							<img class="img_member_jy" alt="회원이미지" src="<c:url value='/resources/memberImgUpload/${memVo.fileName }'/>">
						</c:if>
						
					</div>
					<form name="frmUpfile" id="frmUpfile" method="post" enctype="multipart/form-data" action="<c:url value='/mypage/fileUpload.do'/>">
						<input class="inputimg_jy" type="file" name="upfile" id="upfile" accept="image/*" style="display: none;">
						<input type="hidden" name="oldFileName" value="${memVo.fileName}"/>
						<button id="btUpfile" type="button">
						<i class="fas fa-camera"></i>
						</button>
					</form>
					
				</div>
				<div>
					<dl>
						<dt>${memVo.name }</dt>
						<dd>${memVo.email }</dd>
						<dd>${memVo.hp }</dd>
					</dl>
				</div>
				<a class="basicInfoLink" href="<c:url value='/mypage/profileEdit.do'/>"><span>기본정보수정</span></a>
			</div>
			<div class="leftDiv leftPoint">
				<span>포인트</span><span class="number">1,000P</span>
			</div>
			<div class="leftDiv leftProposals">
				<div>
					<span>원해요 
					<i style="color:#bbbbbb;" class="far fa-question-circle"></i>
					</span><a href="#" class="number">${likeCnt}</a>
				</div>
				<div>
					<span>열람</span><a href="#" class="number">${openResumeCnt}</a>
				</div>
				<div>
					<span>받은 제안</span><a href="#" class="number">${proposalCnt }</a>
				</div>
			</div>
			<div class="leftDiv">
					<a href="<c:url value='/profileSetting/setting.do'/>">계정 설정</a>
			</div>
		</div>
		<section class="profileEditSection_jy">
			<form action="<c:url value='/mypage/profileEdit.do'/>" method="post" name="frmProfileEdit" id="frmProfileEdit">
			<input id="memNo" name="memNo" type="hidden" autocomplete="off" value="${memVo.memNo}">
				<header class="formHeader_jy">
					<dl class="formTitle_jy">
						<dt>기본정보 수정</dt>
						<dd>지원 결과 또는 추천 포지션 정보를 받아볼 이메일/연락처 정보 입력해주세요.</dd>
					</dl>
					<div class="formblok_jy">
						<div class="formblokcontents">
							<label for="name" class="lbName" >
								<h6>이름</h6>
								<span class="wrapInput">
									<input id="inputName" name="name" type="text" autocomplete="off" value="${memVo.name}">
									<span class="name_error" id="name_error"></span>
								</span>
							</label>
							<label for="email" class="lbName" >
								<h6>이메일</h6>
								<span class="wrapInput">
									<input id="inputEmail" name="email" type="text" autocomplete="off" placeholder="(예시)ho@gmail.com" value="${memVo.email}">
									<span class="email_error" id="email_error"></span>
								</span>
							</label>
							<label for="hp" class="lbName" >
								<h6>휴대폰</h6>
								<span class="wrapInput">
									<input id="inputHp" name="hp" type="text" autocomplete="off" placeholder="(예시)01012341234" value="${memVo.hp}">
									<span class="hp_error" id="hp_error"></span>
								</span>
							</label>
						</div>
					</div>
				</header>
				<footer class="formfooter">
					<button type="submit"  id="profileEdit" >확인</button>
				</footer>
			</form>	
		</section>
		
	</div>
</div>

