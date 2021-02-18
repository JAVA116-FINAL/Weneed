<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weneed Plus 구독신청</title>

  <!-- bootstrap.min css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/bootstrap/css/bootstrap.min.css'/>">
  <!-- Icon Font Css -->
  <link rel="stylesheet" href="<c:url value='/resources/plugins/icofont/icofont.min.css'/>">

  <!-- Main Stylesheet -->
  <link rel="stylesheet" href="<c:url value='/resources/css/style.css'/>">
   
  <!-- font awesome 아이콘 사용을 위한 킷 https://fontawesome.com/ -->
  <script src="https://kit.fontawesome.com/25b3da3ff3.js" crossorigin="anonymous"></script>
  
  <!-- 아임포트 라이브러리 -->
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  
  
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript">
  var IMP = window.IMP; 
  IMP.init("imp66576199"); 
  
  $( function() {
    $( "#accordion" ).accordion();
  });
  
 

  
  /* 유효성 검사 */	

  $(function(){
  	$('#email').focus();
  	
  	
  	$('form[name=weneedFrm]').submit(function(){
  		if($('#subEmail').val().length<1){
  			alert('이메일 계정을 입력하세요');
  			$('#subEmail').focus();
  			event.preventDefault();
  		}else if($('#subEmailCheck').val().length<1){
  			alert('이메일을 다시한번 입력해주세요');
  			$('#subEmailCheck').focus();
  			event.preventDefault();
  		}else if($('#name').val().length<1){
  			alert('이름을 입력해주세요');
  			$('#name').focus();
  			event.preventDefault();
  		}else if($('#phone').val().length<1){
  			alert('전화번호를 입력해주세요');
  			$('#phone').focus();
  			event.preventDefault();		
  		}else if($(':radio[name="subType"]:checked').length < 1){
  			alert('정기권 종류를 선택하세요');
  			$('#subType').focus();
  			event.preventDefault();
  		}else if(!$("#agree").is(":checked")) {
  			alert('확인완료를 해주셔야합니다!');
  			$('#agree').focus();
  			event.preventDefault();
  		}			
  	});
  	
  });
  
 /*  $(function(){	  	
	  	$('form[name=weneedFrm]').submit(function(){
	  		var now = new Date();
	  		var nowTime3 = now.getFullYear();
	  		nowTime += '-' + now.getMonth() + 4 ;
	  		nowTime += '-' + now.getDate();
	  		nowTime += ' ' + now.getHours();
	  		nowTime += ':' + now.getMinutes();
	  		nowTime += ':' + now.getSeconds();

	  		var nowTime6 = Now.getFullYear();
	  		nowTime += '-' + now.getMonth() + 7 ;
	  		nowTime += '-' + now.getDate();
	  		nowTime += ' ' + now.getHours();
	  		nowTime += ':' + now.getMinutes();
	  		nowTime += ':' + now.getSeconds();	  		

	  		if($('#subType').val() == '3'){
	  			$('input[name=subEndDate]').attr('value',nowTime3);
	  		}else if($('#subType').val() == '6'){
	  			$('#subEndDate').val(nowTime6);
	  			$('input[name=subEndDate]').attr('value',nowTime6);	  			
	  		}			
	  	});
	  	
	  }); */
  </script>
  <style type="text/css">
  .subPayField{
  	margin: 10px;
  }
  .btnFilter{
	  border:none; 
	  border-radius:3em; 
	  outline:none; 
	  width:240px; 
	  height:40px;
	  padding:0px,0px; 
	  background-color:#fff; 
	  font-size:15px; 
	  color:blue;
	  }  
.subTypeSection{
	 font-weight: normal;
 }

  </style>
</head>
<body>

