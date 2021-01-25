<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../notice_inc/notice_top.jsp"%>

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">
	$(function(){
		$('input[type=submit]').click(function(){
			if(!$('#request_custom_fields_360025875971').is(":checked")){
				alert('약관에 동의하셔야 합니다.');
				$('#request_custom_fields_360025875971').focus();
				event.preventDefault();
			}
		});
	});
</script>
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
    <div class="col-md-3 col-sm-3 col-xs-12 breadcrumb-container-search" style="float:right;">
		<form role="search" class="search" data-search="" action="/hc/ko/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="✓"><input type="search" name="query" id="query" placeholder="검색" aria-label="검색">
			<input type="submit" name="commit" value="검색"></form>
    </div>
</div>

<div class="container new-req-page">
	<section class="form-column">
		<h2 class="hc_title rq_title" style="font-size: 1.5em;">문의 등록</h2>
     	<p id="email_text" style="display: none;">이메일 주소를 기입해주세요.</p>
     	
		<div class="form" style="margin-bottom: 40px;">
			<form id="new_request" class="request-form" data-form="" data-form-type="request" 
				action="<c:url value='/notice/notice_qna_ok.do'/>" accept-charset="UTF-8" method="post"><input name="utf8" type="hidden" value="✓"><input type="hidden" name="authenticity_token" value="hc:requests:client:c1IxlCJkfMVg/rJ/ik6W3IBbG8GKA+DuSO+9aHli12CVBZ0NoGnX/14mpxQWwxkwaybcN2ogacYLeFa0gW6Bhw==" data-hc-status="ready">
			<div class="form-field string required request_anonymous_requester_email"><label for="request_anonymous_requester_email">이메일 주소</label>
				<input type="text" name="request[anonymous_requester_email]" id="request_anonymous_requester_email" aria-required="true" placeholder="가입하신 이메일 주소를 기입해주세요. (비회원은 수신 가능한 이메일)">
			</div>
			
			<div class="form-field string  optional  request_custom_fields_360025837612">
	      		<label id="request_custom_fields_360025837612_label" for="request_custom_fields_360025837612">연락처</label>
	      		<input type="number" name="request[custom_fields][360025837612]" id="request_custom_fields_360025837612" step="1" aria-required="false" aria-describedby="request_custom_fields_360025837612_hint" aria-labelledby="request_custom_fields_360025837612_label" placeholder="&quot; - &quot; 없이 번호만 입력">
				<p id="request_custom_fields_360025837612_hint" style="display: none;">" - " 없이 번호만 입력</p>
	    	</div>
	
			<div class="form-field string  required  request_subject">
	      		<label id="request_subject_label" for="request_subject">제목</label>
	      		<input type="text" name="request[subject]" id="request_subject" maxlength="150" size="150" aria-required="true" aria-describedby="request_subject_hint" aria-labelledby="request_subject_label" placeholder="(예) 이벤트 신청 문의 | 보상금 신청 | 수수료 정산 등, " class="garden-focus-visible" data-garden-focus-visible="true">
	    	</div>
	
	    	<div class="suggestion-list" data-hc-class="searchbox" data-hc-suggestion-list="true" data-loading="false"><div class="searchbox" style="display: none;"><label>추천 문서</label><div class="searchbox-suggestions"><ul><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCJMb1dNTADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy8zNjAwMzYyNDQzNzE%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--8a8ee473a8c06657ea388fc112d402a00e2ccc53">B2B 제휴나 이벤트를 공동으로 진행하고 싶습니다. 절차가 어떻게 되나요?</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCE%2BQF9RTADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy8zNjAwNDA1OTk2MzE%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--461789f5074a2ce150a78ae037b6fa48059eb2c4">인사담당자 정기 설문 안내</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCEKGa4zRADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy85MDAwMDQwMjE4MjY%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--9b49dbea2cbdd61149e097e1121790c6ab2bc82b">원티드에서, 호스트를 Wanted! - 힙한 콘텐츠 원티드와 함께 세상밖으로!</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCGuefIzRADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy85MDAwMDUxNDIxMjM%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--c3ff9f1e7c51e3e9d0464c1daf22301e5e43f339">스터디살롱 : 우리도 실리콘밸리처럼 일할 수 있을까</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCGKJa4zRADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy85MDAwMDQwMjI2MjY%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--64fc4a162288f4a0397269f258c8cae3259f134f">Wanted Plus - 직군별 최고의 교육을 모두 한 곳에서</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCBMjQYzRADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy85MDAwMDEyNDM5MjM%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--991708f3ed417e78945f32a2594e048d68239458">참석확인증(수료증) 발급 가능한가요?</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCBKvVIzRADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy85MDAwMDI1MjQ5NDY%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--68a0c771ed8f09acba91aa9911ae33601da26251">고객센터 운영시간 안내</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCM%2BnFtRTADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy8zNjAwNDA1NDAxMTE%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--b4d73573e39c60116d0c621df45ef6edd51ef2ad">마케팅 이용 · 수신 동의</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCM8HQYzRADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy85MDAwMDEyMzY5NDM%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--ea9a162d37aefa33aec753c79cd57a6166d0aefc">결제영수증을 받고 싶어요</a></li><li><a href="https://help.wanted.co.kr/hc/requests/suggestion_click?data=BAh7CDoTc3VnZ2VzdGlvbnNfaWRJIilmMjI2ZjgyOS02ODA5LTQ1ZTQtYjcyNC1jMmI0MGVmMTAxNDQGOgZFRjoPYXJ0aWNsZV9pZGwrCAS9DtRTADoIdXJsSSJjaHR0cHM6Ly9oZWxwLndhbnRlZC5jby5rci9oYy9rby9hcnRpY2xlcy8zNjAwNDAwMjEyNTI%2FaW5wdXRfc3RyaW5nPSVFQyU5RCVCNCVFQiVCMiVBNCVFRCU4QSVCOAY7BlQ%3D--8cdac72e92c0e21a7e57796d6d0f7aae64ecab57">개인정보 처리방침 (2019.10.31 본)</a></li></ul></div></div></div>
	    
	  		<div class="form-field text  required  request_description">
	      		<label id="request_description_label" for="request_description">설명</label>
	      		<textarea name="request[description]" id="request_description" aria-required="true" aria-describedby="request_description_hint" aria-labelledby="request_description_label" placeholder="상세한 문의 사항을 기입해주세요. 저희 지원 스태프가 영업일 기준 1~2일 이내 가능한 빨리 답변 드릴 수 있도록 노력하겠습니다."></textarea><input type="hidden" name="request[description_mimetype]" id="request_description_mimetype" value="text/plain" style="display: none;">
	      
	      		<p id="request_description_hint" style="display: none;">상세한 문의 사항을 기입해주세요. 저희 지원 스태프가 영업일 기준 1~2일 이내 가능한 빨리 답변 드릴 수 있도록 노력하겠습니다.</p>
	    	</div>
	
	  		<div class="form-field">
	  			<label for="request-attachments">첨부 파일</label>
	  				<div id="upload-dropzone" class="upload-dropzone">
	  					<input type="file" multiple="true" id="request-attachments" data-fileupload="true" data-dropzone="upload-dropzone" data-error="upload-error" data-create-url="/hc/ko/request_uploads" data-name="request[attachments][]" data-pool="request-attachments-pool" data-delete-confirm-msg="" aria-describedby="upload-error">
	  					<span><a>파일 추가</a></span>
					</div>
	
				<div id="upload-error" class="notification notification-error notification-inline" style="display: none;">
					<span data-upload-error-message=""></span>
				</div>
		
				<ul id="request-attachments-pool" class="upload-pool" data-template="upload-template"></ul>
			</div>
			
		<div class="form-field boolean  required  request_custom_fields_360025875971">
			<p id="request_custom_fields_360025875971_hint"><strong>개인정보 수집 및 이용에 대한 동의 내용</strong><br>주식회사 원티드랩은 정보통신망 이용촉진 및 정보보호 등에 관한 법률을 준수하며 고객님의 개인정보를 수집하고 소중하게 다루고 있습니다. ①개인정보 수집 항목: 이름, 이메일 주소 ②수집목적: 고객식별, 문의응대, 서비스 품질 향상 ③보유 및 이용기간: 수집 목적이 달성되면 지체없이 모든 개인정보를 파기합니다. 단, 관계법령에서 일정 기간 정보의 보관을 규정한 경우에 한해 분리 보관 후 파기합니다.</p><label id="request_custom_fields_360025875971_label" for="request_custom_fields_360025875971">동의합니다.</label>
	      	<input name="request[custom_fields][360025875971]" type="hidden" value="off">
	      	<input name="request[custom_fields][360025875971]" id="request_custom_fields_360025875971" aria-required="true" aria-describedby="request_custom_fields_360025875971_hint" aria-labelledby="request_custom_fields_360025875971_label" type="checkbox" value="on">
	    </div>
	
	<%--
	<script type="text/html" id="upload-template">
	<li class="upload-item" data-upload-item>
	  <a class="upload-link" target="_blank" data-upload-link></a>
	  <p class="upload-path" data-upload-path></p>
	  <p class="upload-path" data-upload-size></p>
	  <p data-upload-issue class="notification notification-alert notification-inline" aria-hidden="true"></p>
	  <span class="upload-remove" data-upload-remove></span>
	  <div class="upload-progress" data-upload-progress></div>
	  <input type="hidden">
	</li>
	</script> 
	--%>
	
	
				<footer><input id="submit" type="submit" name="submit" value="제출" class="btn btn-lg"></footer>
			</form>
     	 </div>
	</section>
</div>
</main>

<%@ include file="../notice_inc/notice_bottom.jsp"%>