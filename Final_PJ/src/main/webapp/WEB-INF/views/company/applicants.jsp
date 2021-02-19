<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../inc/company_top.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<jsp:useBean id="apply"
	class="com.it.wanted.applicants.model.ApplicantsVO" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/companyService/applicants.css'/>">

<style>
li {
	padding-right: 15px;
	padding-top: 3px;
}
</style>

<script type="text/javascript">
   $(function() {
	   $('#appli-checkAll').click(function() {
	         var chkAll = $('#appli-checkAll').prop('checked');
	         if(chkAll){
	            $('.chBox').prop("checked", true);
	         }else{
	            $('.chBox').prop("checked", false);
	         }
	      });
	      
	      $('.chBox').click(function(){
	         $('#appli-checkAll').prop("checked",false);
	      });
	   

	     //$('#appli-btn-statusChange').click(function(){
	       $(document).on('click', '.appli-btn-statusChange', function(){ 
	    	 //alert($('#modalStatus').val());
	    	  
	    	 //리스트로 받아와야함
		         const applyNoArr=[]; //체크박스값을 담을 어레이
		         var checkboxes=$('input:checkbox[name=chBox]');
		         
		         //선택한 체크박스의 회사코드를 추출하여 배열에 집어넣는 작업
		         checkboxes.each(function(e){
		            if($(this).is(':checked')){
		               var applyNo=$(this).val();
		               applyNoArr.push(applyNo);
		            }
		         });
		         
		 		var list= {
		 			"modalStatus": $('#modalStatus').val(),		 		
		 			"applyNoList":applyNoArr
		 		};
		 		
		 		$.ajax({
		 			url:"<c:url value='/company/changeStatus.do'/>",
		 			type:"get",
		 			dataType:"json",
		 			data:list,
		 			
		 			success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
							alert('상태 변경되었습니다!');
							location.reload();
						},
						error:function(xhr, status, error){
							alert('error!: '+error);
						}
		 		});  
		 		
		 		/* $.ajax({
					url:"<c:url value='/admin/companyService/comInfoStatustoPass.do'/>",
					type:"post",
					dataType:"json",
					data:data,
					success:function(result){ //배열로 돌려받겠지 그럼 이 값을 페이지에 다시 세팅해주면 될거같아
						//alert('성공!');
						location.reload();
					},
					error:function(xhr, status, error){
						alert('error!: '+error);
					}
				}); */
	         
	      });
   	
   });

         //$('input[name=applyNoArr]').val(applyNoArr);
 
      /* var status = $('#modalStatus option:selected').val();
		
		$("#modalStatus").change(function(){
			status = $(this).val();
			$('input[name=statusFlag]').val(status);
		}); */

		//$('input[name=statusFlag]').val(status);
</script>
<script>
function pageFunc(curPage, statusflag,posNo){
    $('input[name=statusflag]').val(statusflag);
    $('input[name=posNo]').val(posNo);
    $('input[name=currentPage]').val(curPage);
    $('form[name=frmPage]').submit();
 }
 
 /* $('#favo').click(function(){
    alert('클릭');
 }); */
 
 function favoFunc(applyNo){
    //alert(applyNo);
    alert('.favo'+applyNo);
    $(this).css("color","gold");
 }
