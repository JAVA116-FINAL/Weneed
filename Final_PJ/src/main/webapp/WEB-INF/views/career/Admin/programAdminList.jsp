<%@ include file="../../inc/admin_top.jsp" %>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<jsp:useBean id="today" class="java.util.Date"/>

  
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programList/mainstyle.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programList/clear.css'/>" />
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/programList/mystyle.css'/>" />
  
  <!-- 커리어성장 카테고리메뉴 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
    
  <!-- 커리어성장 필터 팝업창 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jiwonPopup.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/careerAdminJiwon.css'/>">

<title>관리자 커리어성장 메인페이지</title>

<script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>    
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

	
$(function(){
	$('.divproList table.proBox2 tbody tr').hover(function(){
		$(this).css('background','#fffbda');
	}, function(){
		$(this).css('background','');		
	});
});

function pageFunc(curPage){
	$('input[name=currentPage]').val(curPage);
	$('form[name=frmPage]').submit();
}

$(function(){
	$('#btDel').click(function(){
		var len = 
			$('.divproList .proBox2 tbody')
				.find('input[type=checkbox]:checked').length;
		if(len==0){
			alert('삭제할 프로그램을 선택해주세요!');
			return false;	
		}
		
		$('form[name=frmList]').prop('action','<c:url value="/career/Admin/deleteProgramMulti.do"/>');
		$('form[name=frmList]').submit();
	});	
	
	$('input[name=chkAll]').click(function(){
		$('.divproList .proBox2 tbody').find('input[type=checkbox]')
			.prop('checked', this.checked);	
	});	
});


	
</script>
<style type="text/css">
body{
	margin:0px;
	padding:0px;
}
.fixed {
     position: fixed;
     top: 0px;
}
.asideBtn{
	cursor:pointer; 
	outline:none; 
	border:none; 
	background-color:transparent;
} 
table.proBox2 {
    width: 90%;
    height: 450px;
    margin: auto;
    font-size: large;
}
.divproList {
    border-top: gray;
    border-top: 1px solid gray;
    padding-top: 20px;
    border-bottom: 1px solid gray;
}
</style>
	

	
</head>	
<body>

<!-- 메뉴 부분!!!!! -->

<!-- 메뉴 탑부분 끝!! -->


<!-- 몸통부분!!! -->
<section class="section blog-wrap" style="margin-top:69px; margin-left:-170px;">

<div class="subscribeBody" style="margin-top:-100px;width:1400px; margin-left:auto; margin-right:auto;">
<!-- 직장인의 커리어 여정을 행복하게 -->
<div class="img_admin_career2" style="max-height:300px; overflow:hidden;">
	<img alt="" src="https://scontent-ssn1-1.xx.fbcdn.net/v/t1.0-9/118121468_1722859387865670_6932201002241137751_o.jpg?_nc_cat=105&ccb=2&_nc_sid=dd9801&_nc_ohc=EkvV99Ynvb0AX9KlL8X&_nc_ht=scontent-ssn1-1.xx&oh=15778fa29a00b4a694b1a9b123fca561&oe=602EFE6A" class="campus-recruit-img"  style="max-width:100%;max-height:initial; margin-top:-12.5%;">
</div>