<section class="appoinment section">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
          <div style="margin-left:0px; width:400px; margin-top:-40px;">
            <div class="feature-icon mb-3">
             <button type="button" onclick="location.href='/career/Mainpage/careerMain.do'" id="img_btn" style="background-color:#fff; outline:none; border:none;"><img src="<c:url value='/resources/images/weneedLogo.png'/>" style="width:150px;"></button>
            </div>
            <div style="font-size:25px; color:gray; margin-top:30px;">Weneed Plus / ${proVo.proName }</div>    <!-- 3개월 구독시: 무제한으로 즐기는 직군별 커리어 콘텐츠 라고 뜸 -->
              <div style="font-size:13px; color:gray; margin-top:30px;"><p>20,000명 이상의 직장인이 선택한 원티드의 모든 강연, 컨퍼런스 영상을 무제한으로 시청하고, 업계 최고의 전문가와 함께하는 온오프라인 세미나, 북클럽에 참여할 수 있는 기회 </p></div><br>
              <div class="filter" style="width: 100%; height: 70px; margin-top:-20px;">
              <button id="youSureBtn" class="btnFilter">해당 프로그램 정보 상세보기<i class="fas fa-angle-double-right"></i></button>
          </div>
          </div>
      </div>

      <div class="col-lg-8">
           <div class="appoinment-wrap mt-5 mt-lg-0 pl-lg-5">
           <div style="width:550px; margin-left:100px; margin-top:-65px;">
            <h2 style="color:gray; font-size:13px; text-align:right;">* 필수 입력 항목입니다.</h2>
           
           <!-- 기본정보, 추가정보 아코디언!!!!!! -->
		        <div id="accordion" style="margin-top: 50px; ">
						  <p style="font-size:16px;"><i class="far fa-edit"></i><b>기본 정보</b></p>
						  <div class="weneedFrm1">
						  
			<!-- 결제로 넘어가는 Form 시작!!!!!-->
						    <form name="weneedFrm" class="appoinment-form" method="post" action="<c:url value='/career/subscribe/subscriptionPay.do'/>">   <!-- subsRegistComplete.do로보내기 -->
                    			<div class="row" style="margin-top: 0px;">
										<!-- 계정 칸 -->
										<label>계정</label>
				                            <input name="subEmail" id="subEmail" type="text" class="form-control" placeholder="이메일" value="${memVo.email}" style="height:40px; margin-bottom: 30px;">
				                            <br>
				                        
										<!-- 이메일 (이벤트 정보 수신용*) -->
										<label>이메일</label>
				                            <input name="subEmailCheck" id="subEmailCheck" type="text" class="form-control" placeholder="이메일" style="height:40px; margin-bottom: 30px;">
				                            <br>
				                            
				                        
				                        <!-- 이름* -->
										<label>이름</label>
											<input name="subName" id="subName" type="text" class="form-control" placeholder="이름" value="${memVo.name}" style="height:40px; margin-bottom: 30px;">
				                       		<br>
				
				
										<!-- 전화번호 칸 -->
										<label>전화번호</label><br>
				                                <input name="subPhone" id="subPhone" type="text" class="form-control" placeholder="전화번호" value="${memVo.hp}" style="height:40px; margin-bottom: 30px;">
				                                <br><br>
				                            
				                       
							          
				                    </div>
				                   				
				                </div>
										  
										
									<p style="font-size:16px;"><i class="far fa-edit"></i><b>추가 정보</b></p>
										<div class="weneedFrm2">
										  <div>
										  <br>
							          	 	<br>
							          	 	<br>
							          	 	
										    <p>
										    Q. 선택하신 프로그램이 맞는지 다시한번 확인해주세요*
										    </p><br>
										    <label for="subType" class="subTypeSection" style="margin-left:20px; line-height:2em;">
							          	 		종류: <input type="radio" id="subType" name="subType" value="3" style="width:20px;"/>프로그램 &nbsp;&emsp;<br>
							          	 		프로그램 이름: <span><b>${proVo.proName }</b></span>&nbsp;<br>
							          	 		프로그램 가격: <span><b>${proVo.proPrice }</b></span>&nbsp;<br>
							          	 		프로그램 날짜: <b><fmt:formatDate value="${proVo.proStartDate }" pattern="yyyy-MM-dd"/></b>
							          	 	</label>
							          	 	<br><br>

							          	 	
							          	 	<div style="height:80px;"></div>
						          	
							          	    <p>
										    Q. 상단에 기입하신 이메일, 핸드폰으로 구독 정보 및 알림이 전달됩니다. 정확히 입력했는지 다시 한번 확인해 주세요*
										    </p>
										    <label class=""><br>
							          	 		<input type="radio" id="agree" name="agree" value="" style="width:20px;"/>확인 완료
							          	 	</label>
							          	 	<br>
		          	 	
							          	 	<label for="subEndDate" class="">
								          	 		<input type="hidden" id="subEndDate" name="subEndDate" value="${nowTime3 }" style="width:20px;"/>
								          	 		<input type="hidden" id="subEndDate" name="subEndDate" value="${nowTime6}" style="width:20px;"/>
							          	 	</label>
							          	 	
										    </div>
											  <input type="submit" id="checkoutBtn" class="btnFilter" style="float:right; margin-top: 40px; margin-left:10px;background-color:#3366ff; outline:none; border-radius:2em; border:none; height: 40px; width: 120px; color:#fff" value="신청하기">
									  </div>
								  </form>
							  </div>
			 <!-- 기본정보, 추가정보 아코디언 끝!!!!!! -->
						
				<!-- 추가정보까지 작성하면 보이는 신청버튼과 추가설명 섹션 -->
				 <div class="almostDoneRegister"> 
					<div style="color:gray; font-size:11px; margin-top:30px;">
					<hr>
					<p>이벤트 신청시의 불편한 부분 또는 의문점이 있으시면 부담없이 문의해 주세요. 문의에 대한 대응은 접수일부터 3영업일 이내로 답변 드리겠습니다. 고객센터 : help@wantedlab.com</p>
					</div>
						
				</div>
				<!-- 추가정보까지 작성하면 보이는 신청버튼과 추가설명 섹션 끝-->
        </div>
      </div>
    </div>
  </div>
