<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../inc/company_top.jsp" %>
<title>Wanted - 회사 정보 등록</title>
<style>
.comServ{
	display: block;
}

.comServ_oneLineDiv {
	display: block;
}

.comServRequired {
	color: red;
}

.comServFormTitle{
	color: #000000;
}

.comServRegiBigTitle {
	font-size: 1.6em;
}

.comServRegiSmallTitle {
	color: #757575;
	font-weight: bold;
}

.comServFormInput{
	margin: 10px 0px;
	background-color: #ffffff;
	outline-color: #dbdbdb;
}

.comServInfoSentence{
	color: black;
	font-size: 0.8em;
}
</style>
</head>
<body>
<section class="appoinment section">
	<div class="container">
		<div class="row">
			<div class="appoinment-wrap mt-5 mt-lg-0 pl-lg-5">
            	<h2 class="mb-2 comServRegiBigTitle">회사 정보를 등록해 주세요.</h2>
            	<p class="mb-4 comServRegiSmallTitle">
            		원티드는 추천인/후보자들에게 좋은 일자리를 제공하기 위해, 다음 정보를 리뷰하여 회사등록을 승인하고 있습니다.</p>
               	<form id="#" class="appoinment-form" method="post" action="#">
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
                                	<option>한국</option>
                                  	<!-- 테이블에서 목록 불러오기 -->
                                </select>
                            </div>
                         </div>
                         <div class="col-lg-6">
                            <div class="form-group">
                         		<span class="comServFormTitle">지역</span><span class="comServRequired">*</span>
                            	<select style="background-color: #ffffff;outline-color: #dbdbdb;"
                            	class="form-control comServFormInput" id="region">
                                	<option>서울</option>
                                  	<!-- 테이블에서 목록 불러오기 -->
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
                        		<input type="submit" class="form-control comServFormInput" value="추가" >
                        	</div>
                     	</div>
                        <div class="col-lg-6">
                        	<span class="comServFormTitle">뉴스 검색 키워드</span><span class="comServInfoSentence">(키워드는 최대 3개까지 입력 가능합니다.)</span>
                            <div class="form-group">
                                <input style="background-color: #ffffff;outline-color: #dbdbdb;"
                                 name="comKeywords" id="comKeywords" type="text" class="form-control comServFormInput" placeholder="서비스명 또는 브랜드명 입력">
                            </div>
                        </div>
                        <div class="col-lg-6">
                        	<span class="comServFormTitle">가입 경로</span><span class="comServInfoSentence">(원티드를 추천한 기업과 추천인을 입력해 주세요.)</span>
                            <div class="form-group">
                                <input style="background-color: #ffffff;outline-color: #dbdbdb;"
                                 name="comRecom" id="comRecom" type="text" class="form-control comServFormInput" placeholder="ex) 원티드랩/김OO담당자">
                            </div>
                        </div>
                        <div class="col-lg-6">
                        	<span class="comServFormTitle">기업회원 이용약관</span>
                            <div class="form-group">
                                <input style="background-color: #ffffff;outline-color: #dbdbdb;display:block;width:207%"
                                name="comMemAgree" id="comMemAgree" type="text" class="form-control comServFormInput" >
                            </div>
                        </div>
                    </div>
                    <a class="btn btn-main btn-round-full" href="confirmation.html">Make Appoinment<i class="icofont-simple-right ml-2"></i></a>
                </form>
            </div>
    	</div>
    </div>
</section>
</body>
</html>