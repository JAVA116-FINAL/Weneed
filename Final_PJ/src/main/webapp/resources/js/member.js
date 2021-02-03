/**
 * member.js
 */
 
var contextPath="/Final_PJ";

function validate_email(email){
  	var pattern = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
  	return pattern.test(email);
}

function validate_hp(hp){
	var pattern = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	return pattern.test(hp);
}
