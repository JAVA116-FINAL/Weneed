<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../../inc/admin_top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/companyService.css'/>">
<script type="text/javascript">
$(function(){
	$('#weneed-adminBtn-pass').click(function(){
		const posNoArr=[]; //체크박스값을 담을 어레이
		var checkboxes=$('input:checkbox[name=weneed-adminStatusChkbox-before]');
		
		//선택한 체크박스의 회사코드를 추출하여 배열에 집어넣는 작업
		checkboxes.each(function(){
		//	console.log(checkboxes.is(':checked'));
			if($(this).is(':checked')){
				var posNo=$(this).parent().next().html();
				console.log("posNo: "+posNo);
				posNoArr.push(posNo);
			}
		});
		
		var data = {
			"posNoList":posNoArr,
		};
		
		//상태값을 변경하기 위한 함수
		$.ajax({
			url:"<c:url value='/admin/positionStatustoPass.do'/>",
			type:"post",
			dataType:"json",
			data:data,
			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
				alert('성공!');
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
			url:"<c:url value='/admin/positionPermissionYet.do'/>",
			type:"post",
			dataType:"json",
			data:{
				"curPage":curPageY
			},
			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
			//	alert('승인요청건 조회 성공!');
				pageFuncY(curPageY);
			},
			error:function(xhr, status, error){
				alert('승인요청건 조회 error!: '+error);
			}
		});
		
		//승인완료건 테이블을 다시 그려주는 ajax
		$.ajax({
			url:"<c:url value='/admin/positionPermissionPassed.do'/>",
			type:"post",
			dataType:"json",
			data:{
				"curPage":curPageP
			},
			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
			//	alert('승인완료건 조회 성공!');
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

//이렇게 줄일 수 있음 좋겠는데.. 나중에 줄여보자. 리팩토링!
function pageFunc(url, curPage, here, here2, drawTr, drawPageDiv){
	$.ajax({
		url:url,
		type:"get",
		dataType:"json",
		data:{
			"curPage":curPage
		},
		success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
		//	alert('승인요청건 조회 성공!');
			drawTr(result, here);
			drawPageDiv(result, here2);
		},
		error:function(xhr, status, error){
			alert('승인요청건 조회 error!: '+error);
		}
	});
}

function pageFuncY(curPage){
	var here = $('#weneedadmin-tbodyYet');
	var here2 = $('#weneedAdmin-comInfoDivPageBefore');
	$.ajax({
		url:"<c:url value='/admin/positionPermissionYet.do'/>",
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
		url:"<c:url value='/admin/positionPermissionPassed.do'/>",
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
	var pageLength=jsonVo.posList.length;
	//리스트의 개수만큼
	console.log("pageLength:"+pageLength);
	for(posMap of jsonVo.posList){
		//직군, 마감일, 최소, 최대
		if(posMap.JIKGUN_NAME==null){
			posMap.JIKGUN_NAME="";
		}
		if(posMap.END_DATE==null){
			posMap.END_DATE="";
		}
		if(posMap.POS_MIN_SAL==null){
			posMap.POS_MIN_SAL="";
		}
		if(posMap.POS_MAX_SAL== null){
			posMap.POS_MAX_SAL="";
		}
		var str="<tr class='weneed-adminTable'><td>";
		str+="<input type='checkbox' name='weneed-adminStatusChkbox-before'></td>";
		str+="<td>"+posMap.POS_NO+"</td>";
		str+="<td>"+posMap.COM_NAME+"</td>";
		str+="<td>"+posMap.JIKGUN_NAME+"</td>";
		str+="<td class='title_td'>";
		str+="<a href='<c:url value='/jobsearch/jobsearchDetailAdmin.do?posNo="+posMap.POS_NO+"&memNo=1000'/>'>";
		str+=posMap.POS_NAME+"</a></td>";
		str+="<td>"+posMap.POS_MIN_SAL+"</td>";
		str+="<td>"+posMap.POS_MAX_SAL+"</td>";
		str+="<td><fmt:formatDate value='${posMap.POSREGDATE}' pattern='yyyy-MM-dd'/></td></td>";
		str+="<td>"+posMap.END_DATE+"</td>";
		str+="<td>";
		if(posMap.POS_STATUS == 1){ str+="임시저장";}
		if(posMap.POS_STATUS == 2){ str+="승인요청";}
		if(posMap.POS_STATUS == 3){ str+="승인";}
		if(posMap.POS_STATUS == 4){ str+="종료";}
		str+="</td>";
		str+="</tr>";	
		
		$('#weneedadmin-tbodyYet').append(str);
	}
}

function drawTrP(jsonVo, pasteHere){
	pasteHere.html('');
	var pageLength=jsonVo.posList.length;
	//리스트의 개수만큼
	console.log("pageLength:"+pageLength);
	for(posMap of jsonVo.posList){
		if(posMap.JIKGUN_NAME==null){
			posMap.JIKGUN_NAME="";
		}
		if(posMap.END_DATE==null){
			posMap.END_DATE="";
		}
		if(posMap.POS_MIN_SAL==null){
			posMap.POS_MIN_SAL="";
		}
		if(posMap.POS_MAX_SAL== null){
			posMap.POS_MAX_SAL="";
		}
		var str="<tr class='weneed-adminTable'><td>";
		str+="<input type='checkbox' name='weneed-adminStatusChkbox-after'></td>";
		str+="<td>"+posMap.POS_NO+"</td>";
		str+="<td>"+posMap.COM_NAME+"</td>";
		str+="<td>"+posMap.JIKGUN_NAME+"</td>";
		str+="<td class='title_td'>";
		str+="<a href='<c:url value='/jobsearch/jobsearchDetailAdmin.do?posNo="+posMap.POS_NO+"&memNo=1000'/>'>";
		str+=posMap.POS_NAME+"</a></td>";
		str+="<td>"+posMap.POS_MIN_SAL+"</td>";
		str+="<td>"+posMap.POS_MAX_SAL+"</td>";
		str+="<td><fmt:formatDate value='${posMap.POSREGDATE}' pattern='yyyy-MM-dd'/></td></td>";
		str+="<td>"+posMap.END_DATE+"</td>";
		str+="<td>";
		if(posMap.POS_STATUS == 1){ str+="임시저장";}
		if(posMap.POS_STATUS == 2){ str+="승인요청";}
		if(posMap.POS_STATUS == 3){ str+="승인";}
		if(posMap.POS_STATUS == 4){ str+="종료";}
		str+="</td>";
		str+="</tr>";
		
		$('#weneedadmin-tbodyPassed').append(str);
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
</script>
<body>
<div class="container">
	<div class="weneedAdmin-permissionTab">
		<h2>포지션 승인</h2>
	</div>
	<section id="weneedAdmin-comInfoBeforeSec">
		<form action="<c:url value='/admin/positionPermission.do'/>" name="frmPageY" method="post">
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
					<th style="width: 40px;">No.</th>
					<th style="width: 120px;">기업명</th>
					<th style="width: 50px;">직군</th>
					<th style="width: 300px;">포지션명</th>
					<th style="width: 80px;">최소연봉</th>
					<th style="width: 80px;">최대연봉</th>
					<th style="width: 90px;">등록일</th>
					<th style="width: 90px;">마감일</th>
					<th style="width: 80px;">상태</th>
				</tr>
			</thead>
			<tbody id="weneedadmin-tbodyYet">
				<c:if test="${empty posListYet }">
						<tr class="align_center"> 
							<td colspan="9">포지션 등록내역이 없습니다.</td>
						</tr>
				</c:if>
				<c:if test="${!empty posListYet }">
					<c:forEach var="map" items="${posListYet }">
						<tr class="weneed-adminTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox-before">
							</td>
							<td>${map['POS_NO']} </td>
							<td>${map['COM_NAME'] } </td>
							<td>${map['JIKGUN_NAME'] } </td>
							<td class="title_td">
								<a href='<c:url value="/jobsearch/jobsearchDetailAdmin.do?posNo=${map['POS_NO']}&memNo=1000"></c:url>'>
									${map['POS_NAME'] } 
								</a>
							</td>
							<td>${map['POS_MIN_SAL'] } </td>
							<td>${map['POS_MAX_SAL'] } </td>
							<td> <fmt:formatDate value="${map['POS_REGDATE'] }" pattern="yyyy-MM-dd"/></td>
							<td> ${map['END_DATE'] }</td>
							<td>
								<c:if test="${map['POS_STATUS'] eq '1'}">임시저장</c:if>
								<c:if test="${map['POS_STATUS'] eq '2'}">승인요청</c:if>
								<c:if test="${map['POS_STATUS'] eq '3'}">승인</c:if>
								<c:if test="${map['POS_STATUS'] eq '4'}">종료</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
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
		<form action="<c:url value='/admin/PositionPermission.do'/>" name="frmPageP" method="post">
			<input type="hidden" name="currentPageP" value="${pagingInfoPassed.currentPage}">
			<input type="hidden" name="typeCheck" value="P">
		</form>
		<span class="weneedAdmin-comPermiSubtitle" id="weneedAdmin-showInfoListPassed"> 승인 완료 건</span>
		<table class="weneed-adminTable">
			<thead>
				<tr class="weneed-adminTable">
					<th style="width: 35px;"><input type="checkbox" id="weneed-admin-CheckAll-ed"></th>
					<th style="width: 40px;">No.</th>
					<th style="width: 120px;">기업명</th>
					<th style="width: 50px;">직군</th>
					<th style="width: 300px;">포지션명</th>
					<th style="width: 80px;">최소연봉</th>
					<th style="width: 80px;">최대연봉</th>
					<th style="width: 90px;">등록일</th>
					<th style="width: 90px;">마감일</th>
					<th style="width: 80px;">상태</th>
				</tr>
			</thead>
			<tbody id="weneedadmin-tbodyPassed">
				<c:if test="${empty posListPassed }">
						<tr class="align_center"> 
							<td colspan="9">포지션 등록내역이 없습니다.</td>
						</tr>
				</c:if>
				<c:if test="${!empty posListPassed }">
					<c:forEach var="map" items="${posListPassed }">
						<tr class="weneed-adminTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox-after">
							</td>
							<td>${map['POS_NO']} </td>
							<td>${map['COM_NAME'] } </td>
							<td>${map['JIKGUN_NAME'] } </td>
							<td class="title_td">
								<a href='<c:url value="/jobsearch/jobsearchDetailAdmin.do?posNo=${map['POS_NO']}&memNo=1000"></c:url>'>
									${map['POS_NAME'] } 
								</a>
							</td>
							<td>${map['POS_MIN_SAL'] } </td>
							<td>${map['POS_MAX_SAL'] } </td>
							<td> <fmt:formatDate value="${map['POS_REGDATE'] }" pattern="yyyy-MM-dd"/></td>
							<td> ${map['END_DATE'] }</td>
							<td>
								<c:if test="${map['POS_STATUS'] eq '1'}">임시저장</c:if>
								<c:if test="${map['POS_STATUS'] eq '2'}">승인요청</c:if>
								<c:if test="${map['POS_STATUS'] eq '3'}">승인</c:if>
								<c:if test="${map['POS_STATUS'] eq '4'}">종료</c:if>
							</td>
						</tr>
					</c:forEach>
				</c:if>
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