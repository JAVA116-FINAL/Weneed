<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp"%>
<jsp:useBean id="now" class="java.util.Date" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/companyService/applicants.css'/>">
<style>
.btn-statusChange1 {
	border: 1px solid;
	font-size: 15px;
	font-weight: bold;
	padding: 10px 30px;
	margin-right: 10px;
	border-radius: 3px;
	margin: 20px 0px 10px 30px;
	float: right;
	outline: none;
	background-color: #2d89cc;
	color: white;
}
 
.btn-statusChange2 {
	border: 1px solid;
	font-size: 15px;
	font-weight: bold;
	padding: 10px 30px;
	margin-right: 10px;
	border-radius: 3px;
	margin: 20px 0px 10px 30px;
	float: right;
	outline: none;
	background-color: #888888;
	color: white;
}
</style>
<script type="text/javascript">
	
</script>
<body>
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
									<a href='<c:url value="/company/applicants.do?statusFlag=0&posNo=${pList.posNo}"/>'> 
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
					<!-- 포지션 > 서류통과 -->
					<div style="margin-bottom: 10px; padding-left: 3px">
						<!-- 클릭한 포지션, 상태 값 받아오기 -->
						<div>
							<h2 class="appli-notiGuide">
								<c:out value="${aVo.posName }"></c:out>
								>
								<c:if test="${aVo.statusFlag==0 }">미정</c:if>
								<c:if test="${aVo.statusFlag==1 }">서류 합격</c:if>
								<c:if test="${aVo.statusFlag==2 }">최종합격</c:if>
								<c:if test="${aVo.statusFlag==3 }">불합격</c:if>
								<c:if test="${aVo.statusFlag==4 }">기간만료</c:if>
								<h2>
						</div>
					</div>


					<div>
						<div class="appli-list-object" style="padding: 10px 20px">
							<div class="appli-list-object_info">
								<div class="appli-list-object_infoResume appli-object-ele">
									<div>
										<p class="appli-name-posJikgun">지원자</p>
									</div>
								</div>
							</div>
							<div>
								<i class="fas fa-star appli-object-ele appli-object-ele_gold"
									id="favo" +
	${aVo.applyNo} onclick="favoFunc()"></i>
							</div>
						</div>


						<!-- 정보 조회성 영역 -->
						<div class="appli-responseInfo" style="margin-bottom: 0px;">
							<div class="appli-responseInfo_obj" style="display: flex;">
								<span class="appli-span-allResponse"></span>&nbsp; <i
									class="appli-list-object_detailResumeImg fas fa-user"></i>&nbsp;
								<strong class="appli-bigNumber-blue"
									style="margin-top: 21px; margin-left: 8px;"><c:out
										value="${aVo.applyName }"></c:out> </strong>
							</div>
						</div>


						<!-- 타임라인 -->
						<div class="appli-list-object" style="padding: 10px 20px">
							<div class="appli-list-object_info">
								<div class="appli-list-object_infoResume appli-object-ele">
									<div>
										<p class="appli-name-posJikgun" style="color: #c1c1c1">타임라인</p>
										<p class="appli-name-posJikgun">
											<fmt:formatDate value="${aVo.applyRegdate }"
												pattern="yyyy-MM-dd HH:mm:ss" var="applyRegdate" />
											지원 :
											<c:out value="${applyRegdate }"></c:out>
										</p>
										<c:if test="${!empty aVo.docPassRegdate}">
											<p class="appli-name-posJikgun">
												<fmt:formatDate value="${aVo.docPassRegdate }"
													pattern="yyyy-MM-dd HH:mm:ss" var="docPassRegdate" />
												서류통과 :
												<c:out value="${docPassRegdate }"></c:out>
											</p>
										</c:if>
										<c:if test="${!empty aVo.passRegdate}">
											<p class="appli-name-posJikgun">
												<fmt:formatDate value="${aVo.passRegdate }"
													pattern="yyyy-MM-dd HH:mm:ss" var="passRegdate" />
												최종합격 :
												<c:out value="${passRegdate }"></c:out>
											</p>
										</c:if>
										<c:if test="${!empty aVo.regectRegdate}">
											<p class="appli-name-posJikgun">
												<fmt:formatDate value="${aVo.regectRegdate }"
													pattern="yyyy-MM-dd HH:mm:ss" var="regectRegdate" />
												불합격 :
												<c:out value="${regectRegdate }"></c:out>
											</p>
										</c:if>
									</div>
								</div>
							</div>
							<!-- <div>
								<div>
									<p class="appli-name-posJikgun">타임라인</p>
								</div>
							</div> -->
						</div>

						<div>
							<p class="appli-notiGuide" style="visibility: hidden;">지원자에게
								15일 안에 합격/불합격 소식을 알려주세요. 좋은 후보자는 여러 곳에서 제안을 받습니다. 타이밍을 놓치지 마세요.</p>
						</div>
					</div>




					<!-- 추천인 -->
					<div>
						<div class="appli-list-object" style="padding: 10px 20px">
							<div class="appli-list-object_info">
								<div class="appli-list-object_infoResume appli-object-ele">
									<div>
										<p class="appli-name-posJikgun">추천인</p>
									</div>
								</div>
							</div>
						</div>

						<c:if test="${empty aVo.refName}">
							<div class="appli-list-object-none">
								<p>추천인이 없습니다.</p>
							</div>
						</c:if>

						<c:if test="${!empty aVo.refName }">
							<div class="appli-responseInfo" style="margin-bottom: 0px;">
								<div class="appli-responseInfo_obj" style="display: flex;">
									<span class="appli-span-allResponse"
										style="visibility: hidden;"></span>&nbsp; <i
										class="appli-list-object_detailResumeImg fas fa-user"></i>&nbsp;
									<strong class="appli-bigNumber-blue"
										style="margin-top: 21px; margin-left: 8px;"><c:out
											value="${aVo.refName }"></c:out> </strong>
								</div>
							</div>

							<div>
								<p class="appli-notiGuide" style="visibility: hidden;">지원자에게
									15일 안에 합격/불합격 소식을 알려주세요. 좋은 후보자는 여러 곳에서 제안을 받습니다. 타이밍을 놓치지 마세요.</p>
							</div>
						</c:if>
					</div>

					<!-- 이력서.포트폴리오 -->
					<div style="margin-top: 10px">
						<div class="appli-list-object" style="padding: 10px 20px">
							<div class="appli-list-object_info">
								<div class="appli-list-object_infoResume appli-object-ele">
									<div>
										<p class="appli-name-posJikgun">이력서 & 포트폴리오</p>
									</div>
								</div>
							</div>
						</div>

						<c:if test="${aVo.resumeUpfileflag eq 'N' }">
							<div class="appli-list-object-none">
								<p>첨부 파일이 없습니다.</p>
							</div>
						</c:if>

						<c:if test="${aVo.resumeUpfileflag eq 'Y' }">
							<div class="appli-responseInfo"
								style="margin-bottom: 0px; padding: 5px 0px 10px 10px; height: 65px;">
								<div class="appli-responseInfo_obj"
									style="display: flex; width: 70%; padding: 0px 10px; align-items: center; border: 1px solid #c1c1c1; margin-left: 10px;">
									<span class="rFileName_jy"> <a
										href="<c:url value='/resume/resumeFileDown.do?resumeNo=${aVo.resumeNo}&resumeFile=${aVo.resumeFile}'/>">
											${aVo.resumeTitle} <span class="RWName">
												<h3>
													<input type="text" name="resumeTitle" style="display: none"
														id="resumeTitleEdit_jy" +${aVo.resumeNo}
														readonly="readonly" value="${aVo.resumeTitle}"
														class="nameEdit_jy"></input> <input type="hidden"
														name="resumeNo" id="resumeNo_jy" value="${aVo.resumeNo}"></input>
												</h3>
										</span>
									</a>
									</span>
								</div>
							</div>
						</c:if>
					</div>
					<div style="margin-bottom: 10px; padding-left: 3px">
						
						<form name="frmEdit" method="post"
							action="<c:url value='/company/applicantsDetail.do'/>">
							
							<input type="hidden" name="applyNo" value="${param.applyNo }">
							<input type="hidden" name="statusFlag" >
								<script>
										function statusFunc(statusflag) {
											$('input[name=statusFlag]').val(statusflag);
											$('form[name=frmEdit]').submit();
										}
								</script>
								
							<!-- 미정일 때는, 서류합격/불합격 -->
							<c:if test="${aVo.statusFlag==0 }">
								<button onclick="statusFunc(${1})" class="btn-statusChange1" style="outline: none;" id="DocPassBtn">
									서류 합격</button>
								<button onclick="statusFunc(${3})" class="btn-statusChange2" style="outline: none;">
									불합격</button>
							</c:if>

							<!-- 서류합격일 때는, 최종합격/불합격 -->
							<c:if test="${aVo.statusFlag==1 }">
								<button onclick="statusFunc(${2})" class="btn-statusChange1" style="outline: none;" id="DocPassBtn">
									최종 합격</button>
								<button onclick="statusFunc(${3})" class="btn-statusChange2" style="outline: none;">
									불합격</button>
							</c:if>

							<!-- 불합격/최종합격/기간만료에는, 버튼 비활성화 -->
							<c:if test="${aVo.statusFlag==3 || aVo.statusFlag==4}">
								<a href='<c:url value='/company/applicants.do'/>'
									class="btn-statusChange1" style="outline: none;"> 목록으로</a>
							</c:if>
						</form>

					</div>

				</section>
			</div>
		</div>
	</div>
</body>
</html>
<%@ include file="../inc/bottom.jsp"%>