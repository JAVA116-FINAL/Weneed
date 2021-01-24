<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../inc/wantedegigs_top.jsp"%>

<section class="contact-form-wrap section"
   style="background-color: #f2f4f7;">
   <div class="container">
      <div class="row justify-content-center">
         <div>
            <div class="free-section-title text-center">
               <h2>프로젝트/외주 등록</h2>
               <h4>프로젝트 내용을 등록하고 조건에 맞는 전문가의 포트폴리오와 견적을 받아보세요.</h4>

            </div>
         </div>
      </div>

      <div class="registration-tips">
         원티드 긱스 매칭 프로세스에 대해 알아보세요.
         <!-- -->
         <img
            src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIzOCIgaGVpZ2h0PSIzOCIgdmlld0JveD0iMCAwIDM4IDM4Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZD0iTTAgMEwzOCAwIDM4IDM4IDAgMzh6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNTkxIC00MjcpIHRyYW5zbGF0ZSgyMDAgNDExKSB0cmFuc2xhdGUoMzkxIDE2KSIvPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGZpbGw9IiM5NzlEQTQiIGQ9Ik0xOC41IDZDMTEuMDQ4IDYgNSAxMi4wNDggNSAxOS41UzExLjA0OCAzMyAxOC41IDMzIDMyIDI2Ljk1MiAzMiAxOS41IDI1Ljk1MiA2IDE4LjUgNnptMCAyMGMtLjgyNSAwLTEuNS0uNi0xLjUtMS4zMzN2LTUuMzM0QzE3IDE4LjYgMTcuNjc1IDE4IDE4LjUgMThzMS41LjYgMS41IDEuMzMzdjUuMzM0QzIwIDI1LjQgMTkuMzI1IDI2IDE4LjUgMjZ6TTIwIDE2aC0zdi0zaDN2M3oiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC01OTEgLTQyNykgdHJhbnNsYXRlKDIwMCA0MTEpIHRyYW5zbGF0ZSgzOTEgMTYpIi8+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="
            width="38" height="38" style="cursor: pointer">
      </div>

      <form id="form_2" class="proj-register-2" method="post" action="#">
            <div class="form-style">
               <div class="steps-content-title">의뢰/프로젝트의 담당자 정보를 입력해주세요.</div>
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <span class="projTitle">회사명</span> 
                        <input 
                           style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;  font-size: 1rem;" 
                           name="projComName" id="projComName" type="text" class="form-control projRegisterForm" placeholder="회사명">
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group" style="margin-bottom: 0px">
                        <span class="projTitle">담당자 성함</span><span
                           class="register-star">*</span> 
                        <input 
                           style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;  font-size: 1rem;" 
                           name="projUserName" id="projUserName" type="text" class="form-control projRegisterForm" placeholder="담당자 성함">
                     </div>
                  </div>
               </div>
               
               <div class="row">
                  <div class="col-lg-6">
                     <div class="form-group">
                        <span class="projTitle">담당자 이메일</span> 
                        <input 
                           style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;  font-size: 1rem;" 
                           name="projEmail" id="projEmail" type="text" class="form-control projRegisterForm" placeholder="연락 가능한 이메일을 기재">
                     </div>
                  </div>
                  <div class="col-lg-6">
                     <div class="form-group" style="margin-bottom: 0px">
                        <span class="projTitle">담당자 연락처</span><span
                           class="register-star">*</span> 
                        <input 
                           style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;  font-size: 1rem;" 
                           name="projHp" id="projHp" type="text" class="form-control projRegisterForm" placeholder="연락 가능한 번호를 입력">
                     </div>
                  </div>
               </div>
            </div>
            <div class="form-buttonArea">
               <button type="button" class="form-blueButton" 
                  onclick="location.href='${pageContext.request.contextPath}/freelancer/projectRegister/projectRegister2.do'">다음 단계로</button>
            </div>
         </form>
   </div>
</section>

<%@ include file="../../inc/bottom.jsp"%>