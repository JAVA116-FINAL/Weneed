<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/register.css">
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
	//				alert(item.regionCode);
		//			alert(item.regionNameKr);
					var option="<option value="+item.regionCode+">"+item.regionNameKr+"</option>";		
					$('#region').append(option)
				}
			},
			error:function(xhr, status, error){
				alert('error! '+error);
			}
		});
	});
	
//설립년도 네자리 숫자만 입력해야 한다. 숫자 범위도 설정가능할지? 1950~현재년도여야 함.
});	

</script>
</head>
<body>
<section class="section-comRegi">
	<div class="container">
       	<h2 class="mb-2 comServRegiBigTitle" style="font-weight: bold;">회사 정보를 등록해 주세요.</h2>
       	<p class="mb-4 comServRegiSmallTitle">
       		원티드는 추천인/후보자들에게 좋은 일자리를 제공하기 위해, 다음 정보를 리뷰하여 회사등록을 승인하고 있습니다.</p>
      	<form id="comServInfoRegiForm" class="appoinment-form" method="post" action="#">
       	<div class="row">
           	<div class="col-lg-6">
               	<div class="form-group">
                	<span class="comServFormTitle">회사이름</span><span class="comServRequired">*</span>
                   	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	name="comName" id="comName" type="text" class="form-control comServFormInput" placeholder="회사 이름">
                   </div>
                </div>
                <div class="col-lg-6">
                    <div class="form-group">
                		<span class="comServFormTitle">국가</span><span class="comServRequired">*</span>
                   		<select style="background-color: #ffffff;outline-color: #dbdbdb;" 
                   		class="form-control comServFormInput" id="nation">
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
                   	class="form-control comServFormInput" id="region">
                         	<!-- 테이블에서 목록 불러오기. nation select문에서 세팅된 값에 따라 달라져야 함. 어떻게?  -->
                         	<c:forEach var="regionVo" items="${regionList}">
                         		<option value="regionVo.regionCode">${regionVo.regionNameKr}</option>
                         	</c:forEach>
                       </select>
                   </div>
                </div>
                <div class="col-lg-6">
                   <div class="form-group">
                 <span class="comServFormTitle">대표 주소</span><span class="comServRequired">*</span>
                       <input style="background-color: #ffffff;outline-color: #dbdbdb;"
                       name="comAddress" id="comAddress" type="text" class="form-control comServFormInput" placeholder="대표 주소 입력">
                     </div>
				</div>
                  <div class="col-lg-6">
                     <div class="form-group">
                  	<span class="comServFormTitle">사업자 등록 번호</span><span class="comServRequired">*</span>
                         <input style="background-color: #ffffff;outline-color: #dbdbdb;"
                        name="comRegNo" id="comRegNo" type="text" class="form-control comServFormInput" placeholder="'-' 제외 10자리">
                   </div>
                </div>
                <div class="col-lg-6 comServ_oneLineDiv">
                   <div class="form-group">
               	<span class="comServFormTitle">매출액/투자금액</span><span class="comServInfoSentence">(승인기준: 매출액/투자 유치 5억원 이상)</span><span class="comServRequired">*</span>
                       <input style="background-color: #ffffff;outline-color: #dbdbdb;"
                        name="profit" id="profit" type="text" class="form-control comServFormInput" placeholder="매출액/투자금액 입력 (단위: 억원)">
                   </div>
                </div>
                <div class="col-lg-6">
                   <div class="form-group">
                	<span class="comServFormTitle">산업군</span><span class="comServRequired">*</span>
                       <select style="background-color: #ffffff;outline-color: #dbdbdb;"
                       class="form-control comServFormInput" id="industry">
                         <c:forEach var="industryVo" items="${industryList}">
                       		<option value="${industryVo.industryNo }">${industryVo.industryName}</option>
                       	</c:forEach>
          	            </select>
                   </div>
               </div>
               <div class="col-lg-6">
                   <div class="form-group">
              		<span class="comServFormTitle">직원수</span><span class="comServInfoSentence">(승인기준: 팀원 10명 이상)</span><span class="comServRequired">*</span>
                   	 	<select style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	  		id="comSize" class="form-control comServFormInput">
                        	<c:forEach var="comSizeVo" items="${comSizeList}">
                       			<option value="${comSizeVo.comSizeCode }">${comSizeVo.comSize}</option>
                       		</c:forEach>
          	        	</select>
                	</div>
                </div>
            </div>
            <div class="row">
             <div class="col-lg-6 comServ"  style="width:207%">
              <div class="form-group">
              	<span class="comServFormTitle">회사/서비스 소개</span><span class="comServInfoSentence">(3,000자 제한)</span><span class="comServRequired">*</span>
                  <textarea style="background-color: #ffffff;outline-color: #dbdbdb;display:block;width:207%"
                  name="comIntro" id="comIntro" class="form-control comServFormInput" rows="6" placeholder="회사 정보 입력"></textarea>
                </div>
               </div>
              </div>
              <div class="row">
				<div class="col-lg-6">
                 	<div class="form-group">
              			<span class="comServFormTitle">설립연도</span><span class="comServRequired">*</span>
                      	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                    	name="comYear" id="comYear" type="text" class="form-control comServFormInput" placeholder="ex) 2012년">
                	</div>
            	</div>
           		<div class="col-lg-6">
           		<span class="comServFormTitle">정보 수신 이메일</span><span class="comServRequired">*</span>
               	<div class="form-group">
                   	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	name="comEmails" id="comEmails" type="text" class="form-control comServFormInput" placeholder="">
          			</div>
           		</div>
           		<div class="col-lg-6">
            		<span class="comServFormTitle">담당자 연락처</span><span class="comServRequired">*</span>
               	<div class="form-group">
                   	<input style="background-color: #ffffff;outline-color: #dbdbdb;"
                   	 name="comPhone" id="comPhone" type="text" class="form-control comServFormInput" placeholder="">
               	</div>
            	</div>
            	<div class="col-lg-6">
             		<span class="comServFormTitle">웹사이트 주소</span>
              		<div class="form-group">
                   		<input style="background-color: #ffffff;outline-color: #dbdbdb;width:100%"
                  	 	name="comWebsite" id="comWebsite" type="text" class="form-control comServFormInput" placeholder="URL 입력 (여러개 등록 시 ','로 구분)">
               		</div>
            	</div>
           	</div>
         <div class="row">
               	<div class="col-lg-6">
               	<span class="comServFormTitle">뉴스 검색 키워드</span><span class="comServInfoSentence">(키워드는 최대 3개까지 입력 가능합니다.)</span>
                   <div class="form-group">
                       <div style="display:flex;width:207%">
                         <input style="background-color: #ffffff;outline-color: #dbdbdb;width:180%"
                         name="comKeywords" id="comKeywords" type="text" class="form-control comServFormInput" placeholder="서비스명 또는 브랜드명 입력">
                    		<input type="submit" class="form-control comServFormInput" value="추가" style="width:20%">
                       </div>
                   </div>
               </div>
            </div>
            <div class="row">
               <div class="col-lg-6" style="display:block;">
               	<span class="comServFormTitle">가입 경로</span><span class="comServInfoSentence">(원티드를 추천한 기업과 추천인을 입력해 주세요.)</span>
                   <div class="form-group">
                       <input style="background-color: #ffffff;outline-color: #dbdbdb;width:207%"
                        name="comRecom" id="comRecom" type="text" class="form-control comServFormInput" placeholder="ex) 원티드랩/김OO담당자">
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
    			<input type="checkbox" id="chkComServAgree"/>&nbsp;&nbsp;<label for="chkComServAgree">이용약관 및 원티드 기업회원 가입에 동의합니다.</label>
   			</div>
   			<input type="submit" class="btn btn-main btn-round-full" value="제출하기">
       	</div>
       </div>
    </div>
</section>
</body>
</html>