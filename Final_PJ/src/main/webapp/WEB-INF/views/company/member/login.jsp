<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
//얘를 company_top.에 인클루드 할거야 
//모달팝업 자체만 있으면 됨


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">관리자 계정 로그인</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <input type="text" placeholder="회사 이메일(로그인 아이디로 사용됩니다.)"/>
        <input type="password" placeholder="비밀번호">
        <input type="submit" value="로그인">
        <a href="#">비밀번호 초기화/변경</a>
      </div>
      <div class="modal-footer">
       <span>계정이 없으신가요?</span><a href="#">관리자 계정 만들기</a>
      </div>
    </div>
  </div>
</div>
