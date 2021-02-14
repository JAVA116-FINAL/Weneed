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
               <h2>전문가 등록</h2>
               <h4>전문가로 등록하고, 다양한 혜택과 함께 딱 맞는 프로젝트/의뢰를 받아보세요</h4>
            </div>
         </div>
      </div>

      <div class="form-style">
         <div class="steps-content-title" style="text-align: center; margin-bottom: 20px">
            <div style="margin-bottom: 30px"> 
               <img
                  src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMjYiIGhlaWdodD0iMTI2IiB2aWV3Qm94PSIwIDAgMTI2IDEyNiI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnPgogICAgICAgICAgICA8Zz4KICAgICAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0wIDBMMTI2IDAgMTI2IDEyNiAwIDEyNnoiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC02NTggLTQ0MikgdHJhbnNsYXRlKDIwMCA0MTIpIHRyYW5zbGF0ZSg0NTggMzApIi8+CiAgICAgICAgICAgICAgICAgICAgPHBhdGggZmlsbD0iI0RFRTBFMyIgZD0iTTk0LjggMjYuMTM1SDc1Ljc4MUM3My44NyAyMC44MzcgNjguODY1IDE3IDYyLjk1IDE3Yy01LjkxNSAwLTEwLjkyIDMuODM3LTEyLjgzMSA5LjEzNUgzMS4xYy01LjAwNSAwLTkuMSA0LjExLTkuMSA5LjEzNXY2My45NDVjMCA1LjAyNCA0LjA5NSA5LjEzNSA5LjEgOS4xMzVoNjMuN2M1LjAwNSAwIDkuMS00LjExIDkuMS05LjEzNVYzNS4yN2MwLTUuMDI0LTQuMDk1LTkuMTM1LTkuMS05LjEzNXptLTMxLjg1LjMxNWMyLjU5OSAwIDQuNzI1IDIuMTI2IDQuNzI1IDQuNzI1IDAgMi41OTktMi4xMjYgNC43MjUtNC43MjUgNC43MjUtMi41OTkgMC00LjcyNS0yLjEyNi00LjcyNS00LjcyNSAwLTIuNTk5IDIuMTI2LTQuNzI1IDQuNzI1LTQuNzI1ek01MC4xNjYgODcuMzIxbC0xMS44NjQtMTEuODhjLTEuNzg2LTEuNzg4LTEuNzg2LTQuNjc3IDAtNi40NjYgMS43ODctMS43ODkgNC42NzItMS43ODkgNi40NTkgMGw4LjY1NyA4LjYyMyAyNi45MzQtMjYuOTY5YzEuNzg2LTEuNzg5IDQuNjcyLTEuNzg5IDYuNDU4IDAgMS43ODcgMS43ODkgMS43ODcgNC42NzggMCA2LjQ2N0w1Ni42MjQgODcuMzIxYy0xLjc0IDEuNzg5LTQuNjcyIDEuNzg5LTYuNDU4IDB6IiB0cmFuc2Zvcm09InRyYW5zbGF0ZSgtNjU4IC00NDIpIHRyYW5zbGF0ZSgyMDAgNDEyKSB0cmFuc2xhdGUoNDU4IDMwKSIvPgogICAgICAgICAgICAgICAgPC9nPgogICAgICAgICAgICA8L2c+CiAgICAgICAgPC9nPgogICAgPC9nPgo8L3N2Zz4K"
                  width="126" height="126" >
            </div>
            <div class="form-finish-title">전문가 등록이 완료되었습니다.</div>
            <div style="margin-top: 40px">
               <button type="button" class="form-blueButton" style="width: 150px;"
                  onclick="location.href='${pageContext.request.contextPath}/freelancer/freelancerMain.do'">홈으로</button>
            </div>
         </div>
      </div>

   </div>
</section>

<%@ include file="../../inc/bottom.jsp"%>