<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../notice_inc/notice_top.jsp"%>

<!-- Slider Start -->
<section class="banner_n">
<div class="container_n">
      	<h1 class="help-center-name" id="help_center_title">원티드에 대해 궁금한 점을 검색해주세요.</h1>
        <p class="help-center-details"></p>
        <div class="hc_search">
            <form role="search" class="search" data-search="" data-instant="true" autocomplete="off" action="/hc/ko/search" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="✓"><input type="search" name="query" id="query" placeholder="예) 서비스 이용방법, 비밀번호 찾기 등" autocomplete="off" aria-label="예) 서비스 이용방법, 비밀번호 찾기 등">
				<input type="submit" name="commit" value="검색"></form>
        </div>
    </div>
</section>
<section class="home-category-blocks padding" style="padding-bottom: 0px;">
    <div class="container" style="padding-left: 0px;padding-right: 0px;">
        <div class="row">
            <div class="col-sm-12 col-xs-12 col-md-12" id="main_categorie_div">
                <ul class="category-list navigator text-center" id="with-id" style="">
                    <li id="360001834352" class="col-sm-6" style="border-radius:5px;">
                        <a href="#" class="main-cat-li">
                            <span class="category-icon"></span>
                            <h3 class="mainct-inner">개인회원</h3>
                            <p> 개인회원을 위한 이용 안내입니다.</p>
                        </a>
                    </li>
                    <li id="360001832811" class="col-sm-6" style="border-radius:5px;">
                        <a href="#" class="main-cat-li">
                            <span class="category-icon"></span>
                            <h3 class="mainct-inner">기업회원</h3>
                            <p>  기업회원을 위한 이용 안내입니다.</p>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>

<!-- 자주 묻는 질문 -->
<section class="home-category-blocks padding">
	<div class="container" style="padding-left: 0px; padding-right: 0px;">
		<div class="category_view">
			<div class="col-sm-6">
				<section class="articles">
					<h3 style="font-weight: 600;">개인회원 자주 묻는 질문</h3>
					<ul class="article-list">
						<li class="promoted-articles-item">
							<a href="#">
								지원한 회사에서 피드백이 없습니다. 어떻게 하면 되나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								추천∙채용 보상금은 어떻게 지급되나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								[원티드 에듀] 정말 기업에 추천사를 써주나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								[원티드 에듀] 정말 수강료를 100% 환급해주나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								구매한 영상 목록은 어디서 확인할 수 있나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								계약직 근무나 외주 업무도 가능한가요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								취업활동증명서 발급은 어떻게 하나요
							</a>
						</li>
					</ul>
					<a href="#" class="see-all-articles btn" style="font-size: 1.1em;">
					 	+ 모두 보기 
					</a> <br><br>
				</section>
			</div>

			<div class="col-sm-6">
				<section class="articles">
					<h3 style="font-weight: 600;">기업회원 자주 묻는 질문</h3>
					<ul class="article-list">
						<li class="promoted-articles-item">
							<a href="#">
								기업 서비스 가입, 이용 절차가 궁금합니다.
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								매치업 기업 서비스를 이용하고 싶어요.
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								등록된 기업회원 회사 정보는 어디에 노출되나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								포지션(공고문)등록 방법이 궁금합니다.
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								최종 합격 처리 후, 채용 수수료 정산은 어떻게 하나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								서류 검토 시, 실수로 서류탈락 처리를 했습니다. 어떻게 복원하나요?
							</a>
						</li>
						<li class="promoted-articles-item">
							<a href="#">
								단기 계약직 혹은 프리랜서 채용도 가능한가요?
							</a>
						</li>
					</ul>
					<a href="#" class="see-all-articles btn" style="font-size: 1.1em;">
					 	+ 모두 보기 
					</a> <br><br>
				</section>
			</div>

		</div>
	</div>
