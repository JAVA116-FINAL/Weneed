<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
$(function(){
	$('#comServProposalSubmitBtn').click(function(){
		//유효성 검사 해주자 
		
		//직급, 최소연봉, 최대연봉, 근무지역, 스톡옵션여부
		
		$('form[name=proposalForm]').submit();
	});
});
</script>
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
						<form action="<c:url value='/company/sendProposal.do'/>" method="post" name="proposalForm">
							<input type="text" name="resumeNo" value="">
							<input type="text" name="comCode" value="${sessionScope.comInfoVo.comCode}">
							<div class="propo-boundDiv">
				        		<label class="propo-block">제안 메시지</label>
								<textarea name="proposalMessage" class="propo-block" rows="4" style="width:400px;"></textarea>
							</div>
							<div class="propo-boundDiv propo-boundDivFlex">
								<div style="margin-right:20px;">
									<label class="propo-block">직급</label>
									<input name="jobTitle" class="propo-block propo-shortInput" type="text">
								</div>
								<div>
									<label class="propo-block">연봉<span style="font-weight: normal;"> (단위: 만 원)</span></label>
									<div>
										<input name="minSalary" class="propo-shortInput" type="text">
										 ~ <input name="maxSalary" class="propo-shortInput" type="text">
									</div>
								</div>
							</div>
							<div class="propo-boundDiv">
								<div>
									<label>포지션 선택</label>
									<span class="propo-posGuide">*포지션 선택 시 지원자가 해당 포지션으로 이동합니다.</span>
								</div>
								<select name="posNo" class="propo-block propo-longInput">
								<c:forEach var="posVo" items="${posList}">
									<option value="${posVo.posNo}">${posVo.posName}</option>
								</c:forEach>
								</select>
							</div>
							<div class="propo-boundDiv">
								<label class="propo-block">근무 지역</label>
								<input name="region" class="propo-block propo-longInput" type="text">
							</div>
							<div class="propo-boundDiv">
								<label class="propo-block">스톡옵션 여부</label>
								<input name="stockOption" class="propo-block propo-longInput" type="text">
							</div>
						</form>
						</div>
			        </div>
			    </div>
			</div>
			<div class="modal-footer comServProposalModalFooter">
				<div class="container comServProposalModalFooter">
				    <button class="btn btn-primary comServSubmitBtn" id="comServProposalSubmitBtn" type="submit">제안 보내기</button>
				</div>
			</div>
		</div>
	</div>
</div>