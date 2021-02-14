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

      <form id="form_2" class="proj-register-2" method="post" action="#">
         <div class="form-style">
            <div class="steps-content-title">프로젝트/외주 상세 정보를 입력해주세요.</div>
            <div class="row">
               <div class="col-lg-6">
                  <div class="form-group">
                     <span class="projTitle">근무 형태</span><span class="register-star">*</span>
                     <select
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
                        class="form-control projRegisterForm" id="projWorkType">
                        <option>원격 근무</option>
                        <option>상주 근무</option>
                     </select>
                  </div>
               </div>
               <div class="col-lg-6">
                  <div class="form-group" style="margin-bottom: 0px">
                     <span class="projTitle">프로젝트 시작 희망일</span><span
                        class="register-star">*</span> <input
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
                        name="projStartDate" id="projStartDate" type="date"
                        class="form-control projRegisterForm" placeholder="날짜 선택">
                  </div>
                  <div class="form-group">
                     <!-- 체크하면 현재 날짜 들어가게 -->
                     <input
                        style="width: 15px; height: 15px; border: 1px solid #979da4;"
                        type="checkbox" id="projStart" value="프로젝트 즉시 시작"> <span
                        class="projDetailText">프로젝트 즉시 시작</span>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-lg-6">
                  <div class="form-group">
                     <span class="projTitle">직군/직무</span><span class="register-star">*</span>
                     <select
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
                        class="form-control projRegisterForm" id="projJikgun">
                        <option>직군을 입력해주세요.</option>
                        <!-- 직군 테이블 받아오기 -->
                        <!-- 직군 선택 => 직무 셀렉트  -->
                     </select>
                  </div>
               </div>
               <div class="col-lg-6">
                  <div class="form-group" style="margin-bottom: 0px">
                     <span class="projTitle">요구 스킬</span> <input
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
                        name="projSkill" id="projSkill" type="search"
                        class="form-control projRegisterForm" placeholder="스킬 선택">
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-lg-12">
                  <div class="form-group" style="margin-bottom: 0px">
                     <span class="projTitle">의뢰 세부 내용</span> <span
                        class="register-star">*</span>
                     <textarea id="projDetail" class="form-control projRegisterForm"
                        placeholder="의뢰 세부 내용을 기입"
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; margin-top: 10px"></textarea>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-lg-6">
                  <div class="form-group">
                     <span class="projTitle">프로젝트 예산</span> <span
                        class="register-star">*</span> <span
                        style="position: absolute; right: 15px; cursor: pointer;"><img
                        src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCIgdmlld0JveD0iMCAwIDI0IDI0Ij4KICAgIDxnIGZpbGw9Im5vbmUiIGZpbGwtcnVsZT0iZXZlbm9kZCI+CiAgICAgICAgPGc+CiAgICAgICAgICAgIDxnPgogICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgPGc+CiAgICAgICAgICAgICAgICAgICAgICAgIDxwYXRoIGQ9Ik0wIDBMMjQgMCAyNCAyNCAwIDI0eiIgdHJhbnNmb3JtPSJ0cmFuc2xhdGUoLTY0NiAtNTMyKSB0cmFuc2xhdGUoMjQwIDUzMCkgdHJhbnNsYXRlKDQwNiAyKSIvPgogICAgICAgICAgICAgICAgICAgICAgICA8cGF0aCBmaWxsPSIjOTc5REE0IiBkPSJNMTIgMkM2LjQ4IDIgMiA2LjQ4IDIgMTJzNC40OCAxMCAxMCAxMCAxMC00LjQ4IDEwLTEwUzE3LjUyIDIgMTIgMnptMCAxOGMtNC40MSAwLTgtMy41OS04LThzMy41OS04IDgtOCA4IDMuNTkgOCA4LTMuNTkgOC04IDh6bS0xLTRoMnYyaC0ydi0yem0xLjYxLTkuOTZjLTIuMDYtLjMtMy44OC45Ny00LjQzIDIuNzktLjE4LjU4LjI2IDEuMTcuODcgMS4xN2guMmMuNDEgMCAuNzQtLjI5Ljg4LS42Ny4zMi0uODkgMS4yNy0xLjUgMi4zLTEuMjguOTUuMiAxLjY1IDEuMTMgMS41NyAyLjEtLjEgMS4zNC0xLjYyIDEuNjMtMi40NSAyLjg4IDAgLjAxLS4wMS4wMS0uMDEuMDItLjAxLjAyLS4wMi4wMy0uMDMuMDUtLjA5LjE1LS4xOC4zMi0uMjUuNS0uMDEuMDMtLjAzLjA1LS4wNC4wOC0uMDEuMDItLjAxLjA0LS4wMi4wNy0uMTIuMzQtLjIuNzUtLjIgMS4yNWgyYzAtLjQyLjExLS43Ny4yOC0xLjA3LjAyLS4wMy4wMy0uMDYuMDUtLjA5LjA4LS4xNC4xOC0uMjcuMjgtLjM5LjAxLS4wMS4wMi0uMDMuMDMtLjA0LjEtLjEyLjIxLS4yMy4zMy0uMzQuOTYtLjkxIDIuMjYtMS42NSAxLjk5LTMuNTYtLjI0LTEuNzQtMS42MS0zLjIxLTMuMzUtMy40N3oiIHRyYW5zZm9ybT0idHJhbnNsYXRlKC02NDYgLTUzMikgdHJhbnNsYXRlKDI0MCA1MzApIHRyYW5zbGF0ZSg0MDYgMikiLz4KICAgICAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgICAgICA8L2c+CiAgICAgICAgICAgIDwvZz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="
                        width="24" height="24"></span> <select
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
                        class="form-control projRegisterForm" id="projJikgun">
                        <option>월급여</option>
                        <option>프로젝트 단위</option>
                     </select>
                     <div>
                        <input
                           style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px; width: 90%; float: left;"
                           name="projSkill" id="projSkill" type="search"
                           class="form-control projRegisterForm"
                           placeholder="월급여를 만원 단위로 기입"> <span
                           class="projDetailText"
                           style="float: left; padding: 6px 3px; margin: 20px 0px">만원</span>
                     </div>
                  </div>
               </div>
               <div class="col-lg-6">
                  <div class="form-group" style="margin-bottom: 0px">
                     <span class="projTitle">예상 기간</span> <span class="register-star">*</span>
                     <div>
                        <div style="float: left; width: 70%">
                           <input
                              style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
                              name="projSkill" id="projSkill" type="search"
                              class="form-control projRegisterForm" placeholder="예상 기간을 기입">
                        </div>
                        <div class="col-lg-6" style="float: left; width: 30%">
                           <select
                              style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px;"
                              class="form-control projRegisterForm" id="projJikgun">
                              <option>개월</option>
                              <option>주</option>
                           </select>

                        </div>
                     </div>
                  </div>
               </div>
            </div>

            <div class="row">
               <div class="col-lg-12">
                  <div class="form-group">
                     <span class="projTitle">원활한 매칭을 위한 체크 리스트</span>
                  </div>
                  <div class="form-group" style="margin-bottom: 5px">
                     <input
                        style="width: 15px; height: 15px; border: 1px solid #979da4; float: left; margin: 3px 5px 0px 0px;"
                        type="checkbox" id="projCk1" value="프로젝트 즉시 시작"
                        class="form-control projRegisterForm"> <span
                        class="projDetailText">프로젝트/근무 기간 중 야근/휴일/휴가 근무가 필요합니다.</span>
                  </div>
                  <div class="form-group">
                     <input
                        style="width: 15px; height: 15px; border: 1px solid #979da4; float: left; margin: 3px 5px 0px 0px;"
                        type="checkbox" id="projCk2" value="프로젝트 즉시 시작"
                        class="form-control projRegisterForm"> <span
                        class="projDetailText">최초 의뢰를 한 별도의 클라이언트가 있습니다. (예 :
                        정부과제, 에이전시 등)</span>
                  </div>

               </div>
            </div>

            <div class="row">
               <div class="col-lg-6">
                  <div class="form-group" style="margin-bottom: 0px">
                     <span class="projTitle">사무실 주소</span><span class="register-star">*</span>
                     <input
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px; font-size: 1em"
                        name="projAddrses" id="projAddrses" type="text"
                        class="form-control projRegisterForm"
                        placeholder="사무실의 주소를 간략히 입력">
                  </div>
               </div>
               <div class="col-lg-6">
                  <div class="form-group" style="margin-bottom: 0px">
                     <span class="projTitle">추천인</span> <input
                        style="background-color: #ffffff; border: 1px solid #d9d9d9; border-radius: 5px; font-size: 1em"
                        name="projRecommend" id="projRecommend" type="text"
                        class="form-control projRegisterForm">
                  </div>
               </div>
            </div>
         </div>
         <div class="form-buttonArea">
            <button type="button" class="form-whiteButton"
               onclick="location.href='${pageContext.request.contextPath}/freelancer/projectRegister/projectRegister1.do'">이전
               단계로</button>
            <button type="button" class="form-blueButton"
               onclick="location.href='${pageContext.request.contextPath}/freelancer/projectRegister/projectRegister3.do'">등록
               완료</button>
         </div>
      </form>
   </div>
</section>

<%@ include file="../../inc/bottom.jsp"%>