</section>
<br><br><br>
<!-- 원티드 소식 -->
<div class="container" id="container_n">
	<div class="row">
		<div class="category_view">
			<div class="col-xs-12">
				<h2 class="hc_title" style="float: left;">원티드 소식</h2>
				<h6 class="hc_title_more" style="float: right; margin-top: 25px;">
					<a style="font-size: 14px; color:black;" href="#">더보기</a>
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


								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>개인정보 처리방침 개정에 대해 안내드립니다. (2020.11.30)</font> <font
										style="float: right;">
									</font>
								</a>
								</li>


								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>당신이 찾던 개발자, 디자이너가 여기에! "원티드 긱스"</font> <font
										style="float: right;">
									</font>
								</a>
								</li>


								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>고객센터 운영시간 안내</font> <font style="float: right;">
									</font>
								</a>
								</li>


								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>HR커뮤니티 "인살롱" 오픈!</font> <font style="float: right;">
									</font>
								</a>
								</li>

								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>내 취향에 딱 맞는 회사 찾기｜원티드 태그검색</font> <font
										style="float: right;">
									</font>
								</a>
								</li>
								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>Wanted Plus - 직군별 최고의 교육을 모두 한 곳에서</font> <font
										style="float: right;">
									</font>
								</a>
								</li>
								<!--문서승격처리-->
								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>원티드에서, 호스트를 Wanted! - 힙한 콘텐츠 원티드와 함께 세상밖으로!</font> <font
										style="float: right;">
									</font>
								</a>
								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>원티드 북클럽 클럽장 모집</font> <font style="float: right;">
									</font>
								</a>
								</li>

								<li class="promoted-articles-item"
									style="padding-left: 22px; padding-right: 22px; padding-top: 10px; padding-bottom: 10px;">
									<a
									href="#">
										<font>원티드 북클럽 - 좋은 책을 꾸준히 읽어가면서 좋은 사람들과 교류해보세요</font> <font
										style="float: right;">
									</font>
								</a>
								</li>
							</ul>
						</div>
					</section>
				</div>

			</div>
		</div>
	</div>
</div>
<!-- 서비스 소개 -->
<div class="container" id="service_info_div_con">
    <div class="row">
        <div class="category_view">
            <div class="col-xs-12">
                <h2 class="hc_title">서비스 소개</h2>
                <div class="row text-center" id="ser_inc_div">
                    <div class="col-lg-3 col-md-6" style="padding-left: 0px;padding-right: 0px;">
                        <div class="card h-100">
                            <a href="#">
                                <div class="card-body" style="border:transparent;padding: 0px;">
                                    <img class="card-img-top" src="//theme.zdassets.com/theme_assets/9309779/55e4b007832b7286ad1a812e5656cbaeef245408.jpg" alt="" style="width:100%;border-top-left-radius: 5px;border-top-right-radius: 5px;">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">이벤트</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6" style="padding-left: 0px;padding-right: 0px;">
                        <div class="card h-100">
                            <a href="#">
                                <div class="card-body" style="border:transparent;padding: 0px;">
                                    <img class="card-img-top" src="//theme.zdassets.com/theme_assets/9309779/1e0e201392c85f0902bab24eb9d2fcdb6d288afc.jpg" alt="" style="width:100%;border-top-left-radius: 5px;border-top-right-radius: 5px;">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">매치업</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6" style="padding-left: 0px;padding-right: 0px;">
                        <div class="card h-100">
                            <a href="#">
                                <div class="card-body" style="border:transparent;padding: 0px;">
                                    <img class="card-img-top" src="//theme.zdassets.com/theme_assets/9309779/526de96e78df31e88c1ce43a7dcbcd01ad7f3f0e.jpg" alt="" style="width:100%;border-top-left-radius: 5px;border-top-right-radius: 5px;">
                                </div>
                                <div class="card-body">
                                    <h4 class="card-title">채용광고</h4>
                                </div>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6" style="padding-left: 0px;padding-right: 0px;">
                        <div class="card h-100">
							<a href="#">
                                <div class="card-body" style="border:transparent;padding: 0px;">
                                    <img class="card-img-top" src="//theme.zdassets.com/theme_assets/9309779/a6a42b843115a314594f267d42120b667e0d45e9.jpg" alt="" style="width:100%;border-top-left-radius: 5px;border-top-right-radius: 5px;">
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
<%@ include file="../notice_inc/notice_bottom.jsp"%>