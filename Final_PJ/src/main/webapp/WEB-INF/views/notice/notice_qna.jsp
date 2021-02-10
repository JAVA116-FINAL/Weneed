<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/yujeong.js'/>"></script>

<style>
	@media (max-width: 992px) {
        .footer-legal {
          margin-bottom:20px;
      }
    }
  @media (max-width: 769px) {
  	#footer_description_log_div{
  		margin-top: 25px;
	  }
  }
</style>

<main role="main">
<section class="breadcrumb"></section>
<div class="container breadcrumb-container">
	<div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path" style="float:left;">
		<ol class="breadcrumbs">
			<li title="원티드 고객센터">
        		<a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a>
    		</li>
    		<li title="문의 등록">
        		문의 등록
    		</li>
  
		</ol>
	</div>
		<div class="col-md-3 col-sm-3 col-xs-12 breadcrumb-container-search"
			style="float: right;">
			<form role="search" class="search" data-search=""
				data-instant="true" autocomplete="off" action="<c:url value='notice_search.do'/>">
				<input type="search" name="searchKeyword" id="notice_search" placeholder="검색"> 
				<input type="submit" name="commit" id="commit" value="검색">
			</form>
		</div>
</div>

<div class="container new-req-page">
	<section class="form-column">
		<h2 class="hc_title rq_title" style="font-size: 1.5em;">문의 등록</h2>
     	<p id="email_text" style="display: none;">이메일 주소를 기입해주세요.</p>
     	
		<div class="form" style="margin-bottom: 40px;">
			<!-- 문의등록 폼 -->
			<form id="qna_form" class="request-form" action="<c:url value='/notice/notice_qna.do'/>" 
				method="post" enctype="multipart/form-data">
				
				<div class="form-field string required request_anonymous_requester_email">
					<label for="request_anonymous_requester_email">이메일 주소</label>
					<input type="text" name="qna_email" id="qna_email" aria-required="true" placeholder="이메일 주소를 기입해주세요.">
					<div id="errorMessage_mail" class="notification notification-error notification-inline" style="display: none"></div>
				</div>
			
			<div class="form-field string  optional  request_custom_fields_360025837612">
	      		<label id="request_custom_fields_360025837612_label">연락처</label>
	      		<input type="number" name="qna_phone" id="qna_phone" placeholder="&quot; - &quot; 없이 번호만 입력">
	    	</div>
	
			<div class="form-field string  required  request_subject">
	      		<label id="request_subject_label">제목</label>
	      		<input type="text" name="qna_title" id="qna_title" maxlength="150" size="150" aria-required="true" aria-describedby="request_subject_hint" aria-labelledby="request_subject_label" placeholder="(예) 이벤트 신청 문의 | 보상금 신청 | 수수료 정산 등, " class="garden-focus-visible" data-garden-focus-visible="true">
	      		<div id="errorMessage_subject" class="notification notification-error notification-inline" style="display: none"></div>
	    	</div>
	
	    
	  		<div class="form-field text  required  request_description">
	      		<label id="request_description_label">설명</label>
	      		<textarea name="qna_content" id="qna_content" aria-required="true" aria-describedby="request_description_hint" aria-labelledby="request_description_label" placeholder="상세한 문의 사항을 기입해주세요. 저희 지원 스태프가 영업일 기준 1~2일 이내 가능한 빨리 답변 드릴 수 있도록 노력하겠습니다."></textarea>
	      		<p id="request_description_hint" style="display: none">상세한 문의 사항을 기입해주세요. 저희 지원 스태프가 영업일 기준 1~2일 이내 가능한 빨리 답변 드릴 수 있도록 노력하겠습니다.</p>
	    		<div id="errorMessage_content" class="notification notification-error notification-inline" style="display: none"></div>
	    	</div>
	
			<!-- 파일 업로드! -->
	  		<div class="form-field">
	  			<label for="request-attachments">첨부 파일 (최대 2M)</label> <!-- 이거 밑에 따로 띄워야됨 -->
	  				<div id="upload-dropzone" class="upload-dropzone">
	  					<input type="file" id="qna_file" name="qna_file" multiple="multiple">
	  					<span><a>파일 추가</a></span>
					</div>
	
				<!-- 업로드 에러시 -->
				<div id="upload-error" class="notification notification-error notification-inline" style="display: none;">
					<span data-upload-error-message=""></span>
				</div>
				
				<ul id="request-attachments-pool" class="upload-pool">
					<!-- 업로드한 파일 정보 출력 -->
					<li class="upload-item" data-upload-item="" aria-busy="false">
  						<a class="upload-link" id="upload-link"></a><!-- 파일명 -->
						<span class="upload-remove"></span> <!-- 파일 지우기 아이콘 -->
					</li>
				</ul>
			</div>
			
		<div class="form-field boolean  required  request_custom_fields_360025875971">
			<p id="request_custom_fields_360025875971_hint"><strong>개인정보 수집 및 이용에 대한 동의 내용</strong><br>주식회사 위니드랩은 정보통신망 이용촉진 및 정보보호 등에 관한 법률을 준수하며 고객님의 개인정보를 수집하고 소중하게 다루고 있습니다. ①개인정보 수집 항목: 이름, 이메일 주소 ②수집목적: 고객식별, 문의응대, 서비스 품질 향상 ③보유 및 이용기간: 수집 목적이 달성되면 지체없이 모든 개인정보를 파기합니다. 단, 관계법령에서 일정 기간 정보의 보관을 규정한 경우에 한해 분리 보관 후 파기합니다.</p><label id="request_custom_fields_360025875971_label" for="request_custom_fields_360025875971">동의합니다.</label>
	      	<input id="qna_check" name="qna_check" aria-required="true" type="checkbox">
			<div id="errorMessage_check" class="notification notification-error notification-inline" style="display: none;"></div>
		</div>
	
				<footer><input id="submit" type="submit" name="submit" value="제출" class="btn btn-lg"></footer>
			</form>
     	 </div>
	</section>
</div>
</main>

<%@ include file="notice_inc/notice_bottom.jsp"%>