<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/mypage/mypageMain.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/mypage/profileEdit.css'/>">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
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
	
});
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
								<input id="name" name="name" type="text" autocomplete="off" value="${memVo.name}">
							</label>
							<label for="email" class="lbName" >
								<h6>이메일</h6>
								<input id="email" name="email" type="text" autocomplete="off" value="${memVo.email}">
							</label>
							<label for="hp" class="lbName" >
								<h6>휴대폰</h6>
								<input id="hp" name="hp" type="text" autocomplete="off" placeholder="(예시)01012341234" value="${memVo.hp}">
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

