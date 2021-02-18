<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weneed Plus 구독신청</title>

  <!-- Favicon -->
  <link rel="shortcut icon" type="image/x-icon" href="<c:url value='/resources/images/favicon.ico'/>" />

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/bootstrap/css/bootstrap.min.css'/>">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/icofont/icofont.min.css'/>">
<%--   <!-- Slick Slider  CSS -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
 --%>
  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
  
  <!-- 커리어성장 카테고리메뉴 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick.css'/>">
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/plugins/slick-carousel/slick/slick-theme.css'/>">
    
  <!-- 커리어성장 필터 팝업창 css -->
  <link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/jiwonPopup.css'/>">

  <!-- font awesome 아이콘 사용을 위한 킷 https://fontawesome.com/ -->
  <script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>
  
  <!-- 아임포트 라이브러리 -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

  <script type="text/javascript">
  var IMP = window.IMP; 
  IMP.init("imp66576199"); 
  

  

  </script>
  <style type="text/css">
  .subPayField{
  	margin: 10px;
  }
  </style>
</head>
<body>

<section class="appoinment section">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
          <div style="margin-left:0px; width:400px; margin-top:-30px;">
            <div class="feature-icon mb-3">
             <button type="button" onclick="location.href='/main/afterLoginMain.do'" id="img_btn" style="background-color:#fff; outline:none; border:none;"><img src="<c:url value='/resources/images/weneedLogo.png'/>" style="width:150px;"></button>
            </div>
            <div style="font-size:25px; color:gray; margin-top:30px;">Weneed Plus / 정기구독권</div>    
              <div style="font-size:13px; color:gray; margin-top:30px;"><p>20,000명 이상의 직장인이 선택한 원티드의 모든 강연, 컨퍼런스 영상을 무제한으로 시청하고, 업계 최고의 전문가와 함께하는 온오프라인 세미나, 북클럽에 참여할 수 있는 기회 </p></div><br>
              <div class="filter" style="width: 100%; height: 70px; margin-top:-20px;">
              <button id="youSureBtn" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:190px; height:40px;padding:0px,0px; 
              			background-color:#fff; font-size:15px; color:blue">구독권 정보 상세보기<i class="fas fa-angle-double-right"></i></button>
          </div>
          </div>
      </div>

      <div class="col-lg-8">
           <div class="appoinment-wrap mt-5 mt-lg-0 pl-lg-5">
           <div style="width:550px; margin-left:65px; margin-top:-20px;">
            <h2 style="color:gray; font-size:13px; text-align:right;">* 필수 입력 항목입니다.</h2>

	      </div>
	    </div>
	  </div>
	</div>
  </div>
</section>



<script>

<!-- 결제 API -->
IMP.request_pay({
    pg : 'inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : '${subEmail}',
    buyer_name : '${subName}',
    buyer_tel : '${subHp}',
    buyer_addr : '비공개',
    buyer_postcode : '비공개'
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url: "<c:url value='/career/subscribe/paymentsComplete.do'/>", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
    		type: 'POST',
    		dataType: 'json',
    		data: {
	    		imp_uid : rsp.imp_uid
	    		//기타 필요한 데이터가 있으면 추가 전달
    		}
    	}).done(function(data) {
    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    		if ( everythings_fine ) {
    			var msg = '결제가 완료되었습니다.';
    			msg += '\n고유ID : ' + rsp.imp_uid;
    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
    			msg += '\결제 금액 : ' + rsp.paid_amount;
    			msg += '카드 승인번호 : ' + rsp.apply_num;

    			alert(msg);
    		} else {
    			//[3] 아직 제대로 결제가 되지 않았습니다.
    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    		}
    	});
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        alert(msg);
    }
});
 

 
 </script> 
 

</body>
</html>