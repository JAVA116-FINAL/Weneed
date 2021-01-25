<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="modal fade docs-example-modal-sm wantedResumeDetailMD" tabindex="-1" 
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
			<div class="modal-header modal-comServHeader">
			    <h5 class="modal-title modal-comServTitle" id="wantedProposalMDLabel" style="align:center">이력서 상세보기</h5>
			    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">×</span>
			    </button>
			</div>
			<div class="container comServModalCon">
				<div class="modal-body">
				    <div class="table-responsive">
				        <div class="container">
				        	<div> <!-- 최상단 이름, 다운로드, 찜버튼 -->
				        		<span>손 OO</span>
				        		<button><i class="far fa-save"></i></button>
				        		<button><i class="fas fa-star"></i></button>
			        		</div>
			        		<div>
			        			<span>이메일</span>
			        			<span>연락처</span>
			        			<div>
			        				<span>후보자가 제안을 수락할 경우 이름과 이메일, 연락처를 확인할 수 있습니다.</span>
			        			</div>
			        		</div>
			        		<label>제안 메시지</label>
							<textarea rows="4" cols="30"></textarea>
							<div class="container">
								<div>
									<label>직급</label>
									<input type="text">
								</div>
								<div>
									<label>연봉</label>
									<input type="text">~<input type="text">
								</div>
								<div>
									<label>포지션 선택</label><span>*포지션을 선택해서 제안을 보내면, 해당 포지션의 목록으로 이동합니다.</span>
									<select>
										<option>선택</option>
									</select>
								</div>
								<div>
									<label>근무 지역</label>
									<input type="text">
								</div>
								<div>
									<label>스톡옵션 여부</label>
									<input type="text">
								</div>
								<div>
									<input type="submit" value="보내기">
								</div>
							</div>
			      		</div>
			        </div>
			    </div>
			</div>
			<div class="modal-footer comServJoinModalFooter">
				<div class="container comServModalFooterCon">
				    <button class="btn btn-primary comServSubmitBtn" id="comServjoinSubmitBtn" type="submit">상태변경하기</button>
				</div>
			</div>
		</div>
	</div>
</div>