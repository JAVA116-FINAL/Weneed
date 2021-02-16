<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weneed - Admin</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/admin/adminCommon.css'/>">
</head>
<body style="background-color: #f8f8fa;">
<div class="topWrapper">
<div class="adminContainer" >
   <section class="admintop">
      <img style="width:100px" src="<c:url value='/resources/images/admin_logo.png'/>">
      <nav>
         <ul class="adminTopMenubar">
            <li class="adminMenuLi">기업정보승인
               <ul>
                  <li class="adminSubMenu"><a href="<c:url value='/admin/index.do'/>">정보 승인</a></li>
                  <li class="adminSubMenu"><a href="<c:url value='/admin/companyService/comImgPermission.do'/>">이미지 승인</a></li>
               </ul>
            </li>
            <li class="adminMenuLi">매치업
               <ul>
                  <li class="adminSubMenu"><a href="<c:url value='/admin/adminMatchup.do'/>">매치업 현황</a></li>
                  <li class="adminSubMenu"><a href="#">매치업 상품</a></li>
               </ul>
            </li>
            <li class="adminMenuLi">포지션/이력서
               <ul>
                  <li class="adminSubMenu"><a href="#">포지션 조회</a></li>
                  <li class="adminSubMenu"><a href='<c:url value="/admin/adminResume.do"/>'>이력서 조회</a></li>
                  <li class="adminSubMenu"><a href='<c:url value="/admin/adminApply.do"/>'>지원현황</a></li>
               </ul>
            </li>
            <li class="adminMenuLi">고객센터
               <ul>
                  <li class="adminSubMenu"><a href="<c:url value='/admin/noticeService/notice_list.do'/>">이용안내</a></li>
                  <li class="adminSubMenu"><a href="<c:url value='/admin/noticeService/noticeQna_list.do'/>">문의내역</a></li>
               </ul>
            </li>
            <li class="adminMenuLi">커리어성장
               <ul>
                  <li class="adminSubMenu"><a href="<c:url value='/career/Admin/programWrite.do'/>">프로그램 등록</a></li>
                  <li class="adminSubMenu"><a href="<c:url value='/career/Admin/programAdminList.do'/>">프로그램 조회</a></li>
                  <li class="adminSubMenu"><a href="<c:url value='/career/Admin/programAdminWeneed.do'/>">Weneed+</a></li>
               </ul>
            </li>
            <li class="adminMenuLi">직군별연봉
               <ul>
                  <li class="adminSubMenu"><a href="#">연봉정보 조회</a></li>
               </ul> 
            </li>
         </ul>
      </nav>
   </section>
   </div>
</div>
   <section class="adminContainer">