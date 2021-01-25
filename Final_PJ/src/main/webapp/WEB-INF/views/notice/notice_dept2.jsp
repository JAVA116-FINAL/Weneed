<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>

<!-- 소분류별 상세보기 페이지 -->
<main role="main">

<style>
.search input[type="search"] {
	background-color: #fff;
	border: 1px solid #ececec;
	border-radius: 5px;
	height: 50px;
	padding: 10px 55px 10px 15px;
	width: 100%;
}

ul.article-list>li a {
	color: black;
}

ul.article-list>li, .article-sidebar section>ul>li,
	.searchbox-suggestions ul li {
	padding: 10px 0px;
}

ol.breadcrumbs {
	padding-left: 0px;
}
/*상단 문서 Path 및 검색 영역 [S]*/
.breadcrumb-container {
	margin-bottom: 20px;
	padding-right: 15px;
	padding-left: 0px;
}

.breadcrumb-container-path {
	padding-left: 15px;
}

.breadcrumb-container-search {
	padding-left: 0px;
	padding-right: 0px;
}

@media ( max-width : 769px) {
	.breadcrumb-container {
		margin-bottom: 20px;
		padding-right: 0px;
		padding-left: 0px;
	}
	.breadcrumb-container-search {
		padding-left: 15px;
		padding-right: 15px;
	}
	form.search input[type="submit"] {
		right: 10px;
	}
}
/*상단 문서 Path 및 검색 영역 [E]*/
.breadcrumbs {
	padding-left: 0px;
}
</style>

	<section class="breadcrumb"></section>
	<div class="container breadcrumb-container">
		<div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path"
			style="float: left;">
			<ol class="breadcrumbs">

				<li title="원티드 고객센터"><a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a></li>

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
				action="/hc/ko/search" accept-charset="UTF-8" method="get">
				<input name="utf8" type="hidden" value="✓"><input
					type="search" name="query" id="query" placeholder="검색"
					aria-label="검색"> <input type="submit" name="commit"
					value="검색">
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