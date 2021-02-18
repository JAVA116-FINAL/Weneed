<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/register.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/member.css">
<script type="text/javascript" src="<c:url value='/resources/js/hyunbin.js'/>"></script>
<title>Wanted - 회사 정보 등록</title>
<script type="text/javascript">
$(function(){
	
	//ajax 사용해서 국가선택에 따라 지역목록 받아야 함
	//국가코드를 보내서 지역목록을 리스트로 받아온다.
	//받아온 리스트를 select에 option으로 append해준다. option value와 option의 html로 구분해서 더해줘야 한다.
	$('#nation').change(function(){
		$('#region option').remove();
		var nationCode=$('#nation option:selected').val();		
		$.ajax({
			url:"<c:url value='/company/selectRegionbyNation.do'/>",
			dataType:"json",
			data:"nationCode="+nationCode,
			type:'get',
			success:function(result){
				//각자에 대해 option에 append 해주면 돼.
				for(item of result){
					//alert(item.regionCode);
					//alert(item.regionNameKr);
					var option="<option value="+item.regionCode+">"+item.regionNameKr+"</option>";		
					$('#region').append(option)
				}
			},
			error:function(xhr, status, error){
				alert('error! '+error);
			}
		});
	});
	
	//유효성 검사 - 입력여부 검사: 회사이름, 대표주소, 사업자등록번호, 매출액/투자금액, 회사/서비스 소개, 설립연도, 
	//정보수신이메일, 담당자 연락처, 웹사이트 주소, 뉴스 검색 키워드, 가입경로,
	//이용약관 동의
	$('#comServInfoRegiFormSubmitBtn').click(function(){
		
		if($('#comName').val().length<1){
			$('#alertSpanComName').html("회사명을 입력하세요.");
			$('#comName').focus();
			return false;
		} 
		if($('#comAddress').val().length<1){
			$('#alertSpanComAddress').html("대표 주소를 입력하세요.");
			$('#comAddress').focus();
			return false;
		}
		if($('#comRegNo').val().length<1){
			$('#alertSpanComRegNo').html("사업자등록번호를 입력하세요.");
			$('#comRegNo').focus();
			return false;
		}
		if($('#profit').val().length<1){
			$('#alertSpanProfit').html("매출액/투자금액을 입력하세요.");
			$('#profit').focus();
			return false;
		}
		if($('#comIntro').val().length<1){
			$('#alertSpanComIntro').html("회사/서비스 소개를 입력하세요.");
			$('#comIntro').focus();
			return false;
		}
		if($('#comYear').val().length<1){
			$('#alertSpanComYear').html("설립연도를 입력하세요.");
			$('#comYear').focus();
			return false;
		}
		if($('#comEmails').val().length<1){
			$('#alertSpanComEmails').html("정보 수신 이메일을 입력하세요.");
			$('#comEmails').focus();
			return false;
		}
		if($('#comPhone').val().length<1){
			$('#alertSpanComPhone').html("담당자 연락처를 입력하세요.");
			$('#comPhone').focus();
			return false;
		}
		//이용약관 동의 체크 안했을 시 
		if($('#comMemAgree').is(":checked")==false){
			alert('이용약관에 동의하세요.');
			$('#comMemAgree').focus();
			return false;
		}
		
		$('#comServInfoRegiForm').submit();
	});
	
	$('#comName').keyup(function(){ 
		keyupCheck($('#comName'), '회사명을', $('#alertSpanComName'));
	});
	$('#comAddress').keyup(function(){ 
		keyupCheck($('#comAddress'), '대표 주소를', $('#alertSpanComAddress'));
	});
	$('#comRegNo').keyup(function(){ 
		keyupCheck($('#comRegNo'), '사업자 등록번호를', $('#alertSpanComRegNo'));
	});
	$('#profit').keyup(function(){ 
		keyupCheck($('#profit'), '매출액/투자금액을', $('#alertSpanProfit'));
	});
	$('#comIntro').keyup(function(){ 
		keyupCheck($('#comIntro'), '회사 서비스/소개를', $('#alertSpanComIntro'));
	});
	$('#comYear').keyup(function(){ 
		keyupCheck($('#comYear'), '설립연도를', $('#alertSpanComYear'));
	});
	$('#comEmail').keyup(function(){ 
		keyupCheck($('#comEmail'), '정보 수신 이메일을', $('#alertSpanComEmail'));
	});
	$('#comMobile').keyup(function(){ //아이디 인풋박스에 키업이벤트
		keyupCheck($('#comMobile'), '담당자 연락처를', $('#alertSpanComMobile'));
	});
});	

