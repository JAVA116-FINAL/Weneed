<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>
<%@include file="notice_inc/notice_script.jsp" %>
<!-- 소분류별 상세보기 페이지 -->
<main role="main">

	<section class="breadcrumb"></section>
	<div class="container breadcrumb-container">
		<div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path"
			style="float: left;">
			<ol class="breadcrumbs">

				<li title="위니드 고객센터"><a href="<c:url value='/notice/notice.do'/>">위니드 고객센터</a></li>

				<li title="${selectDept2Info['NOTICE_DEPT1_INFO'] }">
					<a href="<c:url value='/notice/notice_dept1.do?notice_dept1=${selectDept2Info["NOTICE_DEPT1"] }'/>">
						${selectDept2Info['NOTICE_DEPT1_INFO'] }
					</a>

				</li>

				<li title="${selectDept2Info['NOTICE_DEPT2_INFO'] }">
					<a href="<c:url value='/notice/notice_dept2.do?notice_dept1=${selectDept2Info["NOTICE_DEPT1"] }&notice_dept2=${selectDept2Info["NOTICE_DEPT2"] }'/>">
						${selectDept2Info['NOTICE_DEPT2_INFO'] }
					</a>
				</li>

			</ol>

		</div>
		<div class="col-md-3 col-sm-3 col-xs-12 breadcrumb-container-search"
			style="float: right;">
			<form role="search" class="search" data-search=""
				data-instant="true" autocomplete="off" action="<c:url value='notice_search.do'/>">
				<input type="search" name="searchKeyword" id="notice_search" autocomplete="off"> 
				<input type="submit" id="commit" name="commit" value="검색">
			</form>
		</div>
	</div>
	<div class="container" style="margin-bottom: 50px;">
		<div class="row" style="padding-bottom: 50px;">
			<div class="section-template col-xs-12">
				<h2 class="hc_title">${selectDept2Info['NOTICE_DEPT2_INFO'] }</h2>

				<div class="article-lists section-with-article-block">
					<ul class="article-list">
						<!-- dept2반복 -->
						<c:forEach var="map" items="${listDept2 }">
							<li class="article">
								<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
									${map['NOTICE_TITLE'] }
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>

			</div>
		</div>
	</div>
	<div>
		<iframe url="about:blank" data-testid="abe-iframe"
			id="automaticAnswers" class="zEWidget-automaticAnswers"
			title="문서 추천을 위한 피드백" tabindex="-1" aria-hidden="true"
			style="border: none; background: transparent; transform: translateZ(0px); position: fixed; opacity: 0; bottom: 0px; margin: 0px 6px 6px 0px; z-index: 2147483647; right: 0px; height: 188px; width: 410px; transition-property: none; transition-timing-function: unset; top: -9999px;"></iframe>
	</div>
</main>

<%@ include file="notice_inc/notice_bottom.jsp"%>