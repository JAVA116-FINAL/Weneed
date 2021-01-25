/**
 * 현빈이 만든 자바스크립트 소스파일 
 */
 
 //인풋박스에서 키가 올라갈때마다 인풋박스 하단에 span태그로 경고메시지를 띄워주는 함수
 //company/member.css에 있는 .boundDivSpan으로 input과 span을 묶어주고, span에는 .alertSpan을 주면 된다
 function keyupCheck(inputId, inputName, alertId){ //매개변수로 인풋아이디 전체,인풋이름,얼럿표시할곳을 준다
	if(inputId.val().length<1){
		var msg=inputName+" 입력하세요.";
		alertId.text(msg);
		alertId.show();
		inputId.focus();
		return false;
	}else{ //입력을 뭐라도 했을 때
		alertId.hide();
	}
}