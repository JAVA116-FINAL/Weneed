<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="wantedProposalMD" class="modal fade docs-example-modal-sm wantedProposalMD" tabindex="-1" 
	role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
			<div class="modal-header modal-comServHeader">
			    <h5 class="modal-title modal-comServTitle" id="wantedProposalMDLabel" style="align:center">제안하기</h5>
			    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
			        <span aria-hidden="true">×</span>
			    </button>
			</div>
			<div class="container comServModalCon">
				<div class="modal-body">
				    <div class="table-responsive">
							<div class="container">
								<div class="propo-boundDiv">
					        		<label class="propo-block">제안 메시지</label>
									<textarea class="propo-block" rows="4" style="width:400px;"></textarea>
								</div>
								<div class="propo-boundDiv propo-boundDivFlex">
									<div style="margin-right:20px;">
										<label class="propo-block">직급</label>
										<input class="propo-block propo-shortInput" type="text">
									</div>
									<div>
										<label class="propo-block">연봉<span style="font-weight: normal;"> (단위: 만 원)</span></label>
										<div>
											<input class="propo-shortInput" type="text"> ~ <input class="propo-shortInput" type="text">
										</div>
									</div>
								</div>
								<div class="propo-boundDiv">
									<div>
										<label>포지션 선택</label>
										<span class="propo-posGuide">*포지션 선택 시 지원자가 해당 포지션으로 이동합니다.</span>
									</div>
									<select class="propo-block propo-longInput">
										<option>선택</option>
									</select>
								</div>
								<div class="propo-boundDiv">
									<label class="propo-block">근무 지역</label>
									<input class="propo-block propo-longInput" type="text">
								</div>
								<div class="propo-boundDiv">
									<label class="propo-block">스톡옵션 여부</label>
									<input class="propo-block propo-longInput" type="text">
								</div>
							</div>
			        </div>
			    </div>
			</div>
			<div class="modal-footer comServJoinModalFooter">
				<div class="container comServModalFooterCon">
				    <button class="btn btn-primary comServSubmitBtn" id="comServjoinSubmitBtn" type="submit">보내기</button>
				</div>
			</div>
		</div>
	</div>
</div>