<!-- 프로그램 리스트 부분!!!!!!! -->
<div style="text-align:center; margin:auto;">
	
	<!-- 키워드 검색 파라미터 넘겨져서 받는곳 -->
	 
		
	<form action="<c:url value='/career/Admin/programAdminList.do'/>" 
			name="frmPage" method="post">
			<input type="hidden" name="currentPage">
			<input type="hidden" name="searchCondition" 
				value="${param.searchCondition }">
			<input type="hidden" name="searchKeyword"
				value="${param.searchKeyword }">	
		</form>

	
	<form name="frmList" method="post" 
	action="<c:url value='/career/Admin/programAdminList.do'/>">	
		<div style="margin-top:10px;"><h2>프로그램 리스트</h2></div>
		<c:if test="${!empty param.searchKeyword }">
			<p>검색어 : ${param.searchKeyword}, ${pagingInfo.totalRecord }  
				건 검색되었습니다.</p>
		</c:if>
		
		<!-- 이벤트별 조회 -->
		<div style="text-align:right; margin-right:60px;margin-bottom: 10px;">	
		     
			프로그램 조회
			
			<select name="proType">
				<option value=""></option>
				<option value="EVENT" 
					<c:if test="${param.proType=='1' }">
						selected
					</c:if>
				>이벤트</option>
				<option value="BOOKCLUB"
					<c:if test="${param.proType=='2' }">
						selected
					</c:if>
				>북클럽</option>
				<option value="LECTURE"
					<c:if test="${param.proType=='3' }">
						selected
					</c:if>
				>교육/강의</option>				
				<option value="FIN"
					<c:if test="${proVo.regiEndDate < today}">
						selected
					</c:if>
				>신청 마감 완료</option>				
			</select>
 			<button><i class="fas fa-search"></i></button>		
		</div>
		<!-- 이벤트별 조회 끝 -->
		
		
		<%-- 
			       		<c:if test="${param.searchCondition == 'pro_Name'}">
		        	<c:choose>
		        		<c:when test="${param.searchKeyword == '이벤트'}">
							1
		        		</c:when>
		        		<c:when test="${param.searchKeyword == '북클럽'}">
		        			2
		        		</c:when>
		        		<c:when test="${param.searchKeyword == '교육/강의'}">
		        			3
		        		</c:when>
		        		
		        		<c:otherwise></c:otherwise>
		        	</c:choose>
		         </c:if> --%>
		
		
		
		<div class="divproList">
		<table class="proBox2" style="width: 90%;margin:auto;"
			 	summary="프로그램 번호, 프로그램 이름, 프로그램 신청 마감일, 작성자, 작성일에 대한 정보를 제공합니다.">
			<colgroup>
				<col style="width:2%;" />
				<col style="width:5%;" />
				<col style="width:16%;" />
				<col style="width:30%;" />
				<col style="width:9%;" />
				<col style="width:8%;" />
				<col style="width:11%;" />
				<col style="width:8%;" />		
			</colgroup>
			<thead>
			  <tr>
				<th><input type="checkbox" name="chkAll" ></th>	  
			    <th scope="col">번호</th>
			    <th scope="col">이미지</th>
			    <th scope="col">프로그램 이름</th>
			    <th scope="col">프로그램 구분</th>
			    <th scope="col">시작일</th>
			    <th scope="col">신청 마감일</th>
			    <th scope="col">작성일</th>
			  </tr>
			</thead> 
			<tbody>
				<c:if test="${empty plist }">
					<tr>
						<td colspan="7" class="align_center">데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if> 
				<c:if test="${!empty plist }">
		<!--리스트 내용 반복문 시작  -->
					<c:set var="k" value="0"/>
				  	<c:forEach var="proVo" items="${plist }">				  	
						<tr  style="text-align:center">
							<td>
								<input type="checkbox" name="proItems[${k}].programNo" value="${proVo.programNo}">							
							</td>		
								<input type="hidden" name="proItems[${k}].proImage" value="${proVo.proImage}">
											
							<td>${proVo.programNo}</td>
							<td>
							<img src="<c:url value='/programImgUpload/${proVo.proImage }'/>" alt="" class="img-fluid" style="width:340px; height:155px;">
							</td>
							<td style="text-align:left">
		 					<a href
					="<c:url value='/career/Admin/programDetail.do?programNo=${proVo.programNo}'/>"> 
								<!-- 제목이 긴 경우 일부만 보여주기 -->
								<c:if test="${fn:length(proVo.proName)>=30}">
									&emsp;${fn:substring(proVo.proName, 0,30) } ...
								</c:if>
								<c:if test="${fn:length(proVo.proName)<30}">						
									&emsp;${proVo.proName}
								</c:if>
							</a>
							</td>
							
							<td>
								<c:if test="${proVo.proType  == 1}">
								이벤트
								</c:if>
								<c:if test="${proVo.proType == 2}">
								북클럽
								</c:if>
								<c:if test="${proVo.proType == 3}">
								교육/강의
								</c:if>
							</td>
	
							<td><fmt:formatDate value="${proVo.proStartDate}" pattern="yyyy-MM-dd"/></td>
							
							<!-- 신청 마감된 글인 경우 체크 이미지 보여주기 -->	
							<td>
								<c:if test="${proVo.regiEndDate < today}">
									<fmt:formatDate value="${proVo.regiEndDate}" pattern="yyyy-MM-dd"/>&nbsp;<i class="fas fa-check"></i>
								</c:if>
								<c:if test="${proVo.regiEndDate >= today}">
								<fmt:formatDate value="${proVo.regiEndDate}" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>			
							<td><fmt:formatDate value="${proVo.regdate}" pattern="yyyy-MM-dd"/> </td>
						</tr>	
						<c:set var="k" value="${k+1 }"/>				
					</c:forEach>
				  </c:if>
			  <!--반복처리 끝  -->
			  </tbody>
		</table>	   
		</div>


