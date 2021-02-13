<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/wantedegigs_top.jsp"%>

<script type="text/javascript">
$(function(){
	$('#expName').focus();
	
	//다음 단계로 버튼 클릭시,
	$('form[name=form_2]').find('#expert-next-1').click(function(){
		location.href='<c:url value="/freelancer/expertRegister/expertRegister2.do"/>';
	});
/* 	$('form[name=form_2]').find('input[type=button]').click(function(){
		location.href='<c:url value="/board/list.do"/>';
	}); */
	
	/* 위니드 로그인 전에는, 모든 input, button 비활성화 */
	
	$('form[name=form_2]').submit(function(){
		if($('#expName').val().length<1){
			$('#expName-None').html("전문가님의 이름을 입력해주세요.");
			$('#expName').focus();
			event.preventDefault();
		}else if($('#expEmail').val().length<1){
			$('#expEmail-None').html("연락가능한 이메일을 입력해주세요.");
			$('#expEmail').focus();
			event.preventDefault();
		}else if($('#expHp').val().length<1){
			$('#expHp-None').html("연락가능한 휴대폰 번호를 입력해주세요.");
			$('#expHp').focus();
			event.preventDefault();
		}			
	});
	
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


<section class="contact-form-wrap section"
	style="background-color: #f2f4f7;">
	<div class="container">
		<div class="row justify-content-center">
			<div>
				<div class="free-section-title text-center">
					<h2>전문가 등록</h2>
					<h4>전문가로 등록하고, 다양한 혜택과 함께 딱 맞는 프로젝트/의뢰를 받아보세요.</h4>

				</div>
			</div>
		</div>

		<form id="form_2" class="proj-register-2" method="post" action="<c:url value='/expertRegister/expregister1.do'/>">
			<div class="form-style">
				<div class="steps-content-title" style="margin-bottom: 15px">프로젝트
					등록 시 연락 받을 수 있는 정보를 입력해주세요.</div>
				<div class="steps-content-title"
					style="font-size: 15px; color: #6d7278;">등록하신 정보는 원티드 긱스 풀을
					이용하는 검증된 기업만이 조회가능하며, 이외 용도로는 활용되지 않습니다.</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<span class="projTitle">전문가 이름</span><span class="register-star">*</span>
							<input
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px; font-size: 1rem;"
								name="expName" id="expName" type="text"
								class="form-control projRegisterForm" placeholder="전문가 이름 입력">
							<div id="expName-None" class="error"></div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<span class="projTitle">회사/팀명</span> <input
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px; font-size: 1rem;"
								name="expComName" id="expComName" type="text"
								class="form-control projRegisterForm" placeholder="회사/팀명 입력">
							<span class="projDetailText" style="font-size: 14px;">소속이
								있을 경우만 입력해주세요.</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<span class="projTitle">이메일</span><span class="register-star">*</span>
							<input
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px; font-size: 1rem;"
								name="expEmail" id="expEmail" type="text"
								class="form-control projRegisterForm"
								placeholder="연락 가능한 이메일을 입력">
							<div id="expEmail-None" class="error"></div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<span class="projTitle">연락처</span><span class="register-star">*</span>
							<input
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px; font-size: 1rem;"
								name="expHp" id="expHp" type="text"
								class="form-control projRegisterForm"
								placeholder="연락 가능한 휴대폰 번호 입력">
							<div id="expHp-None" class="error"></div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<span class="projTitle">직군/직무</span><span class="register-star">*</span>
							<select
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
								class="form-control projRegisterForm" id="expJikgun">
								<option>직군을 입력해주세요.</option>
								<!-- 직군 테이블 받아오기 -->
								<!-- 직군 선택 => 직무 셀렉트  -->
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="form-buttonArea">
				<button type="button" class="form-blueButton" id="expert-next-1"
					onclick="location.href='${pageContext.request.contextPath}/freelancer/expertRegister/expertRegister2.do'">다음
					단계로</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="../../inc/bottom.jsp"%>