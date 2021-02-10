<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 리스트 사이즈 -->
<input type="text" id="memListSize" value="${fn:length(memList)}">
<c:set var="memListSize" value="${fn:length(memList)}"/>
<!-- 리스트 그려주기  -->
<c:forEach var="mcumem" items="${memList}">
	<script>
		makeMemList(mcumem);
	</script>
</c:forEach>

<script>
function makeMemList(mcumem){
	var str="";
	str+='<div class="matchupSearch-resumeBound">';
	str+='<div class="matchupSearch-resume-1st">';
	str+='<i class="fas fa-user-tie"></i>';
	str+='<span>No.'+ mcumem.RESUMENO +'</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-2nd">';
	str+='<span>직군직종명</span>';
	str+='<span>';
	
	if(mcumem.CAREER == '신입'){
		str+=mcumem.CAREER+'</span>';
	}else{
		str+=mcumem.CAREER+'년 경력</span>';
	}
	str+='<span>'+mcumem.EDUNAME+' '+mcumem.EDUMAJOR+'</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-3rd">';
	str+='<button class="matchupSearch-ZzimBtn"><i class="fas fa-star"></i> 찜</button>';
	str+='<button>이력서 미리보기</button>';
	str+='</div></div>';

	$('#matchupSearch-resumeListDiv').append(str);
	
}
</script>