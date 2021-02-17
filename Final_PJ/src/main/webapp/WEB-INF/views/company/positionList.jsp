<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/imgUpload.css'/>">
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/position.css'/>">
<script type="text/javascript">
$(function(){
	$('#tabImg').attr("checked", 'checked');
	
	//[전체 / 개발 ] 탭 기능 구현.. 여기선 의미 없지만
	$('#tabImg').click(function(){
		$('.infoSection').addClass('hide');
		$('.imgSection').removeClass('hide');
		
		$('#tabImgLabel').addClass('selectedTab');
		$('#tabInfoLabel').removeClass('selectedTab');
		
	});
	$('#tabInfo').click(function(){
		$('.imgSection').addClass('hide');
		$('.infoSection').removeClass('hide');
		
		$('#tabInfoLabel').addClass('selectedTab');
		$('#tabImgLabel').removeClass('selectedTab');
	});
	
});

</script>
<body>
	<div class="container">
		<!-- 탭 섹션 -->
		<section class="positionTabSection">
			<div>
				<input type="radio" id="posTab-showAll" name="posTab" />
				<label for="posTab-showAll" id="tabImgLabel" class="comInfoRegiTab selectedTab">전체</label>
				<input type="radio" id="posTab-developer" name="posTab" class="comInfoRegiTab" />
				<label for="posTab-developer" id="tabInfoLabel" class="comInfoRegiTab">개발</label>
			</div>
			<div>
				<a id="positionAddBtn" class="btn btn-main btn-round-full" 
					href="<c:url value='/company/positionAdd.do'/>">포지션 추가</a>
			</div>
		</section>
		<!-- 채용중 -->
		<section class="posSection">
			<h2 class="comServTitle">채용중</h2>
			<div class="posBoxWrapper">
				<c:forEach var="posVo" items="${posList}">
					<c:if test="${posVo.posStatus == 3}">
						<div class="posBoxWrapper2" onclick="location.href='<c:url value="/company/positionEdit.do?posNo=${posVo.posNo}"/>'">
							<div class="posBox">
								<h4 class="posJikMu">${posVo.posName} / ${posVo.posStatus}</h4>
								<span class="posDueDate">
								<c:if test="${!empty posVo.endDate}">
									${posVo.endDate}
								</c:if>
								<c:if test="${empty posVo.endDate}">
									상시
								</c:if>
									</span>
							</div>
							<div class="posDueDateDiv">
								<a class="posDueDateLink" href="#">마감일 설정 <i class="fas fa-chevron-right"></i></a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</section>
		<section class="posSection">
			<h2 class="comServTitle">심사중</h2>
			<div class="posBoxWrapper">
				<c:forEach var="posVo" items="${posList}">
				<c:if test="${posVo.posStatus eq 2}">
					<div class="posBoxWrapper2" onclick="location.href='<c:url value="/company/positionEdit.do?posNo=${posVo.posNo}"/>'">
						<div class="posBox">
							<h4 class="posJikMu">${posVo.posName }</h4>
							<span class="posDueDate">
							<c:if test="${!empty posVo.endDate}">
								${posVo.endDate}
							</c:if>
							<c:if test="${empty posVo.endDate}">
								상시
							</c:if>
								</span>
						</div>
						<div class="posDueDateDiv">
							<a class="posDueDateLink" href="#">마감일 설정 <i class="fas fa-chevron-right"></i></a>
						</div>
					</div>
				</c:if>
			</c:forEach>
			</div>
		</section>
		<section class="posSection posSectionTemp">
			<h2 class="comServTitle posSectionTemp">임시 저장</h2>
			<div class="posBoxWrapper">
				<c:forEach var="posVo" items="${posList}">
					<c:if test="${posVo.posStatus eq 1}">
						<div class="posBoxWrapper2" onclick="location.href='<c:url value="/company/positionEdit.do?posNo=${posVo.posNo}"/>'">
							<div class="posBox">
								<h4 class="posJikMu">${posVo.posName}</h4>
								<span class="posDueDate">
								<c:if test="${!empty posVo.endDate}">
									${posVo.endDate}
								</c:if>
								<c:if test="${empty posVo.endDate}">
									상시
								</c:if>
									</span>
							</div>
							<div class="posDueDateDiv">
								<a class="posDueDateLink" href="#">마감일 설정 <i class="fas fa-chevron-right"></i></a>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</section>
	</div>
</body>
</html>