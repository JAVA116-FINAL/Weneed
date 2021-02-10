<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 이용안내 상세보기 우측 이 섹션의 문서 -->
<div class="col-md-3 col-sm-3 col-xs-12"
	style="float: right; border: 1px solid #ececec; padding-top: 20px; padding-bottom: 20px; margin-top: 40px !important; border-radius: 5px; padding-left: 0px; padding-right: 0px;">
	<aside class="article-sidebar side-column" style="font-size: 12px;"
		id="PCRealatedArticlesDIV">
		<section class="section-articles collapsible-sidebar">
			<h3 class="collapsible-sidebar-title sidenav-title"
				style="padding-left: 15px;">이 섹션의 문서
			</h3>
			
			<ul>
				<!-- 5번 반복(rownum으로) -->
				<c:forEach var="map" items="${listOther }">
				<li style="padding-left: 15px; padding-right: 15px;">
					<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>" class="sidenav-item">
						${map['NOTICE_TITLE'] }
					</a>
				</li>
				</c:forEach>
				

			</ul>

		</section>
	</aside>
</div>