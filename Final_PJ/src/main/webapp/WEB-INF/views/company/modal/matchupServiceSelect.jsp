<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 관리자 계정 가입 모달 시작-->
<div class="modal fade docs-example-modal-sm comServJoinMD" tabindex="-1" 
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
			<div class="modal-header modal-comServHeader">
			    <h5 class="modal-title modal-comServTitle" id="comServJoinModalLabel" style="align:center">관리자 계정 만들기</h5>
			    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">×</span>
			    </button>
			</div>
			<div class="container comServModalCon">
				<div class="modal-body">
				    <div class="table-responsive">
				        <div class="container">
			        		<form id="comServJoinForm" name="comServJoinForm" method="post" action="<c:url value='/company/member/join.do'/>">
						        <div class="div-input-onOneLine">
							        <div class="boundDivSpan">
								        <input class="comServ-input input-half" type="text" placeholder="담당자 성함" 
								        	id="comMemName" name="comMemName"/>
								        <span class="alertSpan" id="alertSpanName"></span>
							        </div>
							        <div class="boundDivSpan">
										<input class="comServ-input input-half" type="text" placeholder="직책(or팀)" 
											id="comMemTeam" name="comTeam"/><br>
										<span class="alertSpan" id="alertSpanTeam"></span>
							        </div>
						        </div>
						        <div class="boundDivSpan">
									<input class="comServ-input input-long" type="text" placeholder="연락처"
										id="comMemMobile" name="comMobile"/>
									<span class="alertSpan" id="alertSpanMobile"></span>
						        </div>
								<hr>
								<div class="boundDivSpan">
									<input class="comServ-input input-long" type="text" placeholder="회사 이메일(로그인 아이디로 사용됩니다.)" 
										id="comMemJoinId" name="comMemId"/>
									<span class="alertSpan" id="alertSpanJoinId"></span>
								</div>
								<div class="boundDivSpan">
								<input class="comServ-input input-long" type="password" placeholder="6자리 이상 비밀번호" 
									id="comMemJoinPwd" name="comMemPwd"/>
								<span class="alertSpan" id="alertSpanJoinPwd"></span>
								</div>
			        		</form>
			      		</div>
			        </div>
			    </div>
			</div>
			<div class="modal-footer comServJoinModalFooter">
				<div class="container comServModalFooterCon">
				    <button class="btn btn-primary comServSubmitBtn" id="comServjoinSubmitBtn" type="submit">관리자 계정 생성</button>
				    <span class="comServ-joinAgree">회원가입시 <a class="comServ-joinProvsLink" href="#">개인정보 처리방침</a>을 읽었으며,
				    	<br><a class="comServ-joinProvsLink" href="#">이용약관</a>에 동의하신 것으로 간주합니다.</span>
				    <hr>
				    <span>이미 가입되어 있으신가요? </span><a class="comServ-joinProvsLink" href="#">로그인하기</a>
				</div>
			</div>
		</div>
	</div>
</div>