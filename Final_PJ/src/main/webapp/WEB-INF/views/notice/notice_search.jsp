<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>
<!-- 고객센터 검색결과 페이지 -->
<main role="main">
<section class="breadcrumb">
	<div class="container">
		<ol class="breadcrumbs">
			<li title="원티드 고객센터"><a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a></li>
			<li title="검색 결과">검색 결과</li>
		</ol>
   </div>
</section>
<div class="container v2">
   <div class="search-results">
      <h1 class="search-results-heading page-header">
         "${keyword }"에 대한 ${listSelectCnt['CNT'] }개의 결과
      </h1>
      <div class="row">
         <section class="search-results-column">
            <h2 class="search-results-subheading">
               지식창고
            </h2>
            
            <ul class="search-results-list">
               
               <!-- 검색결과 반복 -->
				<c:forEach var="map" items="${listSelect }">	               
					<li class="search-result">
		               	<!-- 제목 -->
						<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["notice_no"] }'/>" class="noticeTitle">
							${map['notice_title'] }
						</a>
		
						<div class="search-result-meta">
		                    	
		                    <!-- 카테고리 출력 -->
							<a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a>
		                    
							<a href="<c:url value='/notice/notice_dept1.do?notice_dept1=${map["notice_dept1"] }'/>">
								${map['notice_dept1_info'] }
							</a>
		                    
							<a href="<c:url value='/notice/notice_dept2.do?notice_dept1=${map["notice_dept1"] }&notice_dept2=${map["notice_dept2"] }'/>">
								${map['notice_dept2_info'] }
							</a>
		                    
						</div>
							<!-- 본문 간략화를 위한 페이지 임포트 -->
							<c:import url="/notice/notice_inc/notice_split.do">
								<c:param name="notice_content" value="${map['notice_content'] }"/>
								<c:param name="notice_keyword" value="${keyword }"/>
							</c:import>
						
					</li>
				</c:forEach>
               
            </ul>
            
         </section>
         
      </div>
   </div>
   
<!-- 페이징처리, 10건씩 출력함-->   
<c:if test="">
<nav class="pagination">
	<ul>
		<li class="pagination-current">
			<span>1</span>
		</li>
      	<li class="pagination-next">
        	<a href="#">›</a>
      	</li>

      	<li class="pagination-last">
        	<a href="#">»</a>
      	</li>
    
    </ul>
</nav>
</c:if>
</div>
</main>

<%@ include file="notice_inc/notice_bottom.jsp"%>