</script>
<body>
	<form
		action="<c:url value='/company/applicants.do?statusFlag=${status}&posNo=${posNo}'/>"
		name="frmPage" method="post" style="display: none;">
		<!--  style="display: none;" -->
		<input type="text" name="currentPage"> <input type="text"
			name="searchCondition" value="${param.searchCondition }"> <input
			type="text" name="searchKeyword" value="${param.searchKeyword }">
		<input type="text" name="statusflag"> <input type="text"
			name="posNo">
	</form>

	<div class="container">
		<div class="appli-wrapper">
			<aside>
				<!-- 해당 기업코드로 등록된 포지션들의 직군코드를 불러와 리스트에 뿌려줘야 함 -->
				<div class="appli-positionList">
					<h5 class="appli-positionList-title"
						style="color: #acacac; font-weight: bold; padding-bottom: 3px">채용중</h5>
					<!-- <ul style="font-size: 0.8em; "> -->
					<p class="appli-positionList-pos appli-positionList-pos_selected"
						style="font-size: 12px;">
						<a href='<c:url value="/company/applicants.do"/>'>전체 포지션</a>
						<c:if test="${!empty posList}">
							<c:forEach var="pList" items="${posList}">
								<p class="appli-positionList-pos " style="font-size: 12px;">
									<a
										href='<c:url value="/company/applicants.do?statusFlag=${status}&posNo=${pList.posNo}"/>'>
										<c:out value="${pList.posName }"></c:out>
									</a>
							</c:forEach>
						</c:if>
				</div>
				<div class="appli-positionList appli-positionList-closed">
					<h5 class="appli-positionList-title"
						style="color: #acacac; font-weight: bold;">종료</h5>
				</div>
			</aside>
			<div>
				<!-- contents 영역 -->
				<section>
					<!-- 상단 응답률 / 안내문구 섹션 -->
					<div>
						<!-- 정보 조회성 영역 -->
						<div class="appli-responseInfo">
							<div class="appli-responseInfo_obj">
								<span class="appli-span-allResponse">전체 응답률</span>&nbsp; <strong
									class="appli-bigNumber-blue"> <c:if
										test="${responPer =='NaN' }">0%</c:if> <c:if
										test="${responPer !='NaN' }">${responPer}%</c:if>
								</strong>
							</div>
							
						</div>
						<div>
							<p class="appli-notiGuide">지원자에게 15일 안에 합격/불합격 소식을 알려주세요. 좋은
								후보자는 여러 곳에서 제안을 받습니다. 타이밍을 놓치지 마세요.</p>
						</div>
					</div>
				</section>
				<section>
					<!-- 라디오버튼 선택 시 flag에 따른 리스트 노출 섹션-->
					<div class="appli-filterNsearch">
						<!-- 라디오버튼 필터 / 검색창 -->
						<div>

							<!-- 라디오버튼 필터 -->
							<ul class="appli-ul-filter">
								<!-- 클릭하면, 스타일 바뀌게 해야함 -->

								<!-- checked="checked" -->
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_doc">
									<label for="rd-appliPassedFilter_new"
									class="lb-appliPassedFilter"> <a
										href='<c:url value="/company/applicants.do?statusFlag=0&posNo=${posNo}"/>'>신규
									</a>
								</label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_doc">
									<label for="rd-appliPassedFilter_doc"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=${1 }&posNo=${posNo}"/>'>서류통과
									</a></label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_passed">
									<label for="rd-appliPassedFilter_passed"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=2&posNo=${posNo}"/>'>최종합격
									</a> </label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_rejected">
									<label for="rd-appliPassedFilter_rejected"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=3&posNo=${posNo}"/>'>불합격
									</a> </label></li>
								<li class="appli-li-filter"><input type="radio"
									name="rd-appliPassedFilter" id="rd-appliPassedFilter_timeout">
									<label for="rd-appliPassedFilter_timeout"
									class="lb-appliPassedFilter"><a
										href='<c:url value="/company/applicants.do?statusFlag=4&posNo=${posNo}"/>'>기간만료
									</a> </label></li>
							</ul>
						</div>
						<div class="appli-searchDiv">
							<form name="frmSearch" method="post"
								action='<c:url value="/company/applicants.do?statusFlag=${status}&posNo=${posNo}"/>'>
								<!-- 검색창 -->
								<input type="text" placeholder="지원자, 포지션 검색"
									value="${param.searchKeyword }" name="searchKeyword"
									class="appli-searchInput" style="height: 33px;"> <input
									type="submit" class="appli-btn-search"
									style="outline: none; border: 1px solid #c1c1c1; font-size: 0.8em; font-weight: bold; padding: 0px 10px; margin-right: 10px;"
									value="검색">
							</form>
						</div>
					</div>

					<div class="appli-statusChangeDiv">
						<!-- 체크올, 상태변경, 지원자에게 결과를  알림 on/off, 별표지원자 모아보기 상태변경팝업도 띄워야겠네ㅋㅋ  -->
						<div class="appli-statusChangeDiv">
							<!-- 체크, 상태변경, 지원자에게 결과알림 -->
							<div class="appli-statusChangeDiv">

								<input type="checkbox" class="appli-checkAll"
									id="appli-checkAll" style="    width: 25px"><label for="appli-checkAll"></label>

								<select name="modalStatus" id="modalStatus"
									style="padding-right: 10px; font-size: 0.8em;
										border: 1px solid #c1c1c1; margin: 0px 12px 0px 0px; FONT-WEIGHT: bold; background-color: rgba(0, 0, 0, 0);">
									<option value="1">서류합격</option>
									<option value="2">최종합격</option>
									<option value="3">불합격</option>
								</select>

								<button class="appli-btn-statusChange"
									name="appli-btn-statusChange" id="appli-btn-statusChange"
									style="outline: none;">상태변경</button>

								<%--                         <button class="appli-btn-statusChange" data-toggle="modal"
                           name="appli-btn-statusChange" id="appli-btn-statusChange"
                           data-target=".comServAppliStatusChangeMD" data-statusflag=""
                           data-applyno="${aVo['APPLY_NO']}" style="outline: none;" type="submit">상태변경</button> --%>
								<!-- 상태변경 모달 include -->
								<%-- <%@ include file="../company/modal/statusChange.jsp"%> --%>
							</div>
						</div>
						<div>
							<!-- 별표 지원자 모아보기 -->
							<input type="checkbox" id="chkBox-staredApplis"> <label
								for="chkBox-staredApplis" class="chkBox-staredApplis"
								onclick="favoAll()">별표 지원자 모아보기</label>
						</div>

					</div>
					<div>
						<!-- 리스트 뿌리기.. 디비에서 읽어온걸로, 틀만 잡아주어봅시다 -->
						<!-- 리스트에 값 없을 때 -->
						<c:if test="${empty aList}">
							<div class="appli-list-object-none">
								<p>아직 지원자가 없습니다.</p>
							</div>
						</c:if>

						<!-- 리스트에 값 있을 때, 1개 객체  -->
						<c:if test="${!empty aList}">
							<c:forEach var="aVo" items="${aList}">
								<%--<c:set target="${aVo }" property="statusFlag" value="${aVo['STATUS_FLAG']}"/> --%>
								<div class="appli-list-object">
									<div class="appli-list-object_info">
										<div>
											<input type="checkbox"
												class="appli-object-ele appli-object-ele-chk chBox"
												id="chBox" name="chBox" value="${aVo['APPLY_NO']}">

											<span
												class="fas fa-star appli-object-ele appli-object-ele_gold favo+${aVo['APPLY_NO']}"
												id="favo" onclick="favoFunc(${aVo['APPLY_NO']})"></span>
											<!-- id="favo+${aVo['APPLY_NO']} -->
											<span style="display: none; color: gold;" id="colorChk">a</span>
											<script>
                                    
                                    
                                    /* $('input[name=chBox]:checked') */
                                 </script>

										</div>
										<div class="appli-list-object_infoResume appli-object-ele">
											<div class="appli-list-object_infoResumeImg">
												<i class="fas fa-user"></i>
											</div>
											<div>
												<p class="appli-resume-no">No. ${aVo['APPLY_NO'] }</p>
												<p class="appli-name-posJikgun">
													<a
														href="<c:url value='/company/applicantsDetail.do?applyNo=${aVo["APPLY_NO"]}&statusFlag=${status}&posNo=${posNo}'/>">
														${aVo['APPLY_NAME'] } · ${aVo['POS_NAME'] }</a>
												</p>
											</div>
										</div>
									</div>
									<div>
										<i class="far fa-clock"></i><span class="appli-waitingDays">
											<c:if test="${aVo['APPLY_PERIOD']>=0 }">
                                    ${aVo['APPLY_PERIOD'] } 일째 기다림 
                                 </c:if>
										</span>
									</div>
								</div>
							</c:forEach>
						</c:if>
					</div>

					<div class="appli-paging-divs" style="justify-content: center;">

						<c:if test="${pagingInfo.firstPage>1 }">
							<div class="appli-paging-div appli-paging-div_prev">
								<button
									onclick="pageFunc(${pagingInfo.firstPage-1}, ${status}, ${posNo })">이전</button>
							</div>
						</c:if>

						<!-- [1][2][3][4][5][6][7][8][9][10] -->
						<c:forEach var="i" begin="${pagingInfo.firstPage}"
							end="${pagingInfo.lastPage}">
							<c:if test="${i==pagingInfo.currentPage }">
								<div class="appli-paging-div appli-paging-div_page"
									style="margin: 0px 3px;">
									<button style="font-weight: bold">${i}</button>
								</div>
							</c:if>
							<c:if test="${i!=pagingInfo.currentPage }">
								<div class="appli-paging-div appli-paging-div_page"
									style="margin: 0px 3px;">
									<button onclick="pageFunc(${i},${status},${posNo })">${i}</button>
								</div>
							</c:if>
						</c:forEach>

						<!-- 다음 블럭으로 이동 -->
						<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">
							<div class="appli-paging-div appli-paging-div_next">
								<button
									onclick="pageFunc(${pagingInfo.lastPage+1},${status},${posNo })">다음</button>
							</div>
						</c:if>
						<!--  페이지 번호 끝 -->

					</div>



				</section>
				<!-- 페이징 처리 -->
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>