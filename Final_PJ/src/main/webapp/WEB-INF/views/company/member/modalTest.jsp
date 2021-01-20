<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../inc/top.jsp" %>
	<div id="root">
		<button type="button" id="modal_open_btn" data-toggle="modal" data-target=".docs-example-modal-sm">모달 창 열기</button>
		<div class="modal fade docs-example-modal-sm " tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true" >
						  <div class="modal-dialog" style="padding-left:45px; top:2%;">
						    <div class="modal-content" style="width:400px; overflow-y:auto;">
						      <div class="modal-header gaeun-modal-header">
						        <h5 class="modal-title h6 modal-wanted-title" id="mySmallModalLabel"><img src="${pageContext.request.contextPath}/resources/images/wantedLogo.png" alt="" class="img-fluid modalLogin-logo"></h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="outline:none;">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body gaeun-modal-body" style="height: calc(100vh - 130px);overflow-y: auto;border-bottom-left-radius:.3rem;border-bottom-right-radius:.3rem;">
						        <div class="gaeun-modal-body-con1">
						        	<h1>직장인을 위한<br>커리어 플랫폼, 원티드!</h1>
						        	<h2>커리어 성장과 행복을 위한 여정<br>지금 원티드에서 시작하세요.</h2>
						        </div>
						      </div>
						    </div>
						  </div>
		</div> 
	</div>


<%@ include file="../../inc/bottom.jsp" %>