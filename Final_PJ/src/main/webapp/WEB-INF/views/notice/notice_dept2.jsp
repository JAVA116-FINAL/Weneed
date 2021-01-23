<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>

<!-- 소분류별 상세보기 페이지 -->
<main role="main">

<style>
.search input[type="search"] {
	background-color: #fff;
	border: 1px solid #ececec;
	border-radius: 5px;
	height: 50px;
	padding: 10px 55px 10px 15px;
	width: 100%;
}

ul.article-list>li a {
	color: black;
}

ul.article-list>li, .article-sidebar section>ul>li,
	.searchbox-suggestions ul li {
	padding: 10px 0px;
}

ol.breadcrumbs {
	padding-left: 0px;
}
/*상단 문서 Path 및 검색 영역 [S]*/
.breadcrumb-container {
	margin-bottom: 20px;
	padding-right: 15px;
	padding-left: 0px;
}

.breadcrumb-container-path {
	padding-left: 15px;
}

.breadcrumb-container-search {
	padding-left: 0px;
	padding-right: 0px;
}

@media ( max-width : 769px) {
	.breadcrumb-container {
		margin-bottom: 20px;
		padding-right: 0px;
		padding-left: 0px;
	}
	.breadcrumb-container-search {
		padding-left: 15px;
		padding-right: 15px;
	}
	form.search input[type="submit"] {
		right: 10px;
	}
}
/*상단 문서 Path 및 검색 영역 [E]*/
.breadcrumbs {
	padding-left: 0px;
}
</style>

	<section class="breadcrumb"></section>
	<div class="container breadcrumb-container">
		<div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path"
			style="float: left;">
			<ol class="breadcrumbs">

				<li title="원티드 고객센터"><a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a></li>

				<li title="개인회원"><a
					href="<c:url value='/notice/notice_dept1.do'/>">개인회원</a>

				</li>

				<li title="지원하기 ∙ 관리"><a
					href="<c:url value='/notice/notice_dept2.do'/>">지원하기
						∙ 관리</a></li>

			</ol>

		</div>
		<div class="col-md-3 col-sm-3 col-xs-12 breadcrumb-container-search"
			style="float: right;">
			<form role="search" class="search" data-search=""
				action="/hc/ko/search" accept-charset="UTF-8" method="get">
				<input name="utf8" type="hidden" value="✓"><input
					type="search" name="query" id="query" placeholder="검색"
					aria-label="검색"> <input type="submit" name="commit"
					value="검색">
			</form>
		</div>
	</div>
	<div class="container" style="margin-bottom: 50px;">
		<div class="row" style="padding-bottom: 50px;">
			<div class="section-template col-xs-12">
				<h2 class="hc_title">지원하기 ∙ 관리</h2>

				<div class="article-lists section-with-article-block">
					<ul class="article-list">
						<!--승격 문서 중복 방지 기능-->
						<!--추천하기 ∙ 받기-->
						<!--나머지-->


						<li class="article"><a
							href="/hc/ko/articles/360035844171-%EC%A7%80%EC%9B%90%ED%95%9C-%ED%9A%8C%EC%82%AC%EC%97%90%EC%84%9C-%ED%94%BC%EB%93%9C%EB%B0%B1%EC%9D%B4-%EC%97%86%EC%8A%B5%EB%8B%88%EB%8B%A4-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%98%EB%A9%B4-%EB%90%98%EB%82%98%EC%9A%94-">지원한
								회사에서 피드백이 없습니다. 어떻게 하면 되나요?</a></li>

						<li class="article"><a
							href="/hc/ko/articles/900004105146-%EB%82%B4%EA%B0%80-%EC%97%85%EB%A1%9C%EB%93%9C%ED%95%9C-%ED%8C%8C%EC%9D%BC%EC%9D%84-%EC%82%AD%EC%A0%9C%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94">내가
								업로드한 파일을 삭제하고 싶어요</a></li>

						<li class="article"><a
							href="/hc/ko/articles/900003742546-%EC%9B%90%ED%8B%B0%EB%93%9C-%EC%9D%B4%EB%A0%A5%EC%84%9C-%EC%96%91%EC%8B%9D%EC%9D%84-%EA%BC%AD-%EC%82%AC%EC%9A%A9%ED%95%B4%EC%95%BC-%ED%95%98%EB%82%98%EC%9A%94-">원티드
								이력서 양식을 꼭 사용해야 하나요?</a></li>

						<li class="article"><a
							href="/hc/ko/articles/360035968811-%EB%82%B4%EA%B0%80-%EB%A7%8C%EB%93%A0-%ED%8C%8C%EC%9D%BC%EC%9D%84-%EC%82%AC%EC%9A%A9%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94-">내가
								만든 파일을 사용하고 싶어요.</a></li>

						<li class="article"><a
							href="/hc/ko/articles/360035483932-%EC%A7%80%EC%9B%90-%ED%98%84%ED%99%A9%EC%9D%80-%EC%96%B4%EB%94%94%EC%97%90%EC%84%9C-%ED%99%95%EC%9D%B8-%ED%95%98%EB%82%98%EC%9A%94-%EC%88%98%EC%A0%95%EB%8F%84-%EA%B0%80%EB%8A%A5%ED%95%9C%EA%B0%80%EC%9A%94-">지원
								현황은 어디에서 확인 하나요? 수정도 가능한가요?</a></li>

						<li class="article"><a
							href="/hc/ko/articles/360035964471-%EC%A0%9C%EC%B6%9C%ED%95%98%EA%B8%B0-%EB%B2%84%ED%8A%BC%EC%9D%B4-%EB%B9%84%ED%99%9C%EC%84%B1%ED%99%94-%ED%9A%8C%EC%83%89-%EB%90%98%EC%96%B4-%EC%9E%88%EC%96%B4%EC%9A%94-">제출하기
								버튼이 비활성화(회색)되어 있어요.</a></li>

						<li class="article"><a
							href="/hc/ko/articles/360035483972-%EC%84%9C%EB%A5%98-%EC%A0%84%ED%98%95%EC%97%90-%ED%95%A9%EA%B2%A9%ED%96%88%EC%8A%B5%EB%8B%88%EB%8B%A4-%EC%9D%B4%ED%9B%84-%EC%A0%88%EC%B0%A8%EB%8A%94-%EC%96%B4%EB%96%BB%EA%B2%8C-%EB%90%98%EB%82%98%EC%9A%94-">서류
								전형에 합격했습니다. 이후 절차는 어떻게 되나요?</a></li>

						<li class="article"><a
							href="/hc/ko/articles/900001700043-%EC%A7%80%EC%9B%90%ED%96%88%EB%8D%98-%EA%B3%B5%EA%B3%A0%EC%97%90-%EC%9E%AC%EC%A7%80%EC%9B%90-or-%EC%A7%80%EC%9B%90-%EC%B7%A8%EC%86%8C%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94">지원했던
								공고에 재지원 or 지원 취소하고 싶어요</a></li>

						<li class="article"><a
							href="/hc/ko/articles/360040755371-%EC%9E%AC%EC%A7%81%EC%A4%91%EC%9D%B8-%ED%9A%8C%EC%82%AC%EC%97%90-%EB%82%B4-%EC%9D%B4%EB%A0%A5%EC%84%9C%EB%A5%BC-%EB%85%B8%EC%B6%9C%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%A7%80-%EC%95%8A%EC%95%84%EC%9A%94">재직중인
								회사에 내 이력서를 노출하고 싶지 않아요</a></li>

						<li class="article"><a
							href="/hc/ko/articles/900005037843-%EC%9D%B4%EB%A0%A5%EC%84%9C-%EC%A0%9C%EB%AA%A9%EB%A7%8C-%EB%B3%80%EA%B2%BD%ED%95%98%EA%B3%A0-%EC%97%AC%EB%9F%AC-%EA%B8%B0%EC%97%85%EC%97%90-%EC%A7%80%EC%9B%90%ED%95%B4%EB%8F%84-%EB%90%98%EB%82%98%EC%9A%94-">이력서
								제목만 변경하고 여러 기업에 지원해도 되나요?</a></li>


					</ul>
				</div>

			</div>
		</div>
	</div>
	<div>
		<iframe url="about:blank" data-testid="abe-iframe"
			id="automaticAnswers" class="zEWidget-automaticAnswers"
			title="문서 추천을 위한 피드백" tabindex="-1" aria-hidden="true"
			style="border: none; background: transparent; transform: translateZ(0px); position: fixed; opacity: 0; bottom: 0px; margin: 0px 6px 6px 0px; z-index: 2147483647; right: 0px; height: 188px; width: 410px; transition-property: none; transition-timing-function: unset; top: -9999px;"></iframe>
	</div>
</main>

<%@ include file="notice_inc/notice_bottom.jsp"%>