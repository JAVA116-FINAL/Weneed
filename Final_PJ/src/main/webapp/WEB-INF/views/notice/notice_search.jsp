<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>
<!-- 고객센터 검색결과 페이지 -->

<script type="text/javascript">	
	function boardList(curPage){
		//폼의 후손에서 찾아라
		$('form[name=frmPage]').find('input[name=currentPage]').val(curPage);
		$('form[name=frmPage]').submit();
	}
</script>

<main role="main">
<section class="breadcrumb">
	<div class="container">
		<ol class="breadcrumbs">
			<li title="원티드 고객센터"><a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a></li>
			<li title="검색 결과">검색 결과</li>
		</ol>
   </div>
</section>

<form name="frmPage" method="post" action="<c:url value='notice_search.do'/>">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword}">
</form>

<form action="frmList" method="post" action="<c:url value='notice_search.do'/>">
<div class="container v2">
   <div class="search-results">
		<h1 class="search-results-heading page-header">
			<c:if test="${empty listSelect }">
			'${param.searchKeyword}'에 대한 검색 결과가 없습니다.
			</c:if>
			<c:if test="${!empty listSelect }">
			'${param.searchKeyword}'에 대한 ${pagingInfo.totalRecord}개의 결과
			</c:if>
      	</h1>
	<div class="row">
		<section class="search-results-column">
			<h2 class="search-results-subheading">
				지식창고
			</h2>
            
		<c:if test="${empty listSelect }">
			<p>'${param.searchKeyword}'에 대한 검색결과가 없습니다. 
				<a href="<c:url value='/notice/notice.do'/>">지식창고 찾아보기</a>
			</p>
		</c:if>
		<c:if test="${!empty listSelect }">
            <ul class="search-results-list">
               <!-- 검색결과 반복 -->
				<c:forEach var="noticeVo" items="${listSelect }">	               
					<li class="search-result">
		               	<!-- 제목 -->
						<a href="<c:url value='/notice/notice_detail.do?notice_no=${noticeVo.notice_no}'/>" class="noticeTitle">
							${noticeVo.notice_title}
						</a>
		
						<div class="search-result-meta">
		                    	
		                    <!-- 카테고리 출력 -->
							<a href="<c:url value='/notice/notice.do'/>" >
								원티드 고객센터
							</a>
		                    
							<a href="<c:url value='/notice/notice_dept1.do?notice_dept1=${noticeVo.notice_dept1}'/>">
								${noticeVo.notice_dept1_info}
							</a>
		                    
							<a href="<c:url value='/notice/notice_dept2.do?notice_dept1=${noticeVo.notice_dept1}&notice_dept2=${noticeVo.notice_dept2}'/>">
								${noticeVo.notice_dept2_info}
							</a>
		                    
						</div>
							<!-- 본문 간략화를 위한 페이지 임포트 -->
							<c:import url="/notice/notice_inc/notice_split.do">
								<c:param name="notice_content" value="${noticeVo.notice_content}"/>
								<c:param name="notice_keyword" value="${param.searchKeyword}"/>
							</c:import>
						
					</li>
				</c:forEach>
               
            </ul>
		</c:if>
            
		</section>
         
      </div>
   </div>
   
<!-- 페이징처리, 10건씩 출력함-->   
<c:set var="totalCnt" value="${pagingInfo.totalRecord}"/>
<c:if test="${totalCnt>9}">
<nav class="pagination">
	<ul>

		<c:if test="${pagingInfo.firstPage>1 }">
			<li class="pagination-prev">
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
</form>
</main>

<%@ include file="notice_inc/notice_bottom.jsp"%>