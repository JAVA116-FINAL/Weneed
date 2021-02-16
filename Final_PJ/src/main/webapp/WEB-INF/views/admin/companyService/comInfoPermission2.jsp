<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/admin_top.jsp"%>
<script type="text/javascript">
	
$(function(){
	//들어왔다
	/* if($('input[name=currentPage]').val() != ''){ //근데 페이징 체크해서 들어온거면 승인 완료 건을 보여줘야 함
		$('#weneedAdmin-showInfoListPassed').addClass('clickedTab');
		$('#weneedAdmin-comInfoBeforeSec').addClass('hide');
		$('#weneedAdmin-comInfoPassedSec').removeClass('hide');
	}
	if($('input[name=currentPage]').val() == ''){
		$('#weneedAdmin-showInfoListBefore').addClass('clickedTab');
		$('#weneedAdmin-comInfoPassedSec').addClass('hide');
		$('#weneedAdmin-comInfoBeforeSec').removeClass('hide');
	}
	 */
	
	$('#weneed-adminBtn-pass').click(function(){
		const comCodeArr=[]; //체크박스값을 담을 어레이
		const comMemNoArr=[]; //멤버번호값을 담을 어레이
		var checkboxes=$('input:checkbox[name=weneed-adminStatusChkbox-before]');
		
		//선택한 체크박스의 회사코드를 추출하여 배열에 집어넣는 작업
		checkboxes.each(function(){
		//	console.log(checkboxes.is(':checked'));
			if($(this).is(':checked')){
				var comCode=$(this).parent().next().html();
				var comMemNo=$(this).parent().siblings(':eq(5)').html();
				console.log("comCode: "+comCode);
				console.log("comMemNo: "+comMemNo);
				comCodeArr.push(comCode);
				comMemNoArr.push(comMemNo);
			}
		});
		console.log("comCodeArr: "+comCodeArr);
		console.log("comMemNoArr: "+comMemNoArr);
		
		var data = {
			"comCodeList":comCodeArr,
			"comMemNoList":comMemNoArr
		};
		
		$.ajax({
			url:"<c:url value='/admin/companyService/comInfoStatustoPass.do'/>",
			type:"post",
			dataType:"json",
			data:data,
			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
				//alert('성공!');
				location.reload();
			},
			error:function(xhr, status, error){
				alert('error!: '+error);
			}
		});
		
		var curPageY=$('input[name=currentPageY]').val();
		var curPageP=$('input[name=currentPageP]').val();
		//승인요청건 테이블을 다시 그려주는 ajax 
		$.ajax({
			url:"<c:url value='/admin/companyService/comInfoPermissionYet.do'/>",
			type:"post",
			dataType:"json",
			data:{
				"curPageY":curPageY
			},
			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
				alert('승인요청건 조회 성공!');
				pageFuncY(curPageY);
			},
			error:function(xhr, status, error){
				alert('승인요청건 조회 error!: '+error);
			}
		});
		
		//승인완료건 테이블을 다시 그려주는 ajax
		$.ajax({
			url:"<c:url value='/admin/companyService/comInfoPermissionPassed.do'/>",
			type:"post",
			dataType:"json",
			data:{
				"curPageP":curPageP
			},
			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
				alert('승인완료건 조회 성공!');
				pageFuncY(curPageP);
			},
			error:function(xhr, status, error){
				alert('승인완료건 조회 error!: '+error);
			}
		});
	
	});
		
	//승인 전 전체선택하기
	$('#weneed-admin-CheckAll').click(function(){
		if($(this).is(':checked')){
			$('input[name=weneed-adminStatusChkbox-before]').prop('checked', true);
		}
		else {
			$('input[name=weneed-adminStatusChkbox-before]').prop('checked', false);
		}
	});
	
	//승인 완료 전체선택하기
	$('#weneed-admin-CheckAll-ed').click(function(){
		if($(this).is(':checked')){
			$('input[name=weneed-adminStatusChkbox-after]').prop('checked', true);
		}
		else {
			$('input[name=weneed-adminStatusChkbox-after]').prop('checked', false);
		}
	});
	
});
	
