<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- histoty Modal-->
<div class="container">
	<div class="modal-header">
	    <h5 class="modal-title" id="historyModalLabel" style="align:center">관리자 계정 만들기</h5>
	    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
	        <span aria-hidden="true">×</span>
	    </button>
	</div>
	<div class="modal-body">
	    <div class="table-responsive">
	        <div class="container">
	        	<div class="modal-body">
			        <input type="text" placeholder="담당자 성함" name="comMemName"/>
					<input type="text" placeholder="직책(or팀)" name="comMem"/><br>
					<input type="text" placeholder="연락처" name="comMemMobile"/>
					<hr>
					<input type="text" placeholder="회사 이메일(로그인 아이디로 사용됩니다.)" name="comMemEmail"/>
					<input type="text" placeholder="6자리 이상 비밀번호" name="comMemPwd"/>
	      		</div>
	        </div>
	    </div>
	</div>
</div>
<div class="modal-footer">
    <button class="btn btn-primary" type="submit" data-dismiss="modal">관리자 계정 등록하기</button>
</div>
	