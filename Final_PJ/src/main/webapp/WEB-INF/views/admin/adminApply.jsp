<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../inc/cssJsImports.jsp" %>
<%@ include file="../inc/admin_top.jsp"%>
<style type="text/css">

.divheader>h1 {
    font-size: x-large;
    margin-bottom: 30px;
    color: gray;
}

table.table.table-bordered.table_jy {
    font: status-bar;
    text-align: center;
    font-size: smaller;
    background: white;
}

thead {
    font-size: initial;
    color: #454545;
}
.divPage_jy {
    text-align: center;
}
.divSearch {
    TEXT-ALIGN: RIGHT;
    MARGIN-BOTTOM: 10PX;
}
input.inputKeyword {
    height: 33px;
}

td.td_jy {
    vertical-align: middle;
    height: 57px;
}

th.th_jy {
    min-width: 73px;
}

td.td_jy.title_td {
    min-width: 148px;
}
table.table.table-bordered.table_jy {
font: status-bar;
}

tr.tr_jy {
    font: status-bar;
}

</style>

<script type="text/javascript">
$(function(){
	$('tbody tr').hover(function(){
		$(this).css('background','#99daef54');
	}, function(){
		$(this).css('background','');		
	});
});

function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}
</script>

<form action="<c:url value='/admin/adminApply.do'/>" name="frmPage" method="post">
	<input type="hidden" name="currentPage">
	<input type="hidden" name="searchKeyword" value="${param.searchKeyword }">
</form>
<section class="resumeListSection">
	<div class="wrap">
		<div class="divheader">
			<h1>지원현황 조회 관리</h1>
		</div>
		<div class="divSearch">
			<form name="frmSearch" method="post" action='<c:url value="/admin/adminApply.do"/>'>
				<input type="text" class="inputKeyword" name="searchKeyword" title="검색어 입력" value="${param.searchKeyword}">   
				<input type="submit" class="btSearch" value="검색">
			
			</form>			
		</div>
		<div class="tableWrapper">
			<table class="table table-bordered table_jy"> 
				<%-- <caption>지원하기 조회 관리</caption> --%>
				 	<thead>
						<tr class="tr_jy"> 
							<th class="th_jy">No.</th>
							<th class="th_jy">회원번호</th>
							<th class="th_jy">이름</th>
							<th class="th_jy">이력서제목</th>
							<th class="th_jy">포지션명</th>
							<th class="th_jy">직군</th>
							<th class="th_jy">회사명</th>
							<th class="th_jy">추천인</th>
							<th class="th_jy">지원일</th>
							<th class="th_jy">상태</th>
							
						</tr>
				 	</thead>
				<tbody>
					<c:if test="${empty applyList }">
						<tr class="align_center"> 
							<td colspan="10">지원하기 내역이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty applyList }">
						<c:forEach var="map" items="${applyList }">
							<tr class="tr_jy">
								<td class="td_jy">${map['APPLY_NO']} </td>
								<td class="td_jy">${map['MEM_NO'] } </td>
								<td class="td_jy">${map['APPLY_NAME'] } </td>
								<td class="td_jy title_td">
									<c:if test="${empty map['RESUME_FILE'] }">
										<a href='<c:url value="/resume/resumeDetailAdmin.do?resumeNo=${map['RESUME_NO']}&memNo=${map['MEM_NO'] }"></c:url>'>
											${map['RESUME_TITLE'] } 
										</a>
									</c:if>
									<c:if test="${!empty map['RESUME_FILE'] }">
										<a href='<c:url value="/resume/resumeFileDown.do?resumeNo=${map['RESUME_NO']}&resumeFile=${map['RESUME_FILE'] }"></c:url>'>
											${map['RESUME_TITLE'] } 
										</a>
									</c:if>
								</td>
								<td class="td_jy title_td"><!-- 여기에 탐색디테일 -->
									<a href='<c:url value="/jobsearch/jobsearchDetailAdmin.do?posNo=${map['POS_NO']}&memNo=${map['MEM_NO']}"></c:url>'>
										${map['POS_NAME'] } 
									</a>
								</td> 
								<td class="td_jy">${map['JIKGUN_NAME'] } </td>
								<td class="td_jy">${map['COM_NAME'] } </td>
								<td class="td_jy">${map['REF_NAME'] } </td>
								<td class="td_jy"> <fmt:formatDate value="${map['APPLY_REGDATE'] }" pattern="yyyy.MM.dd"/>   </td>
								<td class="td_jy">
									<c:if test="${map['STATUS_FLAG'] eq 0}">지원완료</c:if>
									<c:if test="${map['STATUS_FLAG'] eq 1}">서류통과</c:if>
									<c:if test="${map['STATUS_FLAG'] eq 2}">최종합격</c:if>
									<c:if test="${map['STATUS_FLAG'] eq 3}">불합격</c:if>
								</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<!-- 페이지 번호 추가 --> 
		<div class="divPage_jy">
			<c:if test="${pagingInfo.firstPage>1 }">
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">         
        	  	<img src='<c:url value="/resources/images/first.JPG" />'  border="0">   </a>
   			</c:if>
   			<!-- [1][2][3][4][5][6][7][8][9][10] -->
		   <c:forEach var="i" begin="${pagingInfo.firstPage }"  end="${pagingInfo.lastPage }">
		      <c:if test="${i==pagingInfo.currentPage }">
		         <span style="color:blue;font-weight:bold">${i }</span>
		      </c:if>
		      <c:if test="${i!=pagingInfo.currentPage }">                  
		         <a href="#" onclick="pageFunc(${i})">
		            [${i }]
		         </a>
		      </c:if>
		   </c:forEach>
      
		   <c:if test="${pagingInfo.lastPage<pagingInfo.totalPage }">
		      <a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">         
		         <img src="<c:url value="/resources/images/last.JPG" />" border="0">
		      </a>
		   </c:if>
  		 <!--  페이지 번호 끝 -->
		</div>
	</div>
</section>

<%@ include file="../inc/admin_bottom.jsp"%>