</section>


  <!-- 모달 내용 1 -->
	<div class="modal fade" id="youSureModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header" style="margin-top: -15px;">
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
				    <div style="font-size:17px; color:black; text-align:center; margin-top:15px;">
					  <i class="fas fa-exclamation"  style="width: 150px; height:50px;"></i>
							<p><b>작성중인 내용이 삭제됩니다.</b></p> 
							<p><b>계속 진행하겠습니까?</b></p></div>
					</div>
				<div class="modal-footer">
					<a class="btn" id="modalY" href="<c:url value='/career/Mainpage/subscription.do'/>">예</a>
					<button class="btn" type="button" data-dismiss="modal">아니요</button>
				</div>
			</div>
		</div>
	</div>
	 <script>
		$('#youSureBtn').click(function(e){
			e.preventDefault();
			$('#youSureModal').modal("show");
		});
	</script>
	 

  <!-- 모달 내용 2 (결제) -->
	<%-- <div class="modal fade" id="checkoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" data-backdrop="static" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content" style="margin-left:50px;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><b>카드정보등록</b></h5>
					<button class="close" type="button" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">X</span>
					</button>
				</div>
				<div class="modal-body">
					    <div style="font-size:14px; color:black; margin-top:0px;">
					  <i class="fas fa-exclamation"  style="width: 150px; height:50px;"></i>
							<p>주문자 정보: 허지원 / royalceramic918@gmail.com</p>  <!-- 회원정보 받아서 뿌려주기 -->
								
									<p>Weneed Plus : 
									무제한으로 즐기는 직군별 커리어 콘텐츠 참가신청비</p>
									<p>3개월권 : 120000 KRW</p>    							
								
								<c:if test="${subType = '3' }">
									<p>Weneed Plus : 무제한으로 즐기는 직군별 커리어 콘텐츠 참가신청비</p>
									<p>3개월권 : 120000 KRW</p>    							
								</c:if>
								<c:if test="${subType = '6' }">
									<p>Weneed Plus : 무제한으로 즐기는 직군별 커리어 콘텐츠 참가신청비</p>
									<p>6개월권 : 210000 KRW</p>     							
								</c:if>
							<hr>
						</div>
					
						<div id=#subsPay>
						<form action="">
							<label class="subPayField" >
						     	<input type="radio" name="" value="" style="width:20px;"/>개인
						    </label>
						    <label class="subPayField">
								<input type="radio" name="" value="" checked="checked" style="width:20px;"/>법인
							</label><br>
							<label class="subPayField">카드번호<br>
								<input type="text" name="" value="" placeholder="0000 0000 0000 0000" style="width:200px; height:32px; border:0.1px solid gray; border-radius:0.3em;"/>
							</label><br>
							<label class="subPayField">만료일자<br>
								<input type="text" name="" value="" placeholder="MM" style="width:45px; height:32px; border:0.1px solid gray; border-radius:0.3em;"/> / 
								<input type="text" name="" value="" placeholder="YY" style="width:45px; height:32px; border:0.1px solid gray; border-radius:0.3em;"/>
							</label><br>
							<label class="subPayField">생일<br>
								<input type="text" name="" value="" placeholder="YY" style="width:45px; height:32px; border:0.1px solid gray; border-radius:0.3em;"/> / 
								<input type="text" name="" value="" placeholder="MM" style="width:45px; height:32px; border:0.1px solid gray; border-radius:0.3em;"/> / 
								<input type="text" name="" value="" placeholder="DD" style="width:45px; height:32px; border:0.1px solid gray; border-radius:0.3em;"/>
							</label><br>
							<label class="subPayField">비밀번호 앞 두자리<br>
								<input type="text" name="" value="" placeholder="**" style="width:45px; height:32px; border:0.1px solid gray; border-radius:0.3em;"/>
							</label><br>
						
						</form>
						</div>
					</div>
				<div class="modal-footer">
					<button class="btn" type="button" onclick="requestPay()">결제하기</button>
					<button class="btn" type="button" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div> --%>

<script>

<!-- 결제 API -->
$(function(){
	$('#checkoutBtn').click(function(){
		
	}
})


IMP.request_pay({
    pg : 'inicis',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : 14000,
    buyer_email : '${subEmail}',
    buyer_name : '${subName}',
    buyer_tel : '${subPhone}',
    buyer_addr : '비공개',
    buyer_postcode : '비공개'
}, function(rsp) {
    if ( rsp.success ) {
    	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
    	jQuery.ajax({
    		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
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


 
<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/6024a5279c4f165d47c223b7/1eu7ia8n9';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script-->
</body>
</html>