<!-- 페이징부분!!!!!! -->

		<div class="divPage" style="margin-top:10px; font-size:18px;">
			<!-- 페이지 번호 추가 -->		
			<!-- 이전 블럭으로 이동 -->
		 	<c:if test="${pagingInfo.firstPage>1 }">	
				<a href="#" onclick="pageFunc(${pagingInfo.firstPage-1})">
					<img src="<c:url value='/resources/images/first.JPG'/>" alt="이전블럭으로 이동">
				</a>
			</c:if>
								
			<!-- [1][2][3][4][5][6][7][8][9][10] -->
			<c:forEach var="i" begin="${pagingInfo.firstPage}" end="${pagingInfo.lastPage}">
				<c:if test="${i==pagingInfo.currentPage }">
					<span style="color:blue;font-weight: bold">
						${i}</span>			
				</c:if>
				<c:if test="${i!=pagingInfo.currentPage }">
					<a href="#" onclick="pageFunc(${i})">
						[${i}]</a>			
				</c:if>
			</c:forEach>
			
			<!-- 다음 블럭으로 이동 -->
			<c:if test="${pagingInfo.lastPage < pagingInfo.totalPage }">	
				<a href="#" onclick="pageFunc(${pagingInfo.lastPage+1})">
					<img src="<c:url value='/resources/images/last.JPG'/>" alt="다음 블럭으로 이동">
				</a>
			</c:if>
			<!--  페이지 번호 끝 -->
		</div>
		
			<div style="text-align:right; margin-left:1155px; width:150px; font-size:18px;">
				<input type="button" value="선택한 상품 삭제" id="btDel">
			</div>		
	</form>	
		
		
		
		
		
		<div class="divSearch" >
		   	<form name="frmSearch" method="post" 
		   		action='<c:url value="/career/Admin/programAdminList.do"/>'>
		        <select name="searchCondition" style="height:32px; font-size:16px;">
		            <option value="pro_Name"  
		            	<c:if test="${param.searchCondition == 'pro_Name'}">
		            		selected="selected"
		            	</c:if>
		            >프로그램 이름</option>
		        </select>   
       	 		       	 
		        <input type="text" name="searchKeyword" title="검색어 입력"
		        	value="${param.searchKeyword}" style="height:33px;"> 	   
				<input type="submit" style="height:35; font-size: 16px;" value="검색">
				<input type="button" style="height:35; font-size: 16px;" onclick=location.href="<c:url value=''/>" value="초기화">
		    </form>
		</div>

<!-- 페이징부분 + 검색부분 끝!!!! -->


		
		<div class="divBtn">
		    <a href='<c:url value="/career/Admin/programWrite.do"/>' >프로그램 추가</a>
		</div>
</div>

<!-- 프로그램 리스트부분 끝!!!! -->

							<aside style="float:right;">
									<div class="asideBtn" style="float:right; position:fixed; margin-left:20px; margin-top:-970px;">
											<div class="">
												<button type="button" onclick="location.href='<c:url value="/career/Admin/careerMainAdminView.do"/>'" title="커리어성장 관리자 메인으로">
													<i class="fas fa-home fa-3x" style="color:#258bf7;"></i><br><br>
												</button>
											</div>
							</aside>

</div> <!-- subscribeBody 디브끝 -->
</section>

<!-- 푸터부분!!!!! -->
	<%@ include file="../../inc/admin_bottom.jsp" %>
