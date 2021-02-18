<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/register.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/imgUpload.css">
<script type="text/javascript">
$(function(){
	$('#tabImg').attr("checked", 'checked');
	
	//[이미지 / 정보] 탭 기능 구현
	$('#tabImg').click(function(){
		$('.infoSection').addClass('hide');
		$('.imgSection').removeClass('hide');
		
		$('#tabImgLabel').addClass('selectedTab');
		$('#tabInfoLabel').removeClass('selectedTab');
	});
	$('#tabInfo').click(function(){
		$('.imgSection').addClass('hide');
		$('.infoSection').removeClass('hide');
		
		$('#tabInfoLabel').addClass('selectedTab');
		$('#tabImgLabel').removeClass('selectedTab');
	});

	//버튼 클릭하여 fileDialog open
	$('#comServImgAddBtn').click(function(){
		if($('#imgListSize').val() == '8'){
			alert('이미지는 8개까지 등록 가능합니다.');
			return false;
		}
		$('#imgFileInput').click();
	});
	
	
	//이미지 업로드 기능 구현
	$('#imgFileInput').change(function(){
		//선택한 이미지파일들을 ajax로 Controller에 전달
		var form = $('#imgForm')[0];
		console.log('form='+form);
	    var data = new FormData(form);
		console.log('data='+data);
		/* 
		//폼데이터가 비어있으면
		if(data.entries().next().done ){
			console.log('취소했다');			
			return false;
		} */
		
		$.ajax({
			url:'<c:url value="/company/imgUpload.do"/>',
			type:'POST',
			data:data,
			dataType:"json",
			enctype:"multipart/form-data",
			contentType:false, // false -> multipart/form-data
							   // true -> application/x-www-form-urlencoded 
			processData:false, // true: get방식 / false: post방식
			cache:false,
			success:function(result){
				//alert('success');
				//console.log(result);
				//추가로 붙여주기.. 미리보기를 넣어줘야 함
				//imgPreview(result[result.length-1].comImgUrl);
			},
			error:function(xhr, status, error){
				alert('error! : '+error);
			}
		});
		
		location.reload(true);
		//이미지 등록 후 새로고침 기능을 어떻게 넣어줘야 할 지...
	});

	 //이미지 삭제하기
	 $(document).on('click', '.comImgDelBtn', function(){
		// console.log('삭제');
		var fullsrc=$(this).next().attr('src');
		console.log(fullsrc);
		var imgFileName=fullsrc.substr(fullsrc.lastIndexOf('/')+1);
		console.log(imgFileName);
		var imgDiv=$(this).parent();
		console.log(imgDiv);
		$.ajax({
			url:"<c:url value='/company/imgDelete.do'/>",
			type:'get',
			data:{imgFileName:imgFileName},
			success:function(result){
			//	alert(result);
				imgDiv.remove();
				minusImgCount();
			},
			error:function(xhr, status, error){
				alert('error: '+error);
			}
		});
	});
});

function plusImgCount(){
	var imgCnt=$('#imgListSize').val();
	imgCnt++;
	$('#imgListSize').val(imgCnt);
}

//이미지 삭제시 카운트 줄여주는 함수
function minusImgCount(){
	var imgCnt=$('#imgListSize').val();
	imgCnt--;
	$('#imgListSize').val(imgCnt);
}

//이미지목록을 받아서 뿌려주는 함수 구현
function imgPreview(imgFileName){
	var imgStr="";
	
	imgStr+="<div class=\"imgBox imgPreviewBox\">";
	imgStr+="<img class=\"comImgDelBtn\" src=\"<c:url value='/resources/images/company/deleteImg.png'/>\" />";
	imgStr+="<img class=\"comImgs\" src=\"<c:url value='/companyImgUpload/"+imgFileName+"'/>\" alt=\"회사 대표이미지\"/>";
	imgStr+="</div>";
	
	console.log(imgStr);
	$('#imgForm').append(imgStr);
}