</script>
</head>
<body>
<section class="section-comRegi">
	<div class="container">
       	<h2 class="mb-2 comServRegiBigTitle" style="font-weight: bold;">회사 정보를 등록해 주세요.</h2>
       	<p class="mb-4 comServRegiSmallTitle">
       		위니드는 추천인/후보자들에게 좋은 일자리를 제공하기 위해, 다음 정보를 리뷰하여 회사등록을 승인하고 있습니다.</p>
      	<form id="comServInfoRegiForm" class="appoinment-form" method="post" action="#">
      		<input type="hidden" name="comMemNo" value="${comMemInfoVo.comMemNo}">
       	<div class="row">
           	<div class="col-lg-6">
               	<div class="form-group boundDivSpan">
                	<span class="comServFormTitle">회사명</span><span class="comServRequired">*</span>
                   	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	name="comName" id="comName" type="text" class="form-control comServFormInput" placeholder="회사명">
                   	<span class="alertSpan" id="alertSpanComName"></span>
                   </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                		<span class="comServFormTitle">국가</span><span class="comServRequired">*</span>
                   		<select style="background-color: #ffffff;outline-color: #dbdbdb;" 
                   		class="form-control comServFormInput" id="nation" name="nation">
                       	<!-- 테이블에서 목록 불러오기 -->
                       	<c:forEach var="nationVo" items="${nationList}">
                       		<option value="${nationVo.nationCode }">${nationVo.nationNameKr}</option>
                       	</c:forEach>
                       </select>
                   </div>
                </div>
                <div class="col-lg-6">
                   <div class="form-group">
                		<span class="comServFormTitle">지역</span><span class="comServRequired">*</span>
                   	<select style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	class="form-control comServFormInput" id="region" name="region">
                         	<!-- 테이블에서 목록 불러오기. nation select문에서 세팅된 값에 따라 달라져야 함. 어떻게?  -->
                         	<c:forEach var="regionVo" items="${regionList}">
                         		<option value="${regionVo.regionCode}">${regionVo.regionNameKr}</option>
                         	</c:forEach>
                       </select>
                   </div>
                </div>
                <div class="col-lg-6">
                   <div class="form-group boundDivSpan">
               		   <span class="comServFormTitle">대표 주소</span><span class="comServRequired">*</span>
                       <input style="background-color: #ffffff;outline-color: #dbdbdb;"
                       name="comAddress" id="comAddress" type="text" class="form-control comServFormInput" placeholder="대표 주소 입력">
                    	<span class="alertSpan" id="alertSpanComAddress"></span> 
                  	</div>
				</div>
                  <div class="col-lg-6">
                     <div class="form-group boundDivSpan">
                  		<span class="comServFormTitle">사업자 등록 번호</span><span class="comServRequired">*</span>
                        <input style="background-color: #ffffff;outline-color: #dbdbdb;" maxlength="10" onkeypress="checklength()"
                        name="comRegNo" id="comRegNo" type="number" class="form-control comServFormInput" placeholder="'-' 제외 10자리">
                   		<span class="alertSpan" id="alertSpanComRegNo"></span> 
                   </div>
                </div>
                <div class="col-lg-6 comServ_oneLineDiv">
                   <div class="form-group boundDivSpan">
               			<span class="comServFormTitle">매출액/투자금액</span><span class="comServInfoSentence">(승인기준: 매출액/투자 유치 5억원 이상)</span><span class="comServRequired">*</span>
                        <input style="background-color: #ffffff;outline-color: #dbdbdb;"
                        name="profit" id="profit" type="text" class="form-control comServFormInput" placeholder="매출액/투자금액 입력 (단위: 억원)">
                   		<span class="alertSpan" id="alertSpanProfit"></span> 
                   </div>
                </div>
                <div class="col-lg-6">
                   <div class="form-group ">
                	<span class="comServFormTitle">산업군</span><span class="comServRequired">*</span>
                       <select style="background-color: #ffffff;outline-color: #dbdbdb;"
                       class="form-control comServFormInput" name="industry" id="industry">
                         <c:forEach var="industryVo" items="${industryList}">
                       		<option value="${industryVo.industryName }">${industryVo.industryName}</option>
                       	</c:forEach>
          	            </select>
                   </div>
               </div>
               <div class="col-lg-6">
                   <div class="form-group">
              		<span class="comServFormTitle">직원수</span><span class="comServInfoSentence">(승인기준: 팀원 10명 이상)</span><span class="comServRequired">*</span>
                   	 	<select style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	  		name="comSize" id="comSize" class="form-control comServFormInput">
                        	<c:forEach var="comSizeVo" items="${comSizeList}">
                       			<option value="${comSizeVo.comSize }">${comSizeVo.comSize}</option>
                       		</c:forEach>
          	        	</select>
                	</div>
                </div>
            </div>
            <div class="row">
             <div class="col-lg-6 comServ"  style="width:207%">
              <div class="form-group boundDivSpan">
              	<span class="comServFormTitle">회사/서비스 소개</span><span class="comServInfoSentence">(3,000자 제한)</span><span class="comServRequired">*</span>
                  <textarea style="background-color: #ffffff;outline-color: #dbdbdb;display:block;width:207%"
                  name="comIntro" id="comIntro" class="form-control comServFormInput" rows="6" placeholder="회사 정보 입력"></textarea>
               		<span class="alertSpan" id="alertSpanComIntro"></span> 
                </div>
               </div>
              </div>
              <div class="row">
			<div class="col-lg-6">
               	<div class="form-group boundDivSpan">
            		<span class="comServFormTitle">설립연도</span><span class="comServRequired">*</span>
                   	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	name="comYear" id="comYear" type="text" class="form-control comServFormInput" placeholder="ex) 2012년">
	           		<span class="alertSpan" id="alertSpanComYear"></span> 
               	</div>
            </div>
           	<div class="col-lg-6">
               	<div class="form-group boundDivSpan">
	           		<span class="comServFormTitle">정보 수신 이메일</span><span class="comServRequired">*</span>
                   	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	name="comEmails" id="comEmails" type="text" class="form-control comServFormInput" placeholder=""
                   	value="${comMemId}">
	           		<span class="alertSpan" id="alertSpanComEmails"></span> 
          		</div>
           	</div>
           	<div class="col-lg-6">
            		<span class="comServFormTitle">담당자 연락처</span><span class="comServRequired">*</span>
               	<div class="form-group boundDivSpan">
                   	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	 name="comPhone" id="comPhone" type="text" class="form-control comServFormInput" placeholder=""
                   	 value="${comMemInfoVo.comMobile}">
	           		<span class="alertSpan" id="alertSpanComMobile"></span> 
               	</div>
            	</div>
            	<div class="col-lg-6">
              		<div class="form-group boundDivSpan">
	             		<span class="comServFormTitle">웹사이트 주소</span>
                   		<input style="background-color: #ffffff;outline-color: #dbdbdb;width:100%"
                  	 	name="comWebsite" id="comWebsite" type="text" class="form-control comServFormInput" placeholder="URL 입력">
               		</div>
            	</div>
           	</div>
         <div class="row">
               	<div class="col-lg-6">
               	<span class="comServFormTitle">뉴스 검색 키워드</span><span class="comServInfoSentence">(키워드는 최대 3개까지 입력 가능합니다.)</span>
                   <div class="form-group boundDivSpan">
                       <div style="display:flex;width:207%">
                         <input style="background-color: #ffffff;outline-color: #dbdbdb;width:180%"
                         name="comKeywords" id="comKeywords" type="text" class="form-control comServFormInput" placeholder="서비스명 또는 브랜드명 입력(여러개 등록 시 ','로 구분)">
                       </div>
                   </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-6" style="display:block;">
               	<span class="comServFormTitle">가입 경로</span><span class="comServInfoSentence">(위니드를 추천한 기업과 추천인을 입력해 주세요.)</span>
                   <div class="form-group boundDivSpan">
                       <input style="background-color: #ffffff;outline-color: #dbdbdb;width:207%"
                        name="comRecom" id="comRecom" type="text" class="form-control comServFormInput" placeholder="ex) 위니드랩/김OO담당자">
                   </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-6">
               	<span class="comServFormTitle">기업회원 이용약관</span>
                   <div class="form-group">
                       <%-- <textarea style="background-color: #ffffff;outline-color: #dbdbdb;display:block;width:207%" rows="6"
                       name="comMemAgree" id="comMemAgree" type="text" class="form-control comServFormInput" >
                       <iframe src="<c:url value='/inc2/comServProvision.html'/>"></iframe>
                       </textarea> --%>
                       <iframe src="<c:url value='/inc2/comServProvision.html'/>" width="207%" class="comServIFrame"></iframe>
                   </div>
               </div>
            </div>
       </form>
       <div class="comServRegiBottom">
       	<div class="container comServRegiBottomCon">
   			<div class="comServRegiCheckDiv">
    			<input type="checkbox" id="comMemAgree"/>&nbsp;&nbsp;<label for="comMemAgree">이용약관 및 위니드 기업회원 가입에 동의합니다.</label>
   			</div>
   			<input type="submit" class="btn btn-main btn-round-full" id="comServInfoRegiFormSubmitBtn" value="제출하기">
       	</div>
       </div>
    </div>
</section>
</body>
</html>