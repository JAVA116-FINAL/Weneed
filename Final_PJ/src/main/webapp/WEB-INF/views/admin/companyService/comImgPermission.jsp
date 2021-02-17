<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/admin_top.jsp"%>

<script type="text/javascript">
	//승인 버튼 클릭하면
	//체크박스 자식들 중 체크된 애들의 회사코드를 읽어서 리스트로 저장해 
	//그거를 setComPassed.do 같은 애로 보내서 데이터 처리를 해서 돌려받아
	//얼럿 띄우고 새로고침해
	
$(function(){
	$('#weneed-adminBtn-pass').click(function(){
		const comImgNoArr=[]; //이미지 번호를 담을 어레이
		var checkboxes=$('input:checkbox[name=weneed-adminStatusChkbox-before]');
		
		//선택한 체크박스의 회사코드를 추출하여 배열에 집어넣는 작업
		checkboxes.each(function(){
		//	console.log(checkboxes.is(':checked'));
			if($(this).is(':checked')){
				var comImgNo=$(this).parent().next().html();
				console.log("comImgNo: "+comImgNo);
				comImgNoArr.push(comImgNo);
			}
		});
		console.log("comImgNoArr: "+comImgNoArr);
		
		var data = {
			"comImgNoArr":comImgNoArr
		};
		
		$.ajax({
			url:"<c:url value='/admin/companyService/comImgStatustoPass.do'/>",
			type:"post",
			dataType:"json",
			data:data,
			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해서 새로고침해주면 될거같아
			//	alert('성공!');
				location.reload();
			},
			error:function(xhr, status, error){
				alert('error!: '+error);
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
		url:"<c:url value='/admin/companyService/comImgPermissionYet.do'/>",
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
		url:"<c:url value='/admin/companyService/comImgPermissionPassed.do'/>",
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
	var pageLength=jsonVo.comImgList.length;
	//리스트의 개수만큼
	console.log("pageLength:"+pageLength);
	for(comImgVo of jsonVo.comImgList){
		if(comImgVo.comImgNo == null){
			comImgVo.comImgNo='';
		}
		if(comImgVo.comCode == null){
			comImgVo.comCode='';
		}
		if(comImgVo.comImgUrl == null){
			comImgVo.comImgUrl='';
		}
		if(comImgVo.comImgPassed == null){
			comImgVo.comImgPassed='';
		}
		
		var str="";
		str+="<tr class='weneed-adminTable'>";		
		str+="<td>";		
		str+="<input type='checkbox' name='weneed-adminStatusChkbox-before'>";		//before 여기서도 붙여야겠지 어차피
		str+="</td>";		
		str+="<td>"+comImgVo.comImgNo+"</td>";		
		str+="<td>"+comImgVo.comCode+"</td>";		
		str+="<td><img style='width:200px; height:146px;' src='<c:url value='/companyImgUpload/"+comImgVo.comImgUrl+"'/>'/></td>";		
		str+="<td>"+comImgVo.comImgPassed+"</td>";		
		str+="</tr>";	
		
		$('#weneedAdmin-weneedadmin-tbodyYet').append(str);
	}
}

function drawTrP(jsonVo, pasteHere){
	pasteHere.html('');
	var pageLength=jsonVo.comImgList.length;
	//리스트의 개수만큼
	console.log("pageLength:"+pageLength);
	for(comImgVo of jsonVo.comImgList){
		if(comImgVo.comImgNo == null){
			comImgVo.comImgNo='';
		}
		if(comImgVo.comCode == null){
			comImgVo.comCode='';
		}
		if(comImgVo.comImgUrl == null){
			comImgVo.comImgUrl='';
		}
		if(comImgVo.comImgPassed == null){
			comImgVo.comImgPassed='';
		}
		
		var str="";
		str+="<tr class='weneed-adminTable'>";		
		str+="<td>";		
		str+="<input type='checkbox' name='weneed-adminStatusChkbox-after'>";		//before 여기서도 붙여야겠지 어차피
		str+="</td>";		
		str+="<td>"+comImgVo.comImgNo+"</td>";		
		str+="<td>"+comImgVo.comCode+"</td>";		
		str+="<td><img style='width:200px; height:146px;' src='<c:url value='/companyImgUpload/"+comImgVo.comImgUrl+"'/>'/></td>";		
		str+="<td>"+comImgVo.comImgPassed+"</td>";		
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
	
	$('#weneedAdmin-comImgDivPageBefore').append(str);
}

function drawPageDivP(jsonVo, pasteHere){
	console.log(jsonVo);
	console.log(jsonVo.pagingInfo.currentPage);
	$('#weneedAdmin-comImgDivPagePassed').html('');
	pasteHere.html('');
	var str='';
	var paging=jsonVo.pagingInfo;
	
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
	$('#weneedAdmin-comImgDivPagePassed').append(str);
}
</script>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/companyService.css'/>">
</head>
<body>
<div class="container">
	<div>
		<h2>기업 이미지 승인</h2>
		<section class="weneedAdmin-comImgPermissionSec">
			<span class="weneedAdmin-comPermiSubtitle"  id="weneedAdmin-showImgListBefore">승인 요청 건 </span>
			<div class="weneed-adminBtnDiv">
				<button class="weneed-adminBtn" id="weneed-adminBtn-reject">거절</button>
				<button class="weneed-adminBtn" id="weneed-adminBtn-pass">승인</button>
			</div>
			<table class="weneed-adminTable">
				<thead>
					<tr class="weneed-adminTable">
						<th><input type="checkbox" id="weneed-admin-CheckAll"></th>
						<th>번호</th>
						<th>회사코드</th>
						<th>이미지</th>
						<th>승인상태</th>
					</tr>
				</thead>
				<!-- foreach문으로 전부 불러오기  -->
				<!-- 근데 그중에 passed인거 아닌 애들만 -->
				<tbody id="weneedadmin-tbodyYet">
					<c:forEach var="comImgVo" items="${comImgListYet}">
						<tr class="weneed-adminTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox-before">
							</td>
							<td>${comImgVo.comImgNo}</td>
							<td>${comImgVo.comCode}</td>
							<td><img style="width: 200px; height:146px;" src="<c:url value='/companyImgUpload/${comImgVo.comImgUrl}'/>"/></td>
							<td>${comImgVo.comImgPassed}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 디브 -->
			<div class="divPage" id="weneedAdmin-comImgDivPageBefore">
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
		
		<section class="weneedAdmin-comImgPassedSec">
			<span class="weneedAdmin-comPermiSubtitle"  id="weneedAdmin-showImgListPassed"> 승인 완료 건</span>
			<table class="weneed-adminTable">
				<thead>
					<tr class="weneed-adminTable">
						<th><input type="checkbox" id="weneed-admin-CheckAll-ed"></th>
						<th>번호</th>
						<th>회사코드</th>
						<th>이미지</th>
						<th>승인상태</th>
					</tr>
				</thead>
				<!-- foreach문으로 전부 불러오기  -->
				<!-- 근데 그중에 passed인거 아닌 애들만 -->
				<tbody id="weneedadmin-tbodyPassed">
					<c:forEach var="comImgVo" items="${comImgListPassed}">
						<tr class="weneed-adminTable imgPassedTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox-after">
							</td>
							<td>${comImgVo.comImgNo}</td>
							<td>${comImgVo.comCode}</td>
							<td><img style="width: 200px; height:146px;" src="<c:url value='/companyImgUpload/${comImgVo.comImgUrl}'/>"/></td>
							<td>${comImgVo.comImgPassed}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<!-- 페이징 디브 -->
		<div class="divPage" id="weneedAdmin-comImgDivPagePassed">
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
</div>
<%@ include file="../../inc/admin_bottom.jsp"%>