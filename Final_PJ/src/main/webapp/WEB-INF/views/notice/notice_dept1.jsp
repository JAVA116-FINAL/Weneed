<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>

<!-- 대분류별 상세보기 페이지 -->
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
/*상단 문서 Path 및 검색 영역 [S]*/
ol.breadcrumbs {
	padding-left: 0px;
}

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
	.section {
		margin-bottom: 30px !important;
	}
}
/*상단 문서 Path 및 검색 영역 [E]*/
.section-tree {
	margin-bottom: 30px;
	margin-left: 15px;
}

@media ( min-width : 770px) {
	.section {
		margin-bottom: 60px !important;
	}
}

.breadcrumbs {
	padding-left: 0px;
}

.hc_title {
	margin-bottom: 20px;
	padding-top: 10px;
}
</style>

	<section class="breadcrumb"></section>
	<div class="container breadcrumb-container">
		<div class="col-md-9 col-sm-9 col-xs-12 breadcrumb-container-path"
			style="float: left;">
			<ol class="breadcrumbs">

				<li title="원티드 고객센터"><a href="<c:url value='/notice/notice.do'/>">원티드 고객센터</a></li>

				<li title="개인회원">개인회원</li>

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
			<div class="category_view">
				<div class="col-xs-12">
					<h2 class="hc_title">개인회원</h2>
				</div>
				<div class="list-items">

					<div class="section-tree">
						<!-- 나머지 -->

						<section class="section col-md-6 col-sm-6 col-xs-12">
							<div class="section-with-article-block">
								<h3>

									<a
										href="/hc/ko/sections/360007122252-%EC%B6%94%EC%B2%9C%ED%95%98%EA%B8%B0-%EB%B0%9B%EA%B8%B0">추천하기
										∙ 받기</a>
								</h3>

								<ul class="article-list">

									<li class="article"><a
										href="/hc/ko/articles/900004741883-%EC%A7%80%EC%9D%B8%EC%97%90%EA%B2%8C-%EC%B6%94%EC%B2%9C-%EB%B0%9B%EC%95%98%EB%8A%94%EB%8D%B0-%EB%82%B4%EA%B0%80-%EB%B0%9B%EC%9D%80-%EC%B6%94%EC%B2%9C-%EB%AA%A9%EB%A1%9D%EC%97%90-%ED%99%95%EC%9D%B8%EB%90%98%EC%A7%80-%EC%95%8A%EC%95%84%EC%9A%94">지인에게
											추천 받았는데 내가 받은 추천 목록에 확인되지 않아요</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035845111-%EC%B6%94%EC%B2%9C%ED%95%98%EA%B8%B0-%EC%84%9C%EB%B9%84%EC%8A%A4%EB%8A%94-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80%EC%9A%94-">추천하기
											서비스는 무엇인가요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035844051-%EC%9D%B4%EC%9A%A9%EB%B0%A9%EB%B2%95%EA%B3%BC-%EC%B6%94%EC%B2%9C%EC%9D%B8%EC%9D%98-%EC%9E%90%EA%B2%A9%EC%9D%84-%EC%95%8C%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94-">이용방법과
											추천인의 자격을 알고 싶어요.</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035922291-%EC%A7%80%EC%9B%90-%EC%8B%9C-%EC%B6%94%EC%B2%9C%EC%82%AC%EA%B0%80-%EA%BC%AD-%ED%95%84%EC%9A%94%ED%95%9C%EA%B0%80%EC%9A%94-">지원
											시 추천사가 꼭 필요한가요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035565972-%EC%B6%94%EC%B2%9C%EC%9D%B8-%EB%B3%80%EA%B2%BD%EA%B3%BC-%EB%82%B4%EA%B0%80-%ED%95%9C-%EC%B6%94%EC%B2%9C-%EC%88%98%EC%A0%95-%EC%82%AD%EC%A0%9C-%EA%B0%80%EB%8A%A5%ED%95%9C%EA%B0%80%EC%9A%94-">추천인
											변경과 내가 한 추천 수정∙삭제 가능한가요?</a></li>

								</ul>


							</div>
						</section>

						<section class="section col-md-6 col-sm-6 col-xs-12">
							<div class="section-with-article-block">
								<h3>

									<a
										href="/hc/ko/sections/360007632011-%EC%A7%80%EC%9B%90%ED%95%98%EA%B8%B0-%EA%B4%80%EB%A6%AC">지원하기
										∙ 관리</a>
								</h3>

								<ul class="article-list">

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

								</ul>

								<a
									href="<c:url value='/notice/notice_dept2.do'/>"
									class="see-all-articles btn"
									style="background: transparent; color: #3366FF !important; float: left; padding-left: 0px; font-size: 1.1em;">
									+ 모두 보기 </a>


							</div>
						</section>

						<section class="section col-md-6 col-sm-6 col-xs-12">
							<div class="section-with-article-block">
								<h3>

									<a
										href="/hc/ko/sections/360007632031-%EB%A7%A4%EC%B9%98%EC%97%85">매치업</a>
								</h3>

								<ul class="article-list">

									<li class="article"><a
										href="/hc/ko/articles/360035972771-%EB%A7%A4%EC%B9%98%EC%97%85-%EC%84%9C%EB%B9%84%EC%8A%A4%EB%8A%94-%EB%AC%B4%EC%97%87%EC%9D%B8%EA%B0%80%EC%9A%94-">매치업
											서비스는 무엇인가요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035844351-%EB%A7%A4%EC%B9%98%EC%97%85-%EB%A9%94%EB%89%B4-%EB%8B%A8%EA%B3%84%EB%B3%84-%EC%9D%98%EB%AF%B8%EA%B0%80-%EA%B6%81%EA%B8%88%ED%95%B4%EC%9A%94">매치업
											메뉴 단계별 의미가 궁금해요</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035973131-%EB%A7%A4%EC%B9%98%EC%97%85-%EB%A9%B4%EC%A0%91-%EC%A0%9C%EC%95%88-%EC%88%98%EB%9D%BD%EC%9D%80-%EC%96%B8%EC%A0%9C%EA%B9%8C%EC%A7%80-%ED%95%B4%EC%95%BC-%EB%90%98%EB%82%98%EC%9A%94-">매치업
											면접 제안 수락은 언제까지 해야 되나요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/900003828866-%EB%A7%A4%EC%B9%98%EC%97%85-%EC%A0%9C%EC%95%88-%EC%88%98%EB%9D%BD-%EC%9D%B4%ED%9B%84-%EC%A0%84%ED%98%95-%EC%95%88%EB%82%B4%EB%A5%BC-%EB%B0%9B%EC%A7%80-%EB%AA%BB%ED%96%88%EC%8A%B5%EB%8B%88%EB%8B%A4-">매치업
											제안 수락 이후 전형 안내를 받지 못했습니다.</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035614852-%EB%A7%A4%EC%B9%98%EC%97%85-%EC%9D%B4%EB%A0%A5%EC%84%9C-%ED%94%84%EB%A1%9C%ED%95%84-%EB%A5%BC-%EA%B3%B5%EA%B0%9C%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%A7%80-%EC%95%8A%EC%95%84%EC%9A%94">매치업
											이력서(프로필)를 공개하고 싶지 않아요</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360041491911-%EB%A7%A4%EC%B9%98%EC%97%85-%EC%9D%B4%EB%A0%A5%EC%84%9C-%EC%97%B4%EB%9E%8C-%EC%A0%9C%ED%95%9C-%EA%B8%B0%EC%97%85-%EC%84%A4%EC%A0%95%EB%B0%A9%EB%B2%95">매치업
											이력서 열람 제한 기업 설정방법</a></li>

								</ul>


							</div>
						</section>

						<section class="section col-md-6 col-sm-6 col-xs-12">
							<div class="section-with-article-block">
								<h3>

									<a
										href="/hc/ko/sections/360007214611-%EB%B3%B4%EC%83%81%EA%B8%88-%ED%95%A9%EA%B2%A9%EC%9E%90-%EC%9B%B0%EC%BB%B4-%ED%82%A4%ED%8A%B8">보상금
										∙ 합격자 웰컴 키트</a>
								</h3>

								<ul class="article-list">

									<li class="article"><a
										href="/hc/ko/articles/360035844311-%EC%B6%94%EC%B2%9C-%EC%B1%84%EC%9A%A9-%EB%B3%B4%EC%83%81%EA%B8%88%EC%9D%80-%EC%96%B4%EB%96%BB%EA%B2%8C-%EC%A7%80%EA%B8%89%EB%90%98%EB%82%98%EC%9A%94-">추천∙채용
											보상금은 어떻게 지급되나요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035922431-%EC%B6%94%EC%B2%9C%EC%9D%B8-%EC%B6%94%EC%B2%9C%EC%82%AC-%EC%97%86%EC%9D%B4-%ED%95%A9%EA%B2%A9%ED%95%98%EC%85%A8%EC%9D%84-%EA%B2%BD%EC%9A%B0%EC%97%90%EB%8F%84-%EB%B3%B4%EC%83%81%EA%B8%88-%EC%A7%80%EA%B8%89-%EB%8C%80%EC%83%81%EC%9E%85%EB%8B%88%EB%8B%A4-">추천인∙추천사
											없이 합격하셨을 경우에도 보상금 지급 대상입니다.</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035972431-%EB%A7%A4%EC%B9%98%EC%97%85-%EC%A0%9C%EC%95%88%EC%9C%BC%EB%A1%9C-%ED%95%A9%EA%B2%A9%ED%95%98%EC%85%A8%EC%9D%84-%EA%B2%BD%EC%9A%B0%EC%97%90%EB%8F%84-%EB%B3%B4%EC%83%81%EA%B8%88-%EC%A7%80%EA%B8%89-%EB%8C%80%EC%83%81%EC%9E%85%EB%8B%88%EB%8B%A4-">매치업
											제안으로 합격하셨을 경우에도 보상금 지급 대상입니다.</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035972271-%EB%B3%B4%EC%83%81%EA%B8%88-%EC%A7%80%EA%B8%89-%EC%A0%95%EB%B3%B4%EB%A5%BC-%EB%8A%A6%EA%B2%8C-%EC%A0%9C%EC%B6%9C-%ED%96%88%EC%8A%B5%EB%8B%88%EB%8B%A4-%EC%96%B4%EB%96%BB%EA%B2%8C-%EB%90%98%EB%82%98%EC%9A%94-">보상금
											지급 정보를 늦게 제출 했습니다. 어떻게 되나요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035484012-%EC%B5%9C%EC%A2%85-%ED%95%A9%EA%B2%A9-%ED%9B%84-%EB%B3%B4%EC%83%81%EA%B8%88-%EC%A7%80%EA%B8%89%EC%97%90-%EB%8C%80%ED%95%9C-%EC%95%88%EB%82%B4%EB%A5%BC-%EB%AA%BB-%EB%B0%9B%EC%95%98%EC%96%B4%EC%9A%94">최종
											합격 후 보상금 지급에 대한 안내를 못 받았어요</a></li>

									<li class="article"><a
										href="/hc/ko/articles/900001227126-%EB%B3%B4%EC%83%81%EA%B8%88-%EC%A7%80%EA%B8%89-%EB%8C%80%EC%83%81%EC%9E%90%EA%B0%80-%EC%95%84%EB%8B%88%EB%9D%BC%EA%B3%A0-%ED%99%95%EC%9D%B8%EB%90%A9%EB%8B%88%EB%8B%A4">보상금
											지급 대상자가 아니라고 확인됩니다</a></li>

								</ul>

								<a
									href="<c:url value='/notice/notice_dept2.do'/>"
									class="see-all-articles btn"
									style="background: transparent; color: #3366FF !important; float: left; padding-left: 0px; font-size: 1.1em;">
									+ 모두 보기 </a>


							</div>
						</section>

						<section class="section col-md-6 col-sm-6 col-xs-12">
							<div class="section-with-article-block">
								<h3>

									<a
										href="/hc/ko/sections/900000417626-%EC%BB%A4%EB%A6%AC%EC%96%B4-%EC%84%B1%EC%9E%A5">커리어
										성장</a>
								</h3>

								<ul class="article-list">

									<li class="article"><a
										href="/hc/ko/articles/900004960243--%EC%9B%90%ED%8B%B0%EB%93%9C-%EC%97%90%EB%93%80-%EC%A0%95%EB%A7%90-%EA%B8%B0%EC%97%85%EC%97%90-%EC%B6%94%EC%B2%9C%EC%82%AC%EB%A5%BC-%EC%8D%A8%EC%A3%BC%EB%82%98%EC%9A%94-">[원티드
											에듀] 정말 기업에 추천사를 써주나요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/900004960123--%EC%9B%90%ED%8B%B0%EB%93%9C-%EC%97%90%EB%93%80-%EC%A0%95%EB%A7%90-%EC%88%98%EA%B0%95%EB%A3%8C%EB%A5%BC-100-%ED%99%98%EA%B8%89%ED%95%B4%EC%A3%BC%EB%82%98%EC%9A%94-">[원티드
											에듀] 정말 수강료를 100% 환급해주나요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/900002345963-%EA%B5%AC%EB%A7%A4%ED%95%9C-%EC%98%81%EC%83%81-%EB%AA%A9%EB%A1%9D%EC%9D%80-%EC%96%B4%EB%94%94%EC%84%9C-%ED%99%95%EC%9D%B8%ED%95%A0-%EC%88%98-%EC%9E%88%EB%82%98%EC%9A%94-">구매한
											영상 목록은 어디서 확인할 수 있나요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/900001236943-%EA%B2%B0%EC%A0%9C%EC%98%81%EC%88%98%EC%A6%9D%EC%9D%84-%EB%B0%9B%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94">결제영수증을
											받고 싶어요</a></li>

									<li class="article"><a
										href="/hc/ko/articles/900001243923-%EC%B0%B8%EC%84%9D%ED%99%95%EC%9D%B8%EC%A6%9D-%EC%88%98%EB%A3%8C%EC%A6%9D-%EB%B0%9C%EA%B8%89-%EA%B0%80%EB%8A%A5%ED%95%9C%EA%B0%80%EC%9A%94-">참석확인증(수료증)
											발급 가능한가요?</a></li>

								</ul>


							</div>
						</section>

						<section class="section col-md-6 col-sm-6 col-xs-12">
							<div class="section-with-article-block">
								<h3>

									<a
										href="/hc/ko/sections/900000618526-%EC%9B%90%ED%8B%B0%EB%93%9C-%EA%B8%B1%EC%8A%A4">원티드
										긱스</a>
								</h3>

								<ul class="article-list">

									<li class="article"><a
										href="/hc/ko/articles/900004021546-%EA%B3%84%EC%95%BD%EC%A7%81-%EA%B7%BC%EB%AC%B4%EB%82%98-%EC%99%B8%EC%A3%BC-%EC%97%85%EB%AC%B4%EB%8F%84-%EA%B0%80%EB%8A%A5%ED%95%9C%EA%B0%80%EC%9A%94-">계약직
											근무나 외주 업무도 가능한가요?</a></li>

								</ul>


							</div>
						</section>

						<section class="section col-md-6 col-sm-6 col-xs-12">
							<div class="section-with-article-block">
								<h3>

									<a href="/hc/ko/sections/360007122532-%EA%B8%B0%ED%83%80">기타</a>
								</h3>

								<ul class="article-list">

									<li class="article"><a
										href="/hc/ko/articles/900003939866-%EC%B7%A8%EC%97%85%ED%99%9C%EB%8F%99%EC%A6%9D%EB%AA%85%EC%84%9C-%EB%B0%9C%EA%B8%89%EC%9D%80-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%98%EB%82%98%EC%9A%94">취업활동증명서
											발급은 어떻게 하나요</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035617492-%EA%B0%9C%EC%9D%B8%ED%9A%8C%EC%9B%90-%ED%83%88%ED%87%B4%EB%8A%94-%EC%96%B4%EB%96%BB%EA%B2%8C-%ED%95%98%EB%82%98%EC%9A%94-">개인회원
											탈퇴는 어떻게 하나요?</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035616992-%EC%95%84%EC%9D%B4%EB%94%94%EB%A5%BC-%EB%B3%80%EA%B2%BD%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%96%B4%EC%9A%94-">아이디를
											변경하고 싶어요.</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035617152-%EA%B3%84%EC%A0%95-%EB%B9%84%EB%B0%80%EB%B2%88%ED%98%B8%EB%A5%BC-%EC%9E%83%EC%96%B4%EB%B2%84%EB%A0%B8%EC%96%B4%EC%9A%94-">계정
											비밀번호를 잃어버렸어요.</a></li>

									<li class="article"><a
										href="/hc/ko/articles/360035845051-%ED%9C%B4%EB%A9%B4-%EA%B3%84%EC%A0%95%EC%9D%84-%ED%95%B4%EC%A0%9C%ED%95%98%EA%B3%A0-%EC%8B%B6%EC%8A%B5%EB%8B%88%EB%8B%A4-">휴면
											계정을 해제하고 싶습니다.</a></li>

								</ul>


							</div>
						</section>


					</div>

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