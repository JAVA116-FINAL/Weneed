<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../../inc/admin_top.jsp"%>
<link rel="stylesheet" href="<c:url value='/resources/css/admin/noticeService.css'/>">

<script type="text/javascript">	
	function boardList(curPage){
		//폼의 후손에서 찾아라
		$('form[name=frmPage]').find('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<div class="align_center" id="noticeDiv">
	<h1 style="font-size: 40px; margin-bottom: 50px;">이용안내</h1>

<form name="frmPage" method="get" action="<c:url value='notice_list.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

	<c:if test="${empty listAll }">
		<h1>해당하는 이용안내가 존재하지 않습니다.</h1>
		<!-- 등록버튼 연결 -->
	</c:if>
	<c:if test="${!empty listAll }">
			<table class="table" id="qnaTable">
		<colgroup>
			<col style="width:10%" />
			<col style="width:10%" />
			<col style="width:25%" />
			<col style="width:40%" />
			<col style="width:15%" />
		<colgroup/>
		<thead>
			<tr>
				<th scope="col">안내번호</th>
				<th scope="col">분류1</th>
				<th scope="col">분류2</th>
				<th scope="col">제목</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="map" items="${listAll }">
				<tr class="qnaTr">
				<td>No.${map['NOTICE_NO'] }</td>
				<td>${map['NOTICE_DEPT1_INFO'] }</td>
				<td>${map['NOTICE_DEPT2_INFO'] }</td>
 				<td>
					<c:if test="${fn:length(map['NOTICE_TITLE'])>=30 }">
						<a href="<c:url value='/admin/noticeService/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
							${fn:substring(map['NOTICE_TITLE'] , 0,30) } ...
						</a>
					</c:if>
					<c:if test="${fn:length(map['NOTICE_TITLE'])<30 }">
						<a href="<c:url value='/admin/noticeService/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
							${map['NOTICE_TITLE'] }
						</a>
					</c:if>
				</td>
					<td>
						<fmt:formatDate value="${map['NOTICE_REGDATE'] }" pattern="yyyy/MM/dd HH:mm"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</c:if>
	
<form class="search" method="post" action='<c:url value="/admin/noticeService/notice_list.do"/>'>
	<input type="search" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}">
	<input type="submit" id="commit" name="commit" value="검색">
</form>		

<c:set var="totalCnt" value="${pagingInfo.totalRecord}"/>
<c:if test="${totalCnt>9}">
<nav>
	<ul class="pagination">

		<c:if test="${pagingInfo.firstPage>1 }">
			<li>
				<a href="#" onclick="boardList(${pagingInfo.firstPage-1})">‹</a>
	      	</li>
		</c:if>
    
		<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
			<c:if test="${i==pagingInfo.currentPage }">
				<li class="pagination-current">
					<span>${i}</span>
        		</li>
			</c:if>
			
			<c:if test="${i!=pagingInfo.currentPage }">
				<li>
					<a href="#" onclick="boardList(${i})">${i}</a>
				</li>			
			</c:if>
		</c:forEach>

		<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
	      	<li class="pagination-next">
	        	<a href="#" onclick="boardList(${pagingInfo.lastPage+1})">></a>
	    	</li>
    	</c:if>
    	
	</ul>
</nav>
</c:if>

</div>

<%@ include file="../../inc/admin_bottom.jsp"%>