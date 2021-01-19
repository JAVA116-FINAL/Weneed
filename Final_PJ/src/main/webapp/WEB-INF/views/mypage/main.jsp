<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageMain.css">
<div class="container">
	<h2>MY 원티드</h2>
	<div class="divWrapper">
		
		<div class="leftSideDivGroup">
			<div class="leftDiv">
				<div class="proImg">
					<i class="fas fa-user fa-5x"></i>
					<img src=""/>
					<div class="cameraIcon">
						<i class="fas fa-camera"></i>
					</div>
				</div>
				<div>
					<dt>이이름</dt>
					<dl>이메일주소</dl>
					<dl>휴대폰번호</dl>
				</div>
				<a class="basicInfoLink" href="">기본정보수정</a>
			</div>
			<div class="leftDiv leftPoint">
				<span>포인트</span><span class="number">1,000P</span>
			</div>
			<div class="leftDiv leftProposals">
				<div>
					<span>원해요 
					<i style="color:#bbbbbb;" class="far fa-question-circle"></i></span><span class="number">0</span>
				</div>
				<div>
					<span>열람</span><span class="number">0</span>
				</div>
				<div>
					<span>받은 제안</span><span class="number">0</span>
				</div>
			</div>
			<div class="leftDiv">
					<span>계정 설정</span>
			</div>
		</div>
		
		<div class="rightSideDivGroup">
			<div class="rightDiv rightApplyStatus">
			<h2 class="subTitleinRightDivs">지원 현황</h2>
				<div class="onlyStatus">
					<a class="applyStatusNum" href="">
						<strong>0</strong><span>지원 완료</span></a>
					<a class="applyStatusNum" href="">
						<strong>0</strong><span>서류 통과</span></a>
					<a class="applyStatusNum" href="">
						<strong>0</strong><span>최종 합격</span></a>
					<a class="applyStatusNum" href="">
						<strong>0</strong><span>불합격</span></a>
				</div>
			</div>
			<div class="rightDiv">
				<ul>
					<li>
						<a>
							<div class="booklikeTop">
								<h2 class="subTitleinRightDivsSecond">북마크</h2>
							</div>
							<div class="booklikeBody">
								<div class="booklikeLogo">
								<!-- 기업로고이미지 -->
								</div>
								<div class="booklikeContent">
									<h2>포지션 종류</h2>
									<p>기업명</p>
									<span>지역·국가</span>
								</div>
							</div>
						</a>
					</li>
				</ul>
				
			</div>
			<div class="rightDiv">
				<h2 class="subTitleinRightDivsSecond">좋아요</h2>
			</div>
			<div class="rightDiv">
				<h2 class="subTitleinRightDivsSecond">MY 영상</h2>
				<!-- 구매한 영상이 있을 때 -->
				
				<!-- 구매한 영상이 없을 때 -->
				<p>이벤트 메뉴에서 영상을 구매·추가해보세요</p>
				<a class="gotoEvent" href="">이벤트 바로가기</a>
			</div>
		</div>
	</div>
</div>

