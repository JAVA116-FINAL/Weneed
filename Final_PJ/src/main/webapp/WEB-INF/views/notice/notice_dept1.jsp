<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>
<%@include file="notice_inc/notice_script.jsp" %>
<!-- 대분류별 상세보기 페이지 -->
<main role="main">
	<section class="breadcrumb"></section>
	<div class="container breadcrumb-container">
		<div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path"
			style="float: left;">
			<ol class="breadcrumbs">

				<li title="위니드 고객센터"><a href="<c:url value='/notice/notice.do'/>">위니드 고객센터</a></li>

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
				data-instant="true" autocomplete="off" action="<c:url value='notice_search.do'/>">
				<input type="search" name="searchKeyword" id="notice_search" autocomplete="off"> 
				<input type="submit" id="commit" name="commit" value="검색">
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
	
									<!-- 소분류별 상위 5건 출력 페이지 임포트해서 구현 -->
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