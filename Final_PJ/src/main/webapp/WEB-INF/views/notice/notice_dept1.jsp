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
	
									<!-- 소분류별 상위 5건 출력 페이지 임포트해서 구현? -->
									<c:import url="/notice/notice_inc/notice_showByDept2.do">
										<c:param name="notice_dept2" value="${map['NOTICE_DEPT2'] }"/>
									</c:import>
									
								</div>
							</section>
						</c:forEach>

					</div>

				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="notice_inc/notice_bottom.jsp"%>