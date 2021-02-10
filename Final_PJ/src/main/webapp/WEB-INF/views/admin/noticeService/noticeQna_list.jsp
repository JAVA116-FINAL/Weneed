<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 문의내역 리스트 출력 페이지 -->
<%@ include file="../../notice/notice_inc/notice_top.jsp"%><!-- 관리자 페이지 include로 바꾸기 -->
<div class="qnaTable">
	<h1 class="qnaTableSubject">1:1문의</h1>
	<c:if test="${replyCnt>0 }">
		<h4 class="qnaTablealert">미답변 문의가 ${replyCnt }건 존재합니다.</h4>
	</c:if>
	
	<table>
		<colgroup>
			<col style="width:10%" />
			<col style="width:25%" />
			<col style="width:45%" />
			<col style="width:20%" />
		<colgroup/>
		<thead>
			<tr class="align_center">
				<th scope="col" style="text-align: center;">답변여부</th>
				<th scope="col" style="text-align: center;">문의고객</th>
				<th scope="col" style="text-align: center;">제목</th>
				<th scope="col" style="text-align: center;">등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="map" items="${qnaList }">
				<tr class="align_center">
				<c:if test="${map['QNA_REPLY'] == 'Y'}">
					<td style="color: #0000bb">답변완료</td>
				</c:if>
				<c:if test="${map['QNA_REPLY'] == 'N'}">
					<td style="color: #ff3a3a">미답변</td>
				</c:if>
					<td>${map['QNA_EMAIL']}</td>
					<td>
						<a href="<c:url value='/admin/noticeService/noticeQna_detail.do?qna_no=${map["QNA_NO"] }'/>">
							${map['QNA_TITLE']}
						</a>
					</td>
					<td><fmt:formatDate value="${map['QNA_REGDATE']}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="../../notice/notice_inc/notice_bottom.jsp"%>