<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wanted Plus 구독신청</title>
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
  

 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  $( function() {
    $( "#accordion" ).accordion();
  } );
  
  /* 필터 팝업창  */
  function showPopup(multipleFilter) {
		const popup = document.querySelector('#popup2');
	  
	  if (multipleFilter) {
	  	popup.classList.add('multiple-filter');
	  } else {
	  	popup.classList.remove('multiple-filter');
	  }
	  
	  popup.classList.remove('hide');
	}

	function closePopup() {
		const popup = document.querySelector('#popup2');
	  popup.classList.add('hide');
	}
  
  
  
  </script>
</head>
<body>
 


<section class="appoinment section">
  <div class="container">
    <div class="row">
      <div class="col-lg-4">
          <div style="margin-left:0px; width:400px; margin-top:-30px;">
            <div class="feature-icon mb-3">
             <img alt="" src="https://static.wanted.co.kr/images/events/wanted-symbol-logo3x.png" style="width:150px;">
            </div>
            <div style="font-size:25px; color:gray; margin-top:30px;">Wanted Plus / 6개월권 구독</div>
              <div style="font-size:13px; color:gray; margin-top:30px;"><p>20,000명 이상의 직장인이 선택한 원티드의 모든 강연, 컨퍼런스 영상을 무제한으로 시청하고, 업계 최고의 전문가와 함께하는 온오프라인 세미나, 북클럽에 참여할 수 있는 기회 </p></div><br>
              <div class="filter" style="width: 100%; height: 70px; margin-top:-20px;">
              <button onclick="showPopup(true)" class="btnFilter" style="border:none; border-radius:3em; outline:none; width:190px; height:40px;padding:0px,0px; 
              			background-color:#fff; font-size:15px; color:blue">이벤트 정보 상세보기<i class="fas fa-angle-double-right"></i></button>
          </div>
          </div>
      </div>

      <div class="col-lg-8">
           <div class="appoinment-wrap mt-5 mt-lg-0 pl-lg-5">
           <div style="width:550px; margin-left:65px; margin-top:-20px;">
            <h2 style="color:gray; font-size:13px; text-align:right;">* 필수 입력 항목입니다.</h2>
           
           <!-- 기본정보, 추가정보 아코디언!!!!!! -->
		        <div id="accordion" style="margin-top: 50px; ">
						  <h3><i class="far fa-edit"></i><b>기본 정보</b></h3>
						    <form id="#" class="appoinment-form" method="post" action="#">
                    <div class="row">
                       
                       
						<!-- 계정 칸 -->
						<label>계정</label>
                            <input name="email" id="email" type="text" class="form-control" placeholder="이메일">
                            <br>
                        
						<!-- 이메일 (이벤트 정보 수신용*) -->
						<label>이메일</label>
                            <input name="time" id="time" type="text" class="form-control" placeholder="이메일">
                            <br>
                            
                        
                        <!-- 이름* -->
						<label>이름</label>
							<input name="name" id="name" type="text" class="form-control" placeholder="이름">
                       		<br>


						<!-- 전화번호 칸 -->
						<label>전화번호</label><br>
                                <select id="exampleFormControlSelect1">
                                  <option>+82 South Korea</option>
                                  <option>+1 United States</option>
                                  <option>+65 Singapore</option>
                                  <option>+---etc----</option>
                                </select>
                                <input name="phone" id="phone" type="text" class="form-control" placeholder="전화번호">
                                <br><br>
                            
                        
                        <!-- 직군/주요 직무/경력 -->
						<label>직군/주요 직무/경력</label>
                         <label class="" >
	            			<input type="radio" name="" value="" style="width:20px;"/>직군 선택
	          			 </label><br>
	          			 <label class="">
			          	 	<input type="radio" name="" value="" checked="checked" style="width:20px;"/>해당사항 없음
			          	 </label>
			          
                    </div>
                    
                       <button onclick="location.href=''" style="float:right; margin-left:10px;background-color:#3366ff; outline:none; border-radius:2em; border:none; width: 120px; color:#fff">다음<i class="icofont-simple-right ml-2"></i></button>

                </form>
						  
						
						
						  <h3><i class="far fa-edit"></i><b>추가 정보</b></h3>
						  <form action="">
						  <div>
						    <p>
						    Q. 상단에 기입하신 이메일, 핸드폰으로 구독 정보 및 알림이 전달됩니다. 정확히 입력했는지 다시 한번 확인해 주세요*
						    </p>
						    <label class="">
			          	 		<input type="radio" name="" value="" style="width:20px;"/>확인 완료
			          	 	</label>
			          	 	<br>
			          	 	<br>
			          	 	<br>
			          	 	
			          	 	 <p>
			          	 	Q. 관심있는 VOD 주제를 모두 선택해주세요 (*중복 선택 가능)
			          	 	 </p>
			          	 	<input type="checkbox" name="" value="">HR(채용, 노무, 조직문화 등)<br>
			          	 	<input type="checkbox" name="" value="">OKR<br>
			          	 	<input type="checkbox" name="" value="">개발<br>
			          	 	<input type="checkbox" name="" value="">디자인<br>
			          	 	<input type="checkbox" name="" value="">리더십<br>
			          	 	<input type="checkbox" name="" value="">마케팅<br>
			          	 	<input type="checkbox" name="" value="">비즈니스<br>
			          	 	
			          	 	
						    </div>
						  </form>
						  </div>
			 <!-- 기본정보, 추가정보 아코디언 끝!!!!!! -->
						
				<!-- 추가정보까지 작성하면 보이는 신청버튼과 추가설명 섹션 -->
				 <div class="almostDoneRegister"> 
				  <button onclick="location.href=''" style="float:right; margin-top: -60px; margin-left:10px;background-color:#3366ff; outline:none; border-radius:2em; border:none; width: 120px; color:#fff">신청하기<i class="icofont-simple-right ml-2"></i></button>
					<div style="color:gray; font-size:11px; margin-top:120px;">
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







<!-- 팝업창 내용 -->
	<div id="popup2" class="hide">
  <div class="content2">
    <div style="font-size:17px; color:black; text-align:center; margin-top:30px;">
  <i class="fas fa-exclamation"  style="width: 150px; height:50px;"></i>
		<p><b>작성중인 내용이 삭제됩니다.</b></p> 
		<p><b>계속 진행하겠습니까?</b></p></div>

    <div style="padding-top:20px;">
    <button onclick="closePopup()" style="margin-left: 75px;background-color:#fff; border-radius:2em; border:0.3px solid #d2d3d4; outline:none; width: 120px;">취소</button>
    <button onclick="location.href='<c:url value='/career/Mainpage/subscription.do'/>'" style=" margin-left:10px;background-color:#3366ff; outline:none; border-radius:2em; border:none; width: 120px; color:#fff">확인</button>
  	</div>
  </div>
</div>




</body>
</html>