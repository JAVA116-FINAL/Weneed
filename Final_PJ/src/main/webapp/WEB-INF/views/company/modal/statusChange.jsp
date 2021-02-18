<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>

<div class="modal fade docs-example-modal-sm comServAppliStatusChangeMD"
	tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header modal-comServHeader">
				<h5 class="modal-title modal-comServTitle"
					id="comServJoinModalLabel" style="align: center">지원자 상태변경</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="container comServModalCon">
				<div class="modal-body">
					<div class="table-responsive">
						<div class="container">
							<span>선택한 지원자를 </span> 
							<select name="modalStatus"
								id="modalStatus">
								<option value="1">서류합격</option>
								<option value="2">최종합격</option>
								<option value="3">불합격</option>
							</select> <span>으로 상태변경 하시겠습니까?</span>
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer comServJoinModalFooter">
				<div class="container comServModalFooterCon">
					<form action="<c:url value='/company/sendStatus.do'/>"
						  name="frmPage" method="post"> 
						<input type="text" name="statusFlag" style="display: none;">
						<button class="btn btn-primary comServSubmitBtn"
							id="comServjoinSubmitBtn" type="submit">상태변경하기</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		$(function() {
			var status = $('#modalStatus option:selected').val();
			
			$("#modalStatus").change(function(){
				status = $(this).val();
				$('input[name=statusFlag]').val(status);
			});

			$('input[name=statusFlag]').val(status);
		});
	</script>
</div>