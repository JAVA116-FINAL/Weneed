<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/wantedegigs_top.jsp"%>

<script type="text/javascript">
	$(function() {
		$('#btn-upload').click(function(e) {
			e.preventDefault();
			$('#file').click();
		});
	});

	function changeValue(obj) {
		alert(obj.value);
	}
</script>

<style type="text/css">
#file {
	display: none;
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

		<form id="form_2" class="proj-register-2" method="post" action="#">
			<div class="form-style">
				<div class="steps-content-title">전문가님의 정보를 입력하여 주세요.</div>
				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<span class="projTitle">근무 형태</span><span class="register-star">*</span>
							<select
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
								class="form-control projRegisterForm" id="expWorkType">
								<option>근무 형태를 선택해주세요.</option>
								<option>풀타임</option>
								<option>파트타임</option>
								<option>풀타임,파트타임 모두 가능</option>
							</select>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group">
							<span class="projTitle">근무 가능 장소</span><span
								class="register-star">*</span> <select
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
								class="form-control projRegisterForm" id="expWorkPlace">
								<option>선호 근무지를 선택해주세요.</option>
								<option>상주</option>
								<option>원격</option>
								<option>상주,원격 모두 가능</option>
							</select> <span class="projDetailText" style="font-size: 14px;">선호하시는
								근무 가능 장소를 선택해주세요.<br> *상주 근무 선택시, 매칭 확률이 더 올라갑니다.
							</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<div class="form-group">
							<span class="projTitle">프리랜서 경험</span><span class="register-star">*</span>
							<div style="margin-top: 10px;">
								<label class="projDetailText" style="padding: 0px 10px 0px 0px">
									<input type="radio" name="expFreeExpre" value="expreY">있음
								</label> <label class="projDetailText" style="padding: 0px 10px 0px 0px">
									<input type="radio" name="expFreeExpre" value="expreN">없음
								</label>
							</div>
							<span class="projDetailText" style="font-size: 14px;">프리랜서/단기
								계약직 업무를 진행해보신 경험을 공유해주세요.</span>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<span class="projTitle">경력</span>
							<div>
								<div style="float: left; width: 93%">
									<input
										style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
										name="expCareer" id="expCareer" type="search"
										class="form-control projRegisterForm" placeholder="경력(년차)">
								</div>
								<div class="col-lg-6" style="float: left; width: 7%">
									<span class="projDetailText"
										style="float: left; padding: 6px 3px; margin: 20px 0px">년</span>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<span class="projTitle">희망 급여</span>
							<div>
								<div style="float: left; width: 65%">
									<input
										style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
										name="projSkill" id="expPay" type="text"
										class="form-control projRegisterForm" placeholder="희망 급여">
								</div>
								<div style="float: left; width: 10%">
									<span class="projDetailText"
										style="float: left; padding: 6px 3px; margin: 20px 0px">만원</span>
								</div>
								<div class="col-lg-6"
									style="float: left; width: 25%; padding-left: 0px">
									<select
										style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
										class="form-control projRegisterForm" id="#">
										<option>월급</option>
										<option>주급</option>
										<option>일급</option>
										<option>시급</option>
									</select>

								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6">
						<div class="form-group" style="margin-bottom: 0px">
							<span class="projTitle">프로젝트 시작 가능일</span><span
								class="register-star">*</span> <input
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
								name="projStartDate" id="projStartDate" type="date"
								class="form-control projRegisterForm" placeholder="날짜 선택">
						</div>
						<div class="form-group">
							<!-- 체크하면 현재 날짜 들어가게 -->
							<input
								style="width: 15px; height: 15px; border: 1px solid #979da4;"
								type="checkbox" id="expStart" value="프로젝트 즉시 시작"> <span
								class="projDetailText">현재 근무 가능</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group">
							<span class="projTitle">스킬 입력</span> <input
								style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
								name="expSkill" id="expSkill" type="search"
								class="form-control projRegisterForm" placeholder="스킬 선택">
							<span class="projDetailText" style="font-size: 14px;">직군/직무와
								연관된 본인의 스킬과 사용툴을 입력해주세요. 스킬이 검색이 안되신다면 자기소개에 내용을 입력해 주시기 바랍니다.</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group" style="margin-bottom: 0px">
							<span class="projTitle">자기소개</span>
							<textarea id="projDetail" class="form-control projRegisterForm"
								placeholder="간단히 자신을 소개해보세요."
								style="background-color: #ffffff; border: 1px solid #d9d9d9; margin-top: 10px"></textarea>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group" style="margin-bottom: 10px">
							<span class="projTitle">이력서/포트폴리오 업로드</span>
						</div>
						<div class="form-group">
							<input type="file" id="file" name="file"
								onchange="changeValue(this)" />
							<button type="button" id="btn-upload" 
									style="margin: 5px 0px; border-radius: 5px; width: 120px; height: 44px; background-color: #f2f4f7;"
							>파일 선택</button>
							
							<!-- 파일 선택하면   -->
							<br> <span class="projDetailText" style="font-size: 14px;">이력서
								또는 포트폴리오 파일을 선택해주세요.</span>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-lg-12">
						<div class="form-group" style="margin-bottom: 10px">
							<span class="projTitle">개인정보 제3자 제공 동의</span> <span
								class="register-star">*</span> <br>
						</div>
						<div>
							<input
								style="width: 15px; height: 15px; border: 1px solid #979da4; float: left; margin: 3px 5px 0px 0px;"
								type="checkbox" id="expAgree" value="개인정보 동의"
								class="form-control projRegisterForm"> <span
								class="projDetailText" style="font-size: 14px;"> (필수) 입력한
								정보는 계약 진행을 위해 필요한 경우에 한하여 기업회원에게 전달됩니다.</span>
						</div>
					</div>
				</div>
			</div>

			<div class="form-buttonArea">
				<button type="button" class="form-whiteButton"
					onclick="location.href='${pageContext.request.contextPath}/freelancer/expertRegister/expertRegister1.do'">이전
					단계로</button>
				<button type="button" class="form-blueButton"
					onclick="location.href='${pageContext.request.contextPath}/freelancer/expertRegister/expertRegister3.do'">등록
					완료</button>
			</div>
		</form>
	</div>
</section>

<%@ include file="../../inc/bottom.jsp"%>