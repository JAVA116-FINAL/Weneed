<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/profileSetting.css'/>">
<script type="text/javascript">
	$(function(){
		$('.writeNavBtn').addClass('linkActive');
		$('.applyPositionNavBtn').removeClass('linkActive');
		$('#writeStatusWrapper').show();
		$('#applyPositionWrapper').hide();
		$('.writeNavBtn').click(function(){
			$('.writeNavBtn').addClass('linkActive');
			$('.applyPositionNavBtn').removeClass('linkActive');
			$('#writeStatusWrapper').show();
			$('#applyPositionWrapper').hide();
		});
		$('.applyPositionNavBtn').click(function(){
			$('.applyPositionNavBtn').addClass('linkActive');
			$('.writeNavBtn').removeClass('linkActive');
			$('#writeStatusWrapper').hide();
			$('#applyPositionWrapper').show();
		});
		
	});
</script>
<style>
.active{
	color:#3366ff;
}
</style>
<div class="applicationsStatus-container-wrap">
	<div class="container">
		<div class="applyStatus-left-nav">
			<h2 class="applyStatus-left-nav-title"><p>지원현황</p></h2>
		</div>
		<div class="applyStatus-left-nav-detail">
			<div class="nav-detail-btn">
				<ul>
					<li><button class="writeNavBtn" style="outline:none;">작성 중</button></li>
					<li><button class="applyPositionNavBtn" style="outline:none;">지원한 포지션</button></li>
				</ul>
			</div>
			
			<section>
				<div id="writeStatusWrapper">
					<h4 class="status-total">총<span>0</span>건</h4>
					<table class="statusListBox">
						<colgroup>
							<col style="width:30%">
							<col style="width:30%">
							<col style="width:25%">
							<col style="width:15%">
						</colgroup>
						<thead class="status-table-header">
							<tr>
								<th scope="col" class="status-company">지원 회사</th>
								<th scope="col" class="status-position">지원 포지션</th>
								<th scope="col" class="status-time">작성시간</th>
								<th scope="col" class="status-status">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<!-- 결과 없는 경우 -->
								<tr class="status-table-empty">
									<td colspan="4" class="empty-result-text">요청하신 결과가 없습니다.</td>
								</tr>
							<!-- 결과 있는 경우 -->
							
						</tbody>
					</table>
				</div>
				<div id="applyPositionWrapper">
					<div class="status-summary">
						<a class="status-summary-item active">
							<dl>
								<dt style="color:#3366ff;">${applyTotal}</dt>
								<dd style="color:#3366ff;">전체</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>${applyComplete}</dt>
								<dd>지원 완료</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>${documentPass}</dt>
								<dd>서류 통과</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>${finalAccept}</dt>
								<dd>최종 합격</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>${finalFail}</dt>
								<dd>불합격</dd>
							</dl>
						</a>
					</div>
					<div id="writeStatusWrapper">
					<h4 class="status-total">총<span>${applyTotal}</span>건</h4>
					<table class="statusListBox">
						<colgroup>
							<col style="width:30%">
							<col style="width:30%">
							<col style="width:25%">
							<col style="width:15%">
						</colgroup>
						<thead class="status-table-header">
							<tr>
								<th scope="col" class="status-company">지원 회사</th>
								<th scope="col" class="status-position">지원 포지션</th>
								<th scope="col" class="status-time">작성시간</th>
								<th scope="col" class="status-status">진행상태</th>
							</tr>
						</thead>
						<tbody>
							<!-- 결과 없는 경우 -->
							<c:if test="${empty list }">
								<tr class="status-table-empty">
									<td colspan="4" class="empty-result-text">요청하신 결과가 없습니다.</td>
								</tr>
							</c:if>
							<!-- 결과 있는 경우 -->
							<c:if test="${!empty list }">
								<c:forEach var="map" items="${list }">
									<tr class="statusListTr">
										<td scope="col" class="status-company">${map['COM_NAME'] }</td>
										<td scope="col" class="status-position">${map['POS_NAME'] }</td>
										<td scope="col" class="status-time">
											<fmt:formatDate value="${map['APPLY_REGDATE'] }" pattern="YYYY-MM-dd"/>
										</td>
										<td scope="col" class="status-status">
											<c:set var="status_flag" value="${map['STATUS_FLAG'] }"/>
											<c:choose>
												<c:when test="${status_flag eq '0' }">지원완료</c:when>
												<c:when test="${status_flag eq '1' }">서류통과</c:when>
												<c:when test="${status_flag eq '2' }">최종합격</c:when>
												<c:when test="${status_flag eq '3' }">불합격</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				</div>
			</section>
		</div>
	</div>
</div>