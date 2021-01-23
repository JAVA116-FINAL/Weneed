<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>

<!-- 고객센터 안내 상세보기 페이지 -->
<main role="main">
    <script type="text/javascript">
  //관련된 문서가 없으면 숨김처리를 하기 위한 스크립트.
    $(document).ready(function () {
  		//문서 상단의 Path에 현재 문서 이름 넣기
  			//$(".breadcrumbs").append('<li title="추천하기 서비스는 무엇인가요?" style="color:#333333 !important;"><a>추천하기 서비스는 무엇인가요?</a></li>');
  
        if (document.getElementById("PCRealatedArticlesDIV").childElementCount == 0) {
  					$("#PCRealatedArticlesDIV").parent().hide();
  					$("#related_articles_div_collapse_btn").hide();
            $("#related_articles_div_collapse_div").hide();
        }
    });
</script>
<section class="breadcrumb"></section>
<div class="container breadcrumb-container">
    <div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path" style="float:left;">
        <ol class="breadcrumbs">
  
    <li title="원티드 고객센터">
        <a href="<c:url value='notice.do'/>">원티드 고객센터</a>
    </li>
  
    <li title="개인회원">
        <a href="<c:url value='notice_dept1.do'/>">개인회원</a>
    </li>
  
    <li title="추천하기 ∙ 받기">
        <a href="<c:url value='notice_dept2.do'/>">추천하기 ∙ 받기</a>
    </li>
  
</ol>

    </div>
    <div class="col-md-3 col-sm-3 col-xs-12 breadcrumb-container-search" style="float:right;">
        <form role="search" class="search" data-search="" action="/hc/ko/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="✓"><input type="search" name="query" id="query" placeholder="검색" aria-label="검색">
<input type="submit" name="commit" value="검색"></form>
    </div>
</div>

<div class="container">
   <section class="article-wrapper">
   
		<div class="row" style="margin-right: 0px;">
			<div class="col-md-9 col-sm-9 col-xs-12" id="article-content-div">
	         	<div class="article__bg">
	               	<h3 class="article-head">제목</h3>
	               	<div class="article-body">
		               	<!-- 본문 출력 div -->
						<p>본문</p>
					</div>
	               	<div class="article-attachments">
						<ul class="attachments">
						</ul>
	               	</div>
				</div>       
			</div>
			
			<!-- 이 섹션의 문서  include -->
			<div id="pc_related_articles_DIV">
				<%@include file="notice_inc/notice_other.jsp" %>
			</div> 
		</div>
		
	</section>
</div>
   

<div class="container" id="new_request_container">
    <span id="article_new_request_label">또 다른 질문이 있으십니까?&nbsp;&nbsp;&nbsp;
    	<a href="<c:url value='notice_qna.do'/>" id="article_new_request_button">
    		다른 문의 등록하기 &gt;
    	</a>
    </span>
</div>

<%@ include file="notice_inc/notice_bottom.jsp"%>