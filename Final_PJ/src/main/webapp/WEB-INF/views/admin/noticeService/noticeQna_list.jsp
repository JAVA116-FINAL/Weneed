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
	<h1 class="qnaTableSubject">1:1문의</h1>
	<c:if test="${param.searchKeyword == ''}">
		<c:if test="${replyCnt>0 }">
			<h4 class="qnaTablealert">미답변 문의가 ${replyCnt }건 존재합니다.</h4>
		</c:if>
	</c:if>
	
<form name="frmPage" method="get" action="<c:url value='noticeQna_list.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>
	
<c:if test="${empty listSearch }">
	<h1>${param.searchKeyword }에 대한 검색 결과가 없습니다.</h1>
</c:if>

<c:if test="${!empty listSearch }">
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
				<th scope="col">문의번호</th>
				<th scope="col">답변여부</th>
				<th scope="col">문의고객</th>
				<th scope="col">제목</th>
				<th scope="col">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="qnaVo" items="${listSearch }">
				<tr class="qnaTr">
				<td>
					No.${qnaVo.QNA_NO }
				</td>
				<c:if test="${qnaVo.QNA_REPLY =='Y'}">
					<td style="color: #0000bb">답변완료</td>
				</c:if>
				<c:if test="${qnaVo.QNA_REPLY == 'N'}">
					<td style="color: #ff3a3a">미답변</td>
				</c:if>
					<td>
						${qnaVo.QNA_EMAIL }
					</td>
 					<td>
						<c:if test="${fn:length(qnaVo.QNA_TITLE)>=30 }">
							<a href="<c:url value='/admin/noticeService/noticeQna_detail.do?qna_no=${qnaVo.QNA_NO }'/>">
									${fn:substring(qnaVo.QNA_TITLE, 0,30) } ...
							</a>
						</c:if>
						<c:if test="${fn:length(qnaVo.QNA_TITLE)<30 }">
							<a href="<c:url value='/admin/noticeService/noticeQna_detail.do?qna_no=${qnaVo.QNA_NO }'/>">
								${qnaVo.QNA_TITLE}
							</a>
						</c:if>
					</td>
					<td>
						<fmt:formatDate value="${qnaVo.QNA_REGDATE}" pattern="yyyy/MM/dd HH:mm"/>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</c:if>
	
<form class="search" method="post" action='<c:url value="/admin/noticeService/noticeQna_list.do"/>'>
	<input type="search" id="searchKeyword" name="searchKeyword" value="${param.searchKeyword}">
	<input type="submit" id="commit" name="commit" value="검색">
</form>	

<!-- 페이징처리, 10건씩 출력함-->   
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