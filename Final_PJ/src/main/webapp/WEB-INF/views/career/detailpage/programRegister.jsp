<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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
          <div style="margin-left:0px; width:400px; margin-top:-40px;">
            <div class="feature-icon mb-3">
             <button type="button" onclick="location.href='/career/Mainpage/careerMain.do'" id="img_btn" style="background-color:#fff; outline:none; border:none;"><img src="<c:url value='/resources/images/weneedLogo.png'/>" style="width:150px;"></button>
            </div>
            <div style="font-size:25px; color:gray; margin-top:30px;">Weneed Plus</div> 
              <div style="font-size:13px; color:gray; margin-top:30px;"><p>${proVo.proName} </p></div><br>
              <div class="filter" style="width: 100%; height: 70px; margin-top:-20px;">
              <button id="youSureBtn" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:190px; height:40px;padding:0px,0px; 
              			background-color:#fff; font-size:15px; color:blue">이벤트 정보 상세보기<i class="fas fa-angle-double-right"></i></button>
          </div>
          </div>
      </div>

      <div class="col-lg-8">
           <div class="appoinment-wrap mt-5 mt-lg-0 pl-lg-5">
           <div style="width:550px; margin-left:65px; margin-top:-65px;">
            <h2 style="color:gray; font-size:13px; text-align:right;">* 필수 입력 항목입니다.</h2>
           
           <!-- 기본정보, 추가정보 아코디언!!!!!! -->
		        <div id="accordion" style="margin-top: 50px; ">
						  <p style="font-size:16px;"><i class="far fa-edit"></i><b>기본 정보</b></p>
						  <div class="weneedFrm1">
						  
			<!-- 결제로 넘어가는 Form 시작!!!!!-->
						    <form name="weneedFrm" class="appoinment-form" method="post" action="<c:url value='/career/subscribe/subscriptionPay.do'/>">   <!-- subsRegistComplete.do로보내기 -->
                    			<div class="row" style="margin-top: -20px;">
										<!-- 계정 칸 -->
										<label>계정</label>
				                            <input name="subEmail" id="subEmail" type="text" class="form-control" placeholder="이메일" style="height:40px; margin-bottom: 30px;">
				                            <br>
				                        
										<!-- 이메일 (이벤트 정보 수신용*) -->
										<label>이메일</label>
				                            <input name="subEmailCheck" id="subEmailCheck" type="text" class="form-control" placeholder="이메일" style="height:40px; margin-bottom: 30px;">
				                            <br>
				                            
				                        
				                        <!-- 이름* -->
										<label>이름</label>
											<input name="subName" id="subName" type="text" class="form-control" placeholder="이름" style="height:40px; margin-bottom: 30px;">
				                       		<br>
				
				
										<!-- 전화번호 칸 -->
										<label>전화번호</label><br>
				                                <input name="subPhone" id="subPhone" type="text" class="form-control" placeholder="전화번호" style="height:40px; margin-bottom: 30px;">
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
										    Q. 정기권 종류를 선택해주세요*
										    </p><br>
										    <label for="subType" class="">
							          	 		<input type="radio" id="subType" name="subType" value="3" style="width:20px;"/>3개월 &nbsp;(120,000 원) &emsp; &emsp;
							          	 		<input type="radio" id="subType" name="subType" value="6" style="width:20px;"/>6개월 &nbsp;(210,000 원)
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
					<p>입력한 정보 중 일부는 프로필과 연동되며, 회원님의 경력에 관심이 있는 기업으로부터 채용기회를 제안 받을 수 있습니다. 회원님의 신원은 노출되지 않으니 안심하세요! (프로필은 '내정보> 프로필' 에서 언제든지 변경 가능합니다.) </p>
					<input type="checkbox"> <span>(필수)개인정보 제3자 제공 동의</span><span><a style="color:#3366ff;">자세히 보기</a></span> 
						<div>
							<ul>
								<li>1. 제공받는 자 : 원티드 외 이벤트 주최 기업회원</li>
								<li>2. 제공하는 목적 : 신청자 확인, 이벤트 진행</li>
								<li>3. 제공하려는 개인정보 항목 : 소속회사, 이메일, 이름, 연락처</li>
								<li>4. 제공기간 : 본 이벤트 완료 후 파기</li>
								<li>5. 본 제공을 동의하지 않으실 경우, 해당 이벤트에 참여하실 수 없습니다.</li>
							</ul>
							<p>*개인정보 수집에 동의해주세요.</p>
							<br>
							<p>이벤트 신청시의 불편한 부분 또는 의문점이 있으시면 부담없이 문의해 주세요. 문의에 대한 대응은 접수일부터 3영업일 이내로 답변 드리겠습니다. 고객센터 : help@wantedlab.com</p>
							
						</div>
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
					<a class="btn" id="modalY" href="<c:url value='/career/Mainpage/careerMain.do'/>">예</a>
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