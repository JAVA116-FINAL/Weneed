<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/cssJsImports.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사정보 승인요청 확인 및 승인 페이지</title>
<script type="text/javascript">
	//승인 버튼 클릭하면
	//체크박스 자식들 중 체크된 애들의 회사코드를 읽어서 리스트로 저장해 
	//그거를 setComPassed.do 같은 애로 보내서 데이터 처리를 해서 돌려받아
	//얼럿 띄우고 새로고침해
	
$(function(){
	$('#weneed-adminBtn-pass').click(function(){
		const comCodeArr=[]; //체크박스값을 담을 어레이
		const comMemNoArr=[]; //멤버번호값을 담을 어레이
		var checkboxes=$('input:checkbox[name=weneed-adminStatusChkbox]');
		
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
	
	});
		
		/* if(comInfotd.children(':eq(0)').prop('checked', true)){
			comCode = comInfotd.children(':eq(1)').html();
//				comCodeArr.push(comCode);
		}
	//		console.log(comCodeArr); */
	
	//전체선택하기
	$('#weneed-admin-CheckAll').click(function(){
		if($(this).is(':checked')){
			$('input[name=weneed-adminStatusChkbox]').prop('checked', true);
		}else {
			$('input[name=weneed-adminStatusChkbox]').prop('checked', false);
		}
	});
});
</script>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/companyService.css'/>">
</head>
<body>
<div class="container">
	<div> <!-- 정보승인, 이미지승인 구분해서 받기 -->
		<h2>기업정보 승인 요청 건</h2>
		<div class="weneed-adminBtnDiv">
			<button class="weneed-adminBtn" id="weneed-adminBtn-reject">거절</button>
			<button class="weneed-adminBtn" id="weneed-adminBtn-pass">승인</button>
		</div>
		<table class="weneed-adminTable">
			<thead>
				<tr class="weneed-adminTable">
					<th><input type="checkbox" id="weneed-admin-CheckAll"></th>
					<th>회사코드</th>
					<th>회사명</th>
					<th>사업자등록번호</th>
					<th>팀원수</th>
					<th>매출액/투자규모</th>
					<th>등록회원번호</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<!-- foreach문으로 전부 불러오기  -->
			<!-- 근데 그중에 passed인거 아닌 애들만 -->
			<tbody>
				<c:forEach var="comInfoVo" items="${comList}">
					<c:if test="${comInfoVo.comInfoPassed != 'PASSED'}">
						<tr class="weneed-adminTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox">
							</td>
							<td>${comInfoVo.comCode}</td>
							<td>${comInfoVo.comName}</td>
							<td>${comInfoVo.comRegNo}</td>
							<td>${comInfoVo.comSize}</td>
							<td>${comInfoVo.profit}</td>
							<td>${comInfoVo.comMemNo}</td>
							<td>${comInfoVo.comInfoPassed}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<h2>기업정보 승인 완료 건</h2>
		<table class="weneed-adminTable">
			<thead>
				<tr class="weneed-adminTable">
					<th><input type="checkbox" id="weneed-admin-CheckAll-ed"></th>
					<th>회사코드</th>
					<th>회사명</th>
					<th>사업자등록번호</th>
					<th>팀원수</th>
					<th>매출액/투자규모</th>
					<th>등록회원번호</th>
					<th>승인상태</th>
				</tr>
			</thead>
			<!-- foreach문으로 전부 불러오기  -->
			<!-- 근데 그중에 passed인거 아닌 애들만 -->
			<tbody>
				<c:forEach var="comInfoVo" items="${comList}">
					<c:if test="${comInfoVo.comInfoPassed == 'PASSED'}">
						<tr class="weneed-adminTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox">
							</td>
							<td>${comInfoVo.comCode}</td>
							<td>${comInfoVo.comName}</td>
							<td>${comInfoVo.comRegNo}</td>
							<td>${comInfoVo.comSize}</td>
							<td>${comInfoVo.profit}</td>
							<td>${comInfoVo.comMemNo}</td>
							<td>${comInfoVo.comInfoPassed}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>