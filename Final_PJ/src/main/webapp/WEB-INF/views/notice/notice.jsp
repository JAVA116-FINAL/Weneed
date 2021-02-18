<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="notice_inc/notice_top.jsp"%>
<%@include file="notice_inc/notice_script.jsp" %>

<main role="main">
	<section class="hero-unit text-center hero-image ">
		<div class="container">
			<h1 class="help-center-name" id="help_center_title1">위니드에 대해</h1>
			<h1 class="help-center-name" id="help_center_title2">궁금한 점을 검색해주세요.</h1>
			<p class="help-center-details"></p>
			<div class="hc_search">
				<!-- 검색 폼 -->
				<form role="search" class="search" data-search=""
					data-instant="true" autocomplete="off" action="<c:url value='notice_search.do'/>"
					accept-charset="UTF-8" method="get">
					<input
						type="search" name="searchKeyword" id="notice_search"
						placeholder="예) 서비스 이용방법, 비밀번호 찾기 등" autocomplete="off"
						aria-label="예) 서비스 이용방법, 비밀번호 찾기 등"> 
					<input type="submit" id="commit" name="commit" value="검색">
				</form>
				
			</div>
		</div>
	</section>
	<section class="home-category-blocks padding"
		style="padding-bottom: 0px;">
		<div class="container" style="padding-left: 0px; padding-right: 0px;">
			<div class="row">
				<div class="col-sm-12 col-xs-12 col-md-12" id="main_categorie_div">
					<ul class="category-list navigator text-center" id="with-id"
						style="">
						<li id="360001834352" class="col-sm-6" style="border-radius: 5px;">
							<a href="<c:url value='/notice/notice_dept1.do?notice_dept1=1'/>" class="main-cat-li"> <span class="category-icon"></span>
								<h3 class="mainct-inner">개인회원</h3>
								<p>개인회원을 위한 이용 안내입니다.</p>
							</a>
						</li>
						<li id="360001832811" class="col-sm-6" style="border-radius: 5px;">
							<a href="<c:url value='/notice/notice_dept1.do?notice_dept1=2'/>" class="main-cat-li"> <span class="category-icon"></span>
								<h3 class="mainct-inner">기업회원</h3>
								<p>기업회원을 위한 이용 안내입니다.</p>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
	</section>
	<section class="home-category-blocks padding">
		<div class="container" style="padding-left: 0px; padding-right: 0px;">
			<div class="category_view">
				<div class="col-sm-6">
					<section class="articles">
						<h3>개인회원 자주 묻는 질문</h3>
						<ul class="article-list">
							<c:forEach var="map" items="${listMain1 }">
								<li class="promoted-articles-item">
									<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
										${map['NOTICE_TITLE'] }
									</a>
								</li>
							</c:forEach>
							
						</ul>
						<a
							href="<c:url value='/notice/notice_dept1.do?notice_dept1=1'/>"
								class="see-all-articles btn" style="font-size: 1.1em;">
								+ 모두 보기 
						</a> <br><br>
					</section>
				</div>
				<div class="col-sm-6">
					<section class="articles">
						<h3>기업회원 자주 묻는 질문</h3>
						<ul class="article-list">
							<c:forEach var="map" items="${listMain2 }">
								<li class="promoted-articles-item">
									<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
										${map['NOTICE_TITLE'] }
									</a>
								</li>
							</c:forEach>
						</ul>
							<a href="<c:url value='/notice/notice_dept1.do?notice_dept1=2'/>" 
								class="see-all-articles btn" style="font-size: 1.1em;">
							 + 모두 보기 
							</a> <br><br>
					</section>
				</div>
			</div>
		</div>
	</section>

