<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../../inc/cssJsImports.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사이미지 승인 페이지</title>
<script type="text/javascript">
	//승인 버튼 클릭하면
	//체크박스 자식들 중 체크된 애들의 회사코드를 읽어서 리스트로 저장해 
	//그거를 setComPassed.do 같은 애로 보내서 데이터 처리를 해서 돌려받아
	//얼럿 띄우고 새로고침해
	
$(function(){
	$('#weneed-adminBtn-pass').click(function(){
		const comImgNoArr=[]; //이미지 번호를 담을 어레이
		var checkboxes=$('input:checkbox[name=weneed-adminStatusChkbox]');
		
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
				alert('성공!');
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
		<h2>기업이미지 승인 요청 건</h2>
		<div class="weneed-adminBtnDiv">
			<button class="weneed-adminBtn" id="weneed-adminBtn-reject">거절</button>
			<button class="weneed-adminBtn" id="weneed-adminBtn-pass">승인</button>
		</div>
		<table class="weneed-adminTable">
			<tr class="weneed-adminTable">
				<thead>
					<th><input type="checkbox" id="weneed-admin-CheckAll"></th>
					<th>번호</th>
					<th>회사코드</th>
					<th>이미지</th>
					<th>승인상태</th>
				</thead>
			</tr>
			<!-- foreach문으로 전부 불러오기  -->
			<!-- 근데 그중에 passed인거 아닌 애들만 -->
			<tbody>
				<c:forEach var="comImgVo" items="${comImgList}">
					<c:if test="${comImgVo.comImgPassed == 'N'}">
						<tr class="weneed-adminTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox">
							</td>
							<td>${comImgVo.comImgNo}</td>
							<td>${comImgVo.comCode}</td>
							<td><img style="width: 200px" src="<c:url value='/companyImgUpload/${comImgVo.comImgUrl}'/>"/></td>
							<td>${comImgVo.comImgPassed}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<h2>기업이미지 승인 완료 건</h2>
		<table class="weneed-adminTable">
			<tr class="weneed-adminTable">
				<thead>
					<th><input type="checkbox" id="weneed-admin-CheckAll"></th>
					<th>번호</th>
					<th>회사코드</th>
					<th>이미지</th>
					<th>승인상태</th>
				</thead>
			</tr>
			<!-- foreach문으로 전부 불러오기  -->
			<!-- 근데 그중에 passed인거 아닌 애들만 -->
			<tbody>
				<c:forEach var="comInfoVo" items="${comList}">
					<c:if test="${comInfoVo.comInfoPassed != 'N'}">
						<tr class="weneed-adminTable">
							<td>
								<input type="checkbox" name="weneed-adminStatusChkbox">
							</td>
							<td>${comImgVo.comImgNo}</td>
							<td>${comImgVo.comCode}</td>
							<td><img style="width: 200px" src="<c:url value='/companyImgUpload/${comImgVo.comImgUrl}'/>"/></td>
							<td>${comImgVo.comImgPassed}</td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>

</body>
</html>