function pageFuncY(curPage){
	var here = $('#weneedadmin-tbodyYet');
	var here2 = $('#weneedAdmin-comInfoDivPageBefore');
	$.ajax({
		url:"<c:url value='/admin/companyService/comInfoPermissionYet.do'/>",
		type:"get",
		dataType:"json",
		data:{
			"curPage":curPage
		},
		success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
		//	alert('승인요청건 조회 성공!');
			drawTrY(result, here);
			drawPageDivY(result, here2);
		},
		error:function(xhr, status, error){
			alert('승인요청건 조회 error!: '+error);
		}
	});
}

function pageFuncP(curPage){
	var here = $('#weneedadmin-tbodyPassed');
	var here2 = $('#weneedAdmin-comInfoDivPagePassed');
	
	$.ajax({
		url:"<c:url value='/admin/companyService/comInfoPermissionPassed.do'/>",
		type:"get",
		dataType:"json",
		data:{
			"curPage":curPage
		},
		success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
		//	alert('승인완료건 조회 성공!');
			drawTrP(result, here);
			drawPageDivP(result, here2);
		},
		error:function(xhr, status, error){
			alert('승인완료건 조회 error!: '+error);
		}
	});
}

function drawTrY(jsonVo, pasteHere){
	pasteHere.html('');
	var pageLength=jsonVo.comList.length;
	//리스트의 개수만큼
	console.log("pageLength:"+pageLength);
	for(comVo of jsonVo.comList){
		if(comVo.comRegNo == null){
			comVo.comRegNo='';
		}
		if(comVo.comSize == null){
			comVo.comSize='';
		}
		if(comVo.profit == null){
			comVo.profit='';
		}
		if(comVo.comMemNo == null){
			comVo.comMemNo='';
		}
		
		var str='';
		str+='<tr class="weneed-adminTable">';		
		str+='<td>';		
		str+='<input type="checkbox" name="weneed-adminStatusChkbox-before">';		
		str+='</td>';		
		str+='<td>'+comVo.comCode+'</td>';		
		str+='<td>'+comVo.comName+'</td>';		
		str+='<td>'+comVo.comRegNo+'</td>';		
		str+='<td>'+comVo.comSize+'</td>';		
		str+='<td>'+comVo.profit+'</td>';		
		str+='<td>'+comVo.comMemNo+'</td>';		
		str+='<td>'+comVo.comInfoPassed+'</td>';		
		str+='</tr>';		
		
		pasteHere.append(str);
	}
}


function drawTrP(jsonVo, pasteHere){
	pasteHere.html('');
	var pageLength=jsonVo.comList.length;
	//리스트의 개수만큼
	console.log("pageLength:"+pageLength);
	for(comVo of jsonVo.comList){
		if(comVo.comRegNo == null){
			comVo.comRegNo='';
		}
		if(comVo.comSize == null){
			comVo.comSize='';
		}
		if(comVo.profit == null){
			comVo.profit='';
		}
		if(comVo.comMemNo == null){
			comVo.comMemNo='';
		}
		
		var str='';
		str+='<tr class="weneed-adminTable">';		
		str+='<td>';		
		str+='<input type="checkbox" name="weneed-adminStatusChkbox-after">';		
		str+='</td>';		
		str+='<td>'+comVo.comCode+'</td>';		
		str+='<td>'+comVo.comName+'</td>';		
		str+='<td>'+comVo.comRegNo+'</td>';		
		str+='<td>'+comVo.comSize+'</td>';		
		str+='<td>'+comVo.profit+'</td>';		
		str+='<td>'+comVo.comMemNo+'</td>';		
		str+='<td>'+comVo.comInfoPassed+'</td>';		
		str+='</tr>';		
		
		pasteHere.append(str);
	}
}

function drawPageDivY(jsonVo, pasteHere){
	console.log(jsonVo);
	console.log(jsonVo.pagingInfo.currentPage);
	pasteHere.html('');
	
	var str='';
	var paging=jsonVo.pagingInfo;
	
	if(paging.firstPage>1){
		str+="<a href='#' onclick='pageFuncY("+(paging.firstPage-1)+")'>";
		str+="<img src='<c:url value='/resources/images/first.JPG'/>'></a>";
	}
		
	for(var i=paging.firstPage; i<=paging.lastPage; i++){
		if(i==paging.currentPage){
			str+="<span style='color:blue;font-weight:bold'> "+i+" </span>";
		}else{
			str+="<a href='#' onclick='pageFuncY("+i+")'> ["+i+"] </a>";
		}
	}
	
	if(paging.lastPage < paging.totalPage){
		str+="<a href='#' onclick='pageFuncY("+(paging.lastPage+1)+")'>";
		str+="<img src='<c:url value='/resources/images/last.JPG'/>'></a>";
	}
	str+='</div>';
	
	$('#weneedAdmin-comInfoDivPageBefore').append(str);
}