<!-- 원티드 소식 -->
	<div class="container">
		<div class="row">
			<div class="category_view">
				<div class="col-xs-12">
					<h2 class="hc_title" style="float: left;">위니드 소식</h2>
					<h6 class="hc_title_more" style="float: right; margin-top: 25px;">
						<a style="font-size: 14px;"
							href="<c:url value='/notice/notice_dept1.do?notice_dept1=3'/>">
							더보기
						</a>
					</h6>
					<p class="description"></p>
				</div>
				<div class="list-items">

					<div class="section-tree">

						<section class="section col-md-12 col-sm-12 col-xs-12">
							<div class="section-with-article-block"
								id="Notice_Promoted_Article_DIV">
								<ul class="article-list promoted-noticeList"
									id="Notice_Promoted_Article_UL">
									<!-- 원티드 소식 상위 n건 출력 (반복)-->
									<c:forEach var="map" items="${listMain3 }">
										<li class="promoted-articles-item"
											style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
											<a href="<c:url value='/notice/notice_detail.do?notice_no=${map["NOTICE_NO"] }'/>">
												<font>${map['NOTICE_TITLE'] }</font>
												<font style="float: right;"></font>
											</a>
										</li>
									</c:forEach>
								</ul>
							</div>
						</section>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- 서비스 소개 div -->
	<div class="container" id="service_info_div_con">
		<div class="row">
			<div class="category_view">
				<div class="col-xs-12">
					<h2 class="hc_title">서비스 소개</h2>
					<div class="row text-center" id="ser_inc_div">
						<div class="col-lg-3 col-md-6"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="card h-100">
								<a href="<c:url value='/career/Mainpage/careerMain.do'/>">
									<div class="card-body"
										style="border: transparent; padding: 0px;">
										<img class="card-img-top"
											src="//theme.zdassets.com/theme_assets/9309779/55e4b007832b7286ad1a812e5656cbaeef245408.jpg"
											alt=""
											style="width: 100%; border-top-left-radius: 5px; border-top-right-radius: 5px;">
									</div>
									<div class="card-body">
										<h4 class="card-title">이벤트</h4>
									</div>
								</a>
							</div>
						</div>

						<div class="col-lg-3 col-md-6"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="card h-100">
								<a href="<c:url value='/matchupMem/matchupMemIntro.do'/>">
									<div class="card-body"
										style="border: transparent; padding: 0px;">
										<img class="card-img-top"
											src="//theme.zdassets.com/theme_assets/9309779/1e0e201392c85f0902bab24eb9d2fcdb6d288afc.jpg"
											alt=""
											style="width: 100%; border-top-left-radius: 5px; border-top-right-radius: 5px;">
									</div>
									<div class="card-body">
										<h4 class="card-title">매치업</h4>
									</div>
								</a>
							</div>
						</div>

						<div class="col-lg-3 col-md-6"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="card h-100">
								<a href="<c:url value='/notice/notice_detail.do?notice_no=113'/>">
									<div class="card-body"
										style="border: transparent; padding: 0px;">
										<img class="card-img-top"
											src="//theme.zdassets.com/theme_assets/9309779/526de96e78df31e88c1ce43a7dcbcd01ad7f3f0e.jpg"
											alt=""
											style="width: 100%; border-top-left-radius: 5px; border-top-right-radius: 5px;">
									</div>
									<div class="card-body">
										<h4 class="card-title">채용광고</h4>
									</div>
								</a>
							</div>
						</div>

						<div class="col-lg-3 col-md-6"
							style="padding-left: 0px; padding-right: 0px;">
							<div class="card h-100">
								<a href="<c:url value='/notice/notice_detail.do?notice_no=102'/>">
									<div class="card-body"
										style="border: transparent; padding: 0px;">
										<img class="card-img-top"
											src="//theme.zdassets.com/theme_assets/9309779/a6a42b843115a314594f267d42120b667e0d45e9.jpg"
											alt=""
											style="width: 100%; border-top-left-radius: 5px; border-top-right-radius: 5px;">
									</div>
									<div class="card-body">
										<h4 class="card-title">고객센터 운영시간 안내</h4>
									</div>
								</a>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="notice_inc/notice_bottom.jsp"%>