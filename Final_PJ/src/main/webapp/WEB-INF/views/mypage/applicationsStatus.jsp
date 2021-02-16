<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<div class="status-table-header">
						<div class="status-company">지원 회사</div>
						<div class="status-position">지원 포지션</div>
						<div class="status-time">작성시간</div>
						<div class="status-status">진행상태</div>
						<div class="status-recommendation">추천 현황</div>
					</div>
					<!-- 결과 없는 경우 -->
					<dl class="status-table-empty">
						<dt><i class="icon-search"></i></dt>
						<dd class="empty-result-text">요청하신 결과가 없습니다.</dd>
					</dl>
					<!-- 결과 있는 경우 -->
					
				</div>
				<div id="applyPositionWrapper">
					<div class="status-summary">
						<a class="status-summary-item active">
							<dl>
								<dt>0</dt>
								<dd>전체</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>0</dt>
								<dd>지원 완료</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>0</dt>
								<dd>서류 통과</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>0</dt>
								<dd>최종 합격</dd>
							</dl>
						</a>
						<a class="status-summary-item">
							<dl>
								<dt>0</dt>
								<dd>불합격</dd>
							</dl>
						</a>
					</div>
					<div id="writeStatusWrapper">
					<h4 class="status-total">총<span>0</span>건</h4>
					<div class="status-table-header">
						<div class="status-company">지원 회사</div>
						<div class="status-position">지원 포지션</div>
						<div class="status-time">작성시간</div>
						<div class="status-status">진행상태</div>
						<div class="status-recommendation">추천 현황</div>
					</div>
					<!-- 결과 없는 경우 -->
					<dl class="status-table-empty">
						<dt><i class="icon-search"></i></dt>
						<dd class="empty-result-text">요청하신 결과가 없습니다.</dd>
					</dl>
					<!-- 결과 있는 경우 -->
				</div>
				</div>
			</section>
		</div>
	</div>
</div>