//선택한 이미지 미리보기
function readURL(input) {
	if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.readAsDataURL(input.files[0]);
	
	    reader.onload = function (e) {
	    	var tempImage=new Image();
	    	tempImage.src=reader.result;
	    	console.log(tempImage);
	    	tempImage.onload=function(){
	    		var canvas=document.createElement('canvas');
	    		var canvasContext=canvas.getContext("2d");
	    		
	        	var img = new Image();
	        	img.src = e.target.result;
	        	
	    		canvas.width=225;
	    		canvas.height=170;
	    		
	    		canvasContext.drawImage(this,0,0,canvas.width,canvas.height);
	    		
	    		var dataURI=canvas.toDataURL("image/png");
	    		
	    		document.querySelector("#test").src=dataURI;
	    		document.getElementById('test').classList.toggle('hide');
	    	}
	    };
	}
}
</script>
<body>
	<div class="container">
		<!-- 탭 섹션 -->
		<input type="hidden" id="imgListSize" value="${fn:length(imgList)}">
		<section class="tabSection">
			<input type="radio" id="tabImg" name="comInfoRegi" />
			<label for="tabImg" id="tabImgLabel" class="comInfoRegiTab selectedTab">이미지</label>
			<input type="radio" id="tabInfo" name="comInfoRegi" class="comInfoRegiTab" />
			<label for="tabInfo" id="tabInfoLabel" class="comInfoRegiTab">정보</label>
		</section>
		<!-- 이미지등록 탭 -->
		<!-- 이미지는 한 번에 한 개만 선택해서 등록할 수 있다 -->
		<!-- 승인중 / 승인됨 / 거절됨 딱지가 붙을 자리를.. top left 0으로 맞춰서 노출시켜야 함.  -->
		<section class="imgSection">
			<h2 class="comServTitle">대표 이미지</h2>
			<p class="comServTitle-imageCountGuide">*대표 이미지는 최대 8개까지 등록 가능합니다.</p>
			<div id="imgBoxWrapper" class="imgBoxWrapper">
				<c:forEach var="imgVo" items="${imgList}">
					<div class="imgBox imgPreviewBox">
						<c:if test="${imgVo.comImgPassed eq 'N'}">
							<img class="comImgPassTicket" src="${pageContext.request.contextPath}/resources/images/company/passingImg.png"/>
						</c:if>
						<c:if test="${imgVo.comImgPassed eq 'Y'}">
							<img class="comImgPassTicket" src="${pageContext.request.contextPath}/resources/images/company/passedImg.png"/>
						</c:if>
						<c:if test="${imgVo.comImgPassed eq 'R'}">
							<img class="comImgPassTicket" src="${pageContext.request.contextPath}/resources/images/company/rejectedImg.png"/>
						</c:if>
						<img class="comImgDelBtn" src="<c:url value='/resources/images/company/deleteImg.png'/>" />
						<img class="comImgs" src="${pageContext.request.contextPath}/companyImgUpload/${imgVo.comImgUrl}" alt="회사 대표이미지"/>
					</div>
				</c:forEach>
				<img id="test" class="comImgs hide imgBox"/>			
				<form id="imgForm" name="imgForm" method="post" enctype="multipart/form-data" action='<c:url value="/company/imgUpload.do"/>'>
					<input type="file" id="imgFileInput" name="imgFileInput" data-input="false" class="image_inputType_file" 
						accept="image/*" style="display:none"/>
				</form>
				<button class="imgBox imgPlusBox" id="comServImgAddBtn"> <!-- 사진 업로드 버튼, 8장 등록되면 숨김처리되도록  -->
					<div class="imgPlusBtn">
						<i class="fas fa-plus fa-3x"></i>
					</div>
					<span class="sizeInfoSpan">1080 X 790 이상</span>
				</button>
			</div>
			<!-- <h2 class="comServTitle">로고 이미지</h2>
			<div class="imgBoxWrapper">
				<div class="imgBox">
					
				</div>
			</div> -->
		</section>
		<!-- 기업정보 수정 탭 -->
		<section class="infoSection hide">
			<h2 class="comServTitle">기업정보 수정</h2>
			<form id="comServInfoModiForm" class="appoinment-form" method="post" action="#">
	           	<div class="row">
	               	<div class="col-lg-6">
	                   	<div class="form-group">
	                    	<span class="comServFormTitle">회사이름</span><span class="comServRequired">*</span>
	                       	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	name="comName" id="comName" type="text" class="form-control comServFormInput" placeholder="회사 이름"
	                       	value="${comInfoVo.comName}">
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                        <div class="form-group">
	                    		<span class="comServFormTitle">국가</span><span class="comServRequired">*</span>
	                       	<select style="background-color: #ffffff;outline-color: #dbdbdb;" 
	                       	class="form-control comServFormInput" id="nation" value="${comInfoVo.nation}">
	                           	<option>한국</option>
	                             	<!-- 테이블에서 목록 불러오기 -->
	                           </select>
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                    		<span class="comServFormTitle">지역</span><span class="comServRequired">*</span>
	                       	<select style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	class="form-control comServFormInput" id="region" value="${comInfoVo.region}">
	                           	<option>서울</option>
	                             	<!-- 테이블에서 목록 불러오기 -->
	                           </select>
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                     <span class="comServFormTitle">대표 주소</span><span class="comServRequired">*</span>
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                           name="comAddress" id="comAddress" type="text" class="form-control comServFormInput" placeholder="대표 주소 입력"
	                           value="${comInfoVo.comAddress}">
	                       </div>
						</div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                    	<span class="comServFormTitle">사업자 등록 번호</span><span class="comServRequired">*</span>
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                            name="comRegNo" id="comRegNo" type="text" class="form-control comServFormInput" placeholder="'-' 제외 10자리"
	                            value="${comInfoVo.comRegNo}">
	                       </div>
	                    </div>
	                    <div class="col-lg-6 comServ_oneLineDiv">
	                       <div class="form-group">
	                       	   <span class="comServFormTitle">매출액/투자금액</span><span class="comServInfoSentence">(승인기준: 매출액/투자 유치 5억원 이상)</span><span class="comServRequired">*</span>
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                            name="profit" id="profit" type="text" class="form-control comServFormInput" placeholder="매출액/투자금액 입력 (단위: 억원)"
	                            value="${comInfoVo.profit}">
	                       </div>
	                    </div>
	                    <div class="col-lg-6">
	                       <div class="form-group">
	                    	<span class="comServFormTitle">산업군</span><span class="comServRequired">*</span>
	                           <select style="background-color: #ffffff;outline-color: #dbdbdb;"
	                           class="form-control comServFormInput" id="industry">
	  		                          <option>산업군</option>
	          	    	              <!-- 테이블에서 목록 불러오기 -->
	              	            </select>
	                       </div>
	                   </div>
	                   <div class="col-lg-6">
	                       <div class="form-group">
	                  		<span class="comServFormTitle">직원수</span><span class="comServInfoSentence">(승인기준: 팀원 10명 이상)</span><span class="comServRequired">*</span>
	                       	 <select style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	  id="comSize" class="form-control comServFormInput">
	  		                          <option>회사규모</option>
	          	    	              <!-- 테이블에서 목록 불러오기 -->
	              	            </select>
	                    	</div>
	                    </div>
	                </div>
	                <div class="row">
	                 <div class="col-lg-6 comServ"  style="width:207%">
	                  <div class="form-group">
	                  	<span class="comServFormTitle">회사/서비스 소개</span><span class="comServInfoSentence">(3,000자 제한)</span><span class="comServRequired">*</span>
	                      <textarea style="background-color: #ffffff;outline-color: #dbdbdb;display:block;width:207%"
	                      name="comIntro" id="comIntro" class="form-control comServFormInput" rows="6" placeholder="회사 정보 입력"
	                      >${comInfoVo.comIntro}</textarea>
	                  </div>
	                 </div>
	                </div>
	                <div class="row">
					<div class="col-lg-6">
	                   		<div class="form-group">
	                		<span class="comServFormTitle">설립연도</span><span class="comServRequired">*</span>
	                        	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                        	name="comYear" id="comYear" type="text" class="form-control comServFormInput" placeholder="ex) 2012년"
	                        	value="${comInfoVo.comYear}">
	                    	</div>
	                	</div>
	               		<div class="col-lg-6">
	               		<span class="comServFormTitle">정보 수신 이메일</span><span class="comServRequired">*</span>
	                   	<div class="form-group">
	                       	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	name="comEmails" id="comEmails" type="text" class="form-control comServFormInput" placeholder=""
	                       	value="${comInfoVo.comEmails}">
	              			</div>
	               		</div>
	               		<div class="col-lg-6">
	                		<span class="comServFormTitle">담당자 연락처</span><span class="comServRequired">*</span>
	                   	<div class="form-group">
	                       	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
	                       	 name="comPhone" id="comPhone" type="text" class="form-control comServFormInput" placeholder=""
	                       	 value="${comInfoVo.comPhone}">
	                   	</div>
	                	</div>
	                	<div class="col-lg-6">
	                 		<span class="comServFormTitle">웹사이트 주소</span>
	                  		<div class="form-group">
	                       		<input style="background-color: #ffffff;outline-color: #dbdbdb;width:100%"
	                      	 	name="comWebsite" id="comWebsite" type="text" class="form-control comServFormInput" 
	                      	 	placeholder="URL 입력 (여러개 등록 시 ','로 구분)" value="${comInfoVo.comWebsite}">
	                   		</div>
	                	</div>
	               	</div>
	             <div class="row">
	                   	<div class="col-lg-6">
	                   	<span class="comServFormTitle">뉴스 검색 키워드</span><span class="comServInfoSentence">(키워드는 최대 3개까지 입력 가능합니다.)</span>
	                       <div class="form-group">
	                           <div style="display:flex;width:207%">
	                             <input style="background-color: #ffffff;outline-color: #dbdbdb;width:180%"
	                             name="comKeywords" id="comKeywords" type="text" class="form-control comServFormInput" placeholder="서비스명 또는 브랜드명 입력"
	                             value="${comInfoVo.comKeywords}">
	                           </div>
	                       </div>
	                   </div>
	                </div>
	                <div class="row">
	                   <div class="col-lg-6" style="display:block;">
	                   	<span class="comServFormTitle">가입 경로</span><span class="comServInfoSentence">(원티드를 추천한 기업과 추천인을 입력해 주세요.)</span>
	                       <div class="form-group">
	                           <input style="background-color: #ffffff;outline-color: #dbdbdb;width:207%"
	                            name="comRecom" id="comRecom" type="text" class="form-control comServFormInput" placeholder="ex) 원티드랩/김OO담당자"
	                            value="${comInfoVo.comRecom}">
	                       </div>
	                   </div>
	                </div>
	                <div class="comServModiSumbitWrapper">
		                <input type="submit" class="btn btn-main btn-round-full btnComServModiSubmit" value="제출하기">
	                </div>
	           </form>
	     </section>
	</div>
</body>
</html>