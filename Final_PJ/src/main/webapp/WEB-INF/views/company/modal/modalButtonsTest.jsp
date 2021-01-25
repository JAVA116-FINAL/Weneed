<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modal Button Test</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyService/comServModal.css">
</head>
<body>
	<!-- 제안하기 버튼과 모달팝업 -->
	<button class="comServModal-btn" 
	data-toggle="modal" data-target=".wantedProposalMD" style="outline:none;">제안하기 팝업</button>
	<%@ include file="proposal.jsp" %>
	<br><br>

	<!-- 매치업 서비스 선택 모달팝업 -->
	<button class="comServModal-btn"
		data-toggle="modal" data-target=".matchupServPlanMD" style="outline:none;">매치업 서비스 선택 팝업</button>
	<%@ include file="matchupServiceSelect.jsp" %>
	<br><br>

	<!-- 매치업서비스 결제정보 입력 팝업  -->
	<button class="comServModal-btn"
		data-toggle="modal" data-target=".matchupServPaymentMD" style="outline:none;">매치업 결제 팝업</button>
	<%@ include file="matchupServicePayment.jsp" %>
</body>
</html>