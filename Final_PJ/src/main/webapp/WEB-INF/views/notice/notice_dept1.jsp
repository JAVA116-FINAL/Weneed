<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>

<!-- 대분류별 상세보기 페이지 -->
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
/*상단 문서 Path 및 검색 영역 [S]*/
ol.breadcrumbs {
	padding-left: 0px;
}

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
	.section {
		margin-bottom: 30px !important;
	}
}
/*상단 문서 Path 및 검색 영역 [E]*/
.section-tree {
	margin-bottom: 30px;
	margin-left: 15px;
}

@media ( min-width : 770px) {
	.section {
		margin-bottom: 60px !important;
	}
}

.breadcrumbs {
	padding-left: 0px;
}

.hc_title {
	margin-bottom: 20px;
	padding-top: 10px;
}
</style>

	<section class="breadcrumb"></section>
	<div class="container breadcrumb-container">
		<div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path"
			style="float: left;">
			<ol class="breadcrumbs">

				<li title="원티드 고객센터"><a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a></li>

				<li title="${notice_dept1_info}">
					<a href="<c:url value='/notice/notice_dept1.do?notice_dept1=${notice_dept1 }'/>">
						${notice_dept1_info}
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
			<div class="category_view">
				<div class="col-xs-12">
					<h2 class="hc_title">${notice_dept1_info}</h2>
				</div>
				<div class="list-items">

					<div class="section-tree">
						
						<!-- 소분류 개수만큼 반복 -->
						<c:forEach var="map" items="${listDept2Count}">
							<section class="section col-md-6 col-sm-6 col-xs-12">
								<div class="section-with-article-block">
									<h3>
										<a href="<c:url value='/notice/notice_dept2.do?notice_dept1=${map["NOTICE_DEPT1"] }&notice_dept2=${map["NOTICE_DEPT2"] }'/>">
											${map['NOTICE_DEPT2_INFO'] }
										</a>
										<input type="hidden" value="${map['NOTICE_DEPT2'] }">
									</h3>
	
									<ul class="article-list">
										<!-- 해당 소분류 글목록 반복 -->
										<c:forEach var="map" items="${listDept1 }">
											<li class="article">
												<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
													${map['NOTICE_TITLE'] }
												</a>
											</li>
										</c:forEach>
									</ul>
	
	
								</div>
							</section>
						</c:forEach>

					</div>

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