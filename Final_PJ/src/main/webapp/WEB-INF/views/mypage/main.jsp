<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypageMain.css">
<script type="text/javascript">
$(function(){
	
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
				<div class="proImg">
					<div id="divupfile" class="member-img_jy">
						 <!-- 폼은 어디갔니 -->
							<div class="memberImg" id="memberImg">
								<c:if test="${empty memVo.fileName }">
									<i class="fas fa-user fa-5x"></i>
								</c:if>
								<c:if test="${!empty memVo.fileName }">
									<img class="img_member_jy" alt="회원이미지" src="<c:url value='/resources/memberImgUpload/${memVo.fileName }'/>">
								</c:if>
							</div>
							<form name="frmUpfile" id="frmUpfile" method="post" enctype="multipart/form-data" action="<c:url value='/mypage/fileUpload.do'/>">
								<input class="inputimg_jy" type="file" name="upfile" id="upfile" accept="image/*" >
								<input type="hidden" name="oldFileName" value="${memVo.fileName}"/>
								<button id="btUpfile" type="button" onclick="$('#upfile').trigger('click');">
									<i class="icon-camera_icon camerai_jy"></i>
								</button>
							</form>
						</div>
				</div>
				<div>
					<dl>
						<dt>${memVo.name }</dt>
						<dd>${memVo.email }</dd>
						<dd>${memVo.hp }</dd>
					</dl>
				</div>
				<a class="basicInfoLink" onclick="location.href='<c:url value="/mypage/profileEdit.do"/>'"><span>기본정보수정</span></a>
			</div>
			<div class="leftDiv leftPoint">
				<span>포인트</span><span class="number">1,000P</span>
			</div>
			<div class="leftDiv leftProposals">
				<div>
					<span>원해요 
					<i style="color:#bbbbbb;" class="far fa-question-circle"></i>
					</span><a href="#" class="number">${likeCnt }</a>
				</div>
				<div>
					<span>열람</span><a href="#" class="number">${openResumeCnt }</a>
				</div>
				<div>
					<span>받은 제안</span><a href="#" class="number">${proposalCnt }</a>
				</div>
			</div>
			<div class="leftDiv">
					<a href="<c:url value='/profileSetting/setting.do'/>">계정 설정</a>
			</div>
		</div>
		<div class="rightSideDivGroup">
			<div class="rightDiv rightApplyStatus">
				<h2 class="subTitleinRightDivs">지원 현황</h2>
				<div class="onlyStatus">
					<a class="applyStatusNum" href="">
						<strong>${applyComplete}</strong><span>지원 완료</span></a>
					<a class="applyStatusNum" href="">
						<strong>${documentPass}</strong><span>서류 통과</span></a>
					<a class="applyStatusNum" href="">
						<strong>${finalAccept}</strong><span>최종 합격</span></a>
					<a class="applyStatusNum" href="">
						<strong>${finalFail}</strong><span>불합격</span></a>
				</div>
			</div>
			<div class="rightDiv">
				<div class="booklikeTop">
					<h2 class="subTitleinRightDivsSecond">북마크</h2>
					<!-- 전체보기는 북마크 리스트가 있을때만 -->
					<a class="seeMore" href="#">총 4개 전체보기 
						<i class="seeMore fas fa-chevron-right"></i></a>
				</div>
				<div class="booklikeBody">
					<ul class="booklikeUL">
						<li class="booklikeLi">
							<a class="bookLikeAllBody" href="#">
								<div class="booklikeLogo">
									<!-- 기업로고이미지 -->
								</div>
								<div class="booklikeContent">
									<h2>포지션 종류</h2>
									<p>기업명</p>
									<span>지역·국가</span>
								</div>
							</a>
						</li>
						<li class="booklikeLi">
							<a class="bookLikeAllBody" href="#">
								<div class="booklikeLogo">
									<!-- 기업로고이미지 -->
								</div>
								<div class="booklikeContent">
									<h2>포지션 종류</h2>
									<p>기업명</p>
									<span>지역·국가</span>
								</div>
							</a>
						</li>
						<li class="booklikeLi">
							<a class="bookLikeAllBody" href="#">
								<div class="booklikeLogo">
									<!-- 기업로고이미지 -->
								</div>
								<div class="booklikeContent">
									<h2>포지션 종류</h2>
									<p>기업명</p>
									<span>지역·국가</span>
								</div>
							</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="rightDiv">
				<div class="booklikeTop">
					<h2 class="subTitleinRightDivsSecond">좋아요</h2>
					<!-- 전체보기는 좋아요 리스트가 있을 때만 -->
					<a class="seeMore" href="#">총 4개 전체보기 
						<i class="seeMore fas fa-chevron-right"></i></a>
				</div>
				<!-- 등록한 기업이 없을 때 -->
				<div class="nonebookLikeBody">
					<span class="nonebookLike">아직 등록한 기업이 없습니다.</span><br>
					<a href="#" class="nonebookLikeA">채용공고 보러 가기</a>
				</div>
				
					<!-- 등록한 기업이 있을 때 -->
				<div class="booklikeBody">
					
				</div>
			</div>
			<div class="rightDiv eventMother">
				<h2 class="subTitleinRightDivsSecond">MY 영상</h2>
				<!-- 구매한 영상이 있을 때 -->
				
				<!-- 구매한 영상이 없을 때 -->
				<p>이벤트 메뉴에서 영상을 구매·추가해보세요</p>
				<a class="gotoEvent" href="">
					<span>이벤트 바로가기</span></a>
			</div>
		</div>
	</div>
</div>

