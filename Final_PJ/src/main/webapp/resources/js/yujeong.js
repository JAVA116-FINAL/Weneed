/**
 * notice_qna에서 사용할 유효성 검사 js파일 (유정)
 */

	$(function(){
		$('#submit').click(function(){
			if($('#qna_email').val().length<1){
				document.getElementById("errorMessage_mail").style = "display: block";
				$('#errorMessage_mail').text('이메일: 반드시 입력해야 합니다.');
				event.preventDefault();
			}else if(!validate_email($('#qna_email').val())){
				document.getElementById("errorMessage_mail").style = "display: block";
				$('#errorMessage_mail').text('이메일: 올바르지 않은 이메일 형식입니다.');
				event.preventDefault();
			}else{
				document.getElementById("errorMessage_mail").style = "display: none";
			}
			
			if($('#qna_title').val().length<1){
 				document.getElementById("errorMessage_subject").style = "display: block";
				$('#errorMessage_subject').text('제목: 반드시 입력해야 합니다.'); 
				event.preventDefault();
			}else{
				document.getElementById("errorMessage_subject").style = "display: none";
			}
			
			if($('#qna_content').val().length<1){
				document.getElementById("errorMessage_content").style = "display: block";
				$('#errorMessage_content').text('설명: 반드시 입력해야 합니다.'); 
				event.preventDefault();
			}else{
				document.getElementById("errorMessage_content").style = "display: none";
			}
			
			if(!$('#qna_check').is(":checked")){
 				document.getElementById("errorMessage_check").style = "display: block";
				$('#errorMessage_check').text('동의합니다: 반드시 체크해야 합니다.'); 
				event.preventDefault();
			}else{
				document.getElementById("errorMessage_check").style = "display: none";
			}
		});
		
 		$('#commit').click(function(){
			if($('#notice_search').val().length<1){
				event.preventDefault();
			}
		});
	});

function validate_email(email){
		var pattern = new RegExp(/^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/);
		return pattern.test(email);
}
 