function drawPageDivP(jsonVo, pasteHere){
	console.log(jsonVo);
	console.log(jsonVo.pagingInfo.currentPage);
	pasteHere.html('');
	
	var str='';
	var paging=jsonVo.pagingInfo;
	
	str+='<div class="divPage" id="'+pasteHere+'">';
	
	if(paging.firstPage>1){
		str+="<a href='#' onclick='pageFuncP("+(paging.firstPage-1)+")'>";
		str+="<img src='<c:url value='/resources/images/first.JPG'/>'></a>";
	}
		
	for(var i=paging.firstPage; i<=paging.lastPage; i++){
		if(i==paging.currentPage){
			str+="<span style='color:blue;font-weight:bold'> "+i+" </span>";
		}else{
			str+="<a href='#' onclick='pageFuncP("+i+")'> ["+i+"] </a>";
		}
	}
	
	if(paging.lastPage < paging.totalPage){
		str+="<a href='#' onclick='pageFuncP("+(paging.lastPage+1)+")'>";
		str+="<img src='<c:url value='/resources/images/last.JPG'/>'></a>";
	}
	$('#weneedAdmin-comInfoDivPagePassed').append(str);
}

$.send=function(curPage){
	$('#currentPage').val(curPage);
	
	$.ajax({
		url:"<c:url value='/zipcode/ajaxZipcode.do'/>",
		type:"post",
		data:$('#frmZip').serializeArray(),
		dataType:"xml",
		success:function(xmlStr){
			//alert(xmlStr);
			totalCount=$(xmlStr).find('totalCount').html();
			var errorCode=$(xmlStr).find('errorCode').html();
			var errorMessage=$(xmlStr).find('errorMessage').text();
			
			if(errorCode!=0){ //정상이 아니면
				alert(errorCode + "=>" + errorMessage); 
			}else{
				if(xmlStr!=null){
					$.makeList(xmlStr);
					$.pageMake();
				}
			}
		},
		error:function(xhr, status, error){
			alert('error! : '+error);
		}
	});
}
</script>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/companyService.css'/>">
</head>
<body>
<div class="container">
	<div class="weneedAdmin-permissionTab">
		<h2>기업 정보 승인</h2>
	</div>
	<section id="weneedAdmin-comInfoBeforeSec">
		<form action="<c:url value='/admin/companyService/comInfoPermission.do'/>" name="frmPageY" method="post">
			<input type="hidden" name="currentPageY" value="${pagingInfoPassed.currentPage}">
			<input type="hidden" name="typeCheck" value="Y">
		</form>
		<span class="weneedAdmin-comPermiSubtitle" id="weneedAdmin-showInfoListBefore">승인 요청 건</span>
		<div class="weneed-adminBtnDiv">
			<button class="weneed-adminBtn" id="weneed-adminBtn-reject">거절</button>
			<button class="weneed-adminBtn" id="weneed-adminBtn-pass">승인</button>
		</div>
		<table class="weneed-adminTable">
			<thead>
				<tr class="weneed-adminTable">
					<th style="width: 35px;"><input type="checkbox" id="weneed-admin-CheckAll"></th>
					<th style="width: 105px;">회사코드</th>
					<th style="width: 240px;">회사명</th>
					<th style="width: 125px;">사업자등록번호</th>
					<th style="width: 110px;">팀원수</th>
					<th style="width: 125px;">매출액/투자규모</th>
					<th style="width: 110px;">등록회원번호</th>
					<th style="width: 80px;">승인상태</th>
				</tr>
			</thead>
			<tbody id="weneedadmin-tbodyYet">
				<c:forEach var="comInfoVo" items="${comListYet}">
					<!-- 이걸 그려서 붙여야 하고 -->
					<tr class="weneed-adminTable">
						<td>
							<input type="checkbox" name="weneed-adminStatusChkbox-before">
						</td>
						<td>${comInfoVo.comCode}</td>
						<td>${comInfoVo.comName}</td>
						<td>${comInfoVo.comRegNo}</td>
						<td>${comInfoVo.comSize}</td>
						<td>${comInfoVo.profit}</td>
						<td>${comInfoVo.comMemNo}</td>
						<td>${comInfoVo.comInfoPassed}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 디브 -->
		<div class="divPage" id="weneedAdmin-comInfoDivPageBefore">
		<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 -->
			<c:if test="${pagingInfoYet.firstPage>1 }">	
				<a href="#" onclick="pageFuncY(${pagingInfoYet.firstPage-1})">
					<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전블럭으로 이동">
				</a>
			</c:if>
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfoYet.firstPage}" end="${pagingInfoYet.lastPage}">
				<c:if test="${i==pagingInfoYet.currentPage}">
					<span style="color:blue;font-weight: bold">
						${i}</span>			
				</c:if>
				<c:if test="${i!=pagingInfoYet.currentPage}">
					<a href="#" onclick="pageFuncY(${i})">
						[${i}]</a>			
				</c:if>
			</c:forEach>
			<!-- 다음 블럭으로 이동 -->
			<c:if test="${pagingInfoYet.lastPage < pagingInfoYet.totalPage}">	
				<a href="#" onclick="pageFuncY(${pagingInfoYet.lastPage+1})">
					<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로 이동">
				</a>
			</c:if>
			<!--  페이지 번호 끝 -->	
		</div>
	</section>

	<section id="weneedAdmin-comInfoPassedSec">
		<form action="<c:url value='/admin/companyService/comInfoPermission.do'/>" name="frmPageP" method="post">
			<input type="hidden" name="currentPageP" value="${pagingInfoPassed.currentPage}">
			<input type="hidden" name="typeCheck" value="P">
		</form>
		<span class="weneedAdmin-comPermiSubtitle" id="weneedAdmin-showInfoListPassed"> 승인 완료 건</span>
		<table class="weneed-adminTable">
			<thead>
				<tr class="weneed-adminTable">
					<th style="width: 35px;"><input type="checkbox" id="weneed-admin-CheckAll-ed"></th>
					<th style="width: 105px;">회사코드</th>
					<th style="width: 240px;">회사명</th>
					<th style="width: 125px;">사업자등록번호</th>
					<th style="width: 110px;">팀원수</th>
					<th style="width: 125px;">매출액/투자규모</th>
					<th style="width: 110px;">등록회원번호</th>
					<th style="width: 80px;">승인상태</th>
				</tr>
			</thead>
			<tbody id="weneedadmin-tbodyPassed">
				<c:forEach var="comInfoVo" items="${comListPassed}">
					<tr class="weneed-adminTable">
						<td>
							<input type="checkbox" name="weneed-adminStatusChkbox-after">
						</td>
						<td>${comInfoVo.comCode}</td>
						<td>${comInfoVo.comName}</td>
						<td>${comInfoVo.comRegNo}</td>
						<td>${comInfoVo.comSize}</td>
						<td>${comInfoVo.profit}</td>
						<td>${comInfoVo.comMemNo}</td>
						<td>${comInfoVo.comInfoPassed}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 디브 -->
		<div class="divPage" id="weneedAdmin-comInfoDivPagePassed">
			<c:if test="${pagingInfoPassed.firstPage>1 }">	
				<a href="#" onclick="pageFuncP(${pagingInfoPassed.firstPage-1})">
					<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전블럭으로 이동">
				</a>
			</c:if>
			<c:forEach var="i" begin="${pagingInfoPassed.firstPage}" end="${pagingInfoPassed.lastPage}">
				<c:if test="${i==pagingInfoPassed.currentPage}">
					<span style="color:blue;font-weight: bold">
						${i}</span>			
				</c:if>
				<c:if test="${i!=pagingInfoPassed.currentPage}">
					<a href="#" onclick="pageFuncP(${i})">
						[${i}]</a>			
				</c:if>
			</c:forEach>
			<c:if test="${pagingInfoPassed.lastPage < pagingInfoPassed.totalPage}">	
				<a href="#" onclick="pageFuncP(${pagingInfoPassed.lastPage+1})">
					<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로 이동">
				</a>
			</c:if>
		</div>
		<!-- 페이징 디브 끝 -->
	</section>
</div>
<%@ include file="../../inc/admin_bottom.jsp"%>