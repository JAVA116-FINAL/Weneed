<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/cssJsImports.jsp" %>
<%@ include file="../inc/admin_top.jsp"%>
<style type="text/css">

.divheader>h1 {
    font-size: x-large;
    margin-bottom: 30px;
    color: gray;
}


iframe {
    border: none;
}

div#matchupMemList {
   margin-top: 50px;
    margin-bottom: 50px;
}

div#matchupStatusList {
    margin bottom: 50px;
}

</style>
<script type="text/javascript">
$(function(){

	
	
	/*
	fnAddBoarPage(1);
	 fnAddLoginPage(1);
	 */
	
});



/* 
function fnAddBoardPage(page){
	 $('#boardListAjax #page').val(page); 
	
	$.ajax({
		url:"<c:url value='/admin/adminMatchupMem.do'/>",
		type:"post",
		dataType:"json",
	
		data:$('#boardListAjax #frm').serialize(), 
		success: function(res){
			alert(res);
			 $('#boardListAjax').html(res);
			$('#boardListAjax .paginate a[page]').click(function(){
				var page=$(this).attr(page);
				fnAddBoardPage(page); 
			});
		},
		error:function(xhr,status,error){
			alert('error!!:'+error);
		}
	});
} */

/* 
function fnAddLoginPage(page){
	$('#loginListAjax #page').val(page);
	
	$.ajax({
		type:"post",
		url:"<c:url value='/admin/adminMatchupCom.do'/>",
		dataType:"html",
		data:$('#loginListAjax #frm').serialize(),
		success: function(res){
			alert(res);
			$('#loginListAjax').html(res);
			$('#loginListAjax .paginate a[page]').click(function(){
				var page=$(this).attr(page);
				fnAddLoginPage(page);
			});
			
		},
		error:function(xhr,status,error){
			alert('error!!:'+error);
		}
	});
}
 */
</script>

<div class="matchup">
	
	<div id="matchupStatusList">
		<div class="divheader">
			<h1>매치업 현황 관리</h1>
		</div>
		<iframe src="<c:url value='/admin/adminMatchupStatus.do'/>" width="100%" height="58%"></iframe>
	</div>
	<div id="matchupMemList">
		<div class="divheader">
			<h1>매치업 회원 조회 관리</h1>
		</div> 
		<%-- <c:import url="/admin/adminMatchupMem.do"></c:import> --%>
		<iframe src="<c:url value='/admin/adminMatchupMem.do'/>" width="100%" height="67%">
		</iframe>
	</div>
	<div id="matchupComList">
		<div class="divheader">
			<h1>매치업 기업회원 조회 관리</h1>
		</div>
		<iframe src="<c:url value='/admin/adminMatchupCom.do'/>"width="100%" height="40%">
		</iframe>
	</div>
	

	
</div>

















<%@ include file="../inc/admin_bottom.jsp"%>