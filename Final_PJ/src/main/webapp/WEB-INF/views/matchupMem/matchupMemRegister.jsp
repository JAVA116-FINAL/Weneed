<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<%-- <%@ include file="../inc/cssJsImports.jsp" %> --%>
<!-- 내꺼!! -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 리스트기반 에딧고쳐서 꼭 같이 있어야 함 -->
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemList.css'/>"> 
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemRegister.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<%-- <script src="<c:url value='/resources/plugins/bootstrap/js/bootstrap.min.js'/>"></script> --%>
<script type="text/javascript">
$(function(){
	
	$('#exampleFormControlSelect1').change(function(){
		//alert($('#exampleFormControlSelect1 option:selected').val());
		
		 $.ajax({
			url:"<c:url value='/matchupMem/matchupGetJikmu.do'/>",
			type:"get",
			data:"jikgunCode="+$('#exampleFormControlSelect1 option:selected').val(),	
			dataType:"json", 
			success:function(jList){
				//alert(res);
				$.getJikmubt(jList);
			},
			error:function(xhr, status, error){
				alert('error:'+error);
			}
		});//ajax함수
	});//select change함수
	
	$.getJikmubt=function(jList){
		var jikmu="";
		var i=0;
		if(jList.length>0){
			$.each(jList, function(idx,item){
				jikmu+="<label class='btn mcuEdit-jikgunbt_jy' onclick='$.btActivejikmu(\""+item.jikmuCode+"\")' id='lb"+item.jikmuCode+"'>";	
				jikmu+="<input type='hidden' name='jikmuItems["+i+"].jikmuCode' value='"+item.jikmuCode+"'/>";
				jikmu+="<input type='checkbox' name='jikmuItems["+i+"].jikmuName' value='"+item.jikmuName+"'/>"+item.jikmuName    
				jikmu+="</label>";    
				i++;
			});//each
			$('#divbtGroup').append(jikmu);
		}//if
	}//getjikmu함수
	
	
	/* $.btActivejikmu(jikmuCode){
		$('#lb'+jikmuCode).attr('class'. 'active');
	} */
	
	
	var bool=true;
	$('#btToggle').click(function(){
		
		if(bool){//토글 구현하는 방법★★
			$('#moreChoice').html('선택사항 접기 <i class="icon-arrow_up btarrowDoun_jy :before"></i>');
			//bool=false;
		}else{
			$('#moreChoice').html('선택사항 더보기 <i class="icon-arrow_down btarrowDoun_jy :before"></i>');
			//bool=true;
		}
		bool=!bool;
	});//더보기 토글		
	

	$.setCurrency=function(currency){
		//alert(currency);
		if(currency=="KRW"){
			$('#spCurecy').text("만원");
		}else if(currency=="JPY"){
			$('#spCurecy').text("万円");
		}else if(currency=="HKD"){
			$('#spCurecy').text("HKD");
		}else if(currency=="SGD"){
			$('#spCurecy').text("SGD");
		}else if(currency=="TWD"){
			$('#spCurecy').text("萬");
		}
		
	}//함수
	
	
});//jquery



</script>

<section class="section doctor-single machupSection_jy">
	<div class="container machupContainer1_jy">
		<div class="row machupRow_jy">
<!-- 프로필구역 -->		
			<aside class="col-lg-3 col-md-6 machupAside_jy" >
				<!-- 프로필상자, 사진업로드?-->
				<div class="profileblock_jy">
					<header class="profileHeader_jy">
						<div class="member-img_jy" style='background-image: url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png"), url("https://static.wanted.co.kr/images/profile_default.png")'>
						 <!-- 폼은 어디갔니 -->
							<input class="inputimg_jy" type="file" accept="image/*">
							<i class="icon-camera_icon camerai_jy"></i> 
						</div>
						<div class="asideMe_jy">
							<div class="asideName_jy">${memVo.name}</div>
							<div class="asideMail_jy">${memVo.email}</div>
							<div class="asideHp_jy">${memVo.hp}</div>
						</div>
						<button type="button" class="btEdit_jy" value="기본정보수정">기본정보 수정</button>
					</header>
					<div class="info-block mt-4 infoblock_jy">
						<a href="#" class="profileInfo-a_jy">
							<span class="spWant_jy">원해요</span>
							<strong class="wantCount_jy">0</strong>
						</a>
						<a href="#" class="profileInfo-a_jy">
							<span class="spOpen_jy">열람</span>
							<strong class="openCount">0</strong>
						</a>
						<a href="#" class="profileInfo-a_jy">
							<span class="spSuggest">받은제안</span>
							<strong class="suggestCount">0</strong>
						</a>
					</div>
				</div>
			</aside>		

			<div class="col-lg-9 col-md-6 machupWrapperdiv_jy">
				<div class="doctor-details mt-4 mt-lg-0 machupinner_jy">
					<div class="machupSection_jy">
						<form id="frmMcuEx" class="appoinment-form" method="post" action="<c:url value='/machupMem/machupMemRegister.do'/>">
							<header class="form-header_jy">	
								<dl class="form-title_jy">
									<dt class="machupTitle-dt_jy">전문분야 설정</dt>
								</dl>
							</header>	
							<div class="divformblock_jy">
								<div class="divformblock-contents_jy">
									<div class="EnterInterestArea-fieldset_jy">
										<div class="jobarea_jy mcuEditjabarea_jy">	
											<div class="staticlabel_jy mcuEditstaticlabel_jy">직군</div>
						<!-- 직군선택하기  forEach로 뿌리기-->				
				                            <div class="form-group mcuEditformgroup_jy">
				                                <select class="form-control mcuEditFormctr_jy" id="exampleFormControlSelect1" name="jikgunCode">
				                                 <option value="0">선택하세요</option>
				                                  <c:forEach var="jikgunVo" items="${jikgunList}">
					                                  <option value="${jikgunVo.jikgunCode}">${jikgunVo.jikgunName}</option>
				                                  </c:forEach>
				                                </select>
				                            </div>
						                  </div>
						                        
						                        
						    <!-- 직무 태그들어가야함 foreach-->         
										 <div class="jobarea_jy mcuEditjabarea_jy">	
											<div class="staticlabel_jy mcuEditstaticlabel_jy">직무</div>
											<div class="jikmubtInnerdiv_jy">
												<!-- <div class="collapse navbar-collapse" id="navbarsalary_jy"> -->
												 <div class="collapse navbar-collapse mcuEdit-selectbox_jy" id="navbarjikmu2_jy">	
											        <div class="btn-group btn-group-toggle mcuEdit-btgruop_jy" data-toggle="buttons" id="divbtGroup">
											          <!-- <label class="btn active mcuEdit-jikgunbt_jy">  액티브플래스의 역할확인-->
											          <!-- <label class="btn mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="서버개발자" />서버개발자
											          </label>
											          <label class="btn mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="웹개발자" />웹개발자
											          </label>
											          <label class="btn mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="프론트엔드개발자" />프론트엔드개발자
											          </label>
											          <label class="btn mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="자바개발자" />자바개발자
											          </label>
											          <label class="btn mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="안드로이드개발자" />안드로이드개발자
											          </label>
											           <label class="btn mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="ios개발자" />ios개발자
											          </label>
											          <label class="btn mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="데이터엔지니어" />데이터엔지니어
											          </label> -->
											        </div>
										        </div>
										        
										        <button class="navbar-toggler collapsed mcuEdit-togglebt_jy" type="button" data-toggle="collapse" data-target="#navbarjikmu2_jy" aria-controls="navbarjikmu2_jy" aria-expanded="false" aria-label="Toggle navigation">
													<span class="mcuEditplusbt_jy">+</span>
								  				</button>
								  				
									       </div>
									     </div>    
									      	
						    <!-- 경력들어가야함 -->   
						    				<div class="jobarea_jy mcuEditjabarea_jy">	
												<div class="staticlabel_jy mcuEditstaticlabel_jy">경력</div>                   
					                            <div class="form-group mcuEditformgroup_jy">
					                                <select class="form-control mcuEditFormctr_jy" id="exampleFormControlSelect2">
					                                  <option value=""></option>
					                                  <option value="신입">신입</option>
					                                  <option value="1년">1년</option>
					                                  <option value="2년">2년</option>
					                                  <option value="3년">3년</option>
					                                  <option value="5년이상">5년이상</option>
					                                  <option value="10년이상">10년이상</option>
					                                </select>
					                            </div>
											</div>
										
										</div>
									</div>
								</div>  <!-- 첫번째칸 section-->
					
						<div class="togglediv_jy">		

							<div class="divformblock_jy">
								<div class="divformblock-contents_jy">
									<div class="ectbtgroup_jy">
										<button id="btToggle" class="navbar-toggler collapsed mcuEdittogglebt2_jy" type="button" data-toggle="collapse" data-target="#navbarsalary_jy" aria-controls="navbarmain" aria-expanded="false" aria-label="Toggle navigation">
										<!-- 토글 누를때마다 이름바꾸기 -->	
											<div class="mcuEditmoreInfo_jy" id="moreChoice">선택사항 더보기 
												<i class="icon-arrow_down btarrowDoun_jy :before"></i>
											</div>
						  				</button>
					  					<hr>
										<div class="collapse navbar-collapse" id="navbarsalary_jy">
											<div class="formButton_jy">
												<h6 class="formButton-label_jy mcuEditsal_jy">현재연봉</h6>
												<button type="button" class="btselect_jy mcuEditbtSelect_jy1"  data-toggle="modal" data-target="#salarayModal">
													선택하기
													 <i class="icon-arrow_right :before arrowIcon_jy"></i>
												</button>
											</div>
										
											<div class="formButton_jy">
												<h6 class="formButton-label_jy exceptconOption_jy mcuEditskil_jy">스킬</h6>
												<button type="button" class="btselect_jy mcuEditbtSelect_jy">
													선택하기
													 <i class="icon-arrow_right :before arrowIcon_jy"></i>
												</button>
											</div>
								<!-- 모달?? -->
											<div class="modal fade modalOuter_jy" id="salarayModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
												<div class="modal-dialog modalDialog_jy"  role="document">
													<div class="modal-content modalContent_jy">
														<div class="modal-header modalHeader_jy">
															<h5 class="modal-title modalTitle_jy" id="modalLabel_jy">현재연봉</h5>
															<button type="button" class="close btCloseModal_jy" data-dismiss="modal" aria-label="Close"> 
																<span class="closeIcon_jy" aria-hidden="true">x</span>
															</button>
														</div>
														<div class="modal_body modalBody_jy">
															<div class="modalbodyinnderDiv_jy">
																<div class="modalDivSelect1_jy">
																	<select id="selectPer" name="selectPer">
																		<option value="year">연간</option>
																		<option value="month">월간</option>
																	</select>
																</div>
																<div class="modalDivSelect1_jy">
																	<select id="selectCurrency" name="selectCurrency" onchange="$.setCurrency(this.value)">
																		<option value="KRW">원 (한국)</option> 
																		<option value="JPY">¥ (일본)</option> 
																		<option value="HKD">$ (홍콩)</option> 
																		<option value="SGD">$ (싱가폴)</option> 
																		<option value="TWD">NT$ (대만)</option> 
																	</select>
																</div>
																<div >
																	<input type="text" name="salaryAmount_jy" id="salaryAmount_jy"  placeholder="입력해주세요" value="">
																	<input type="text" name="setting_jy" id="setting_jy"  value="">
																	<span class="spCurecy_jy" id="spCurecy"></span>
																</div>
																
																<div class="modalFooter">
																	<button type="button" id="btFinish_jy" class="btn btn-primary btfinish_jy" data-dismiss="modal">완료</button>
																</div>
															</div>
														</div>
														<!-- <div role="presentation" class=""></div> -->
													</div>
												</div>
											</div> <!-- 모달디브 -->
											<script type="text/javascript">
											
											</script>
											
										 </div> <!-- 토글 디브-->
										 
									</div>	
								</div>
							</div>
						</div>
						
							
							<div class="machupMemEdit-btOk_jy">
								<button type="button" class="btMachupEdit_jy">
									<span class="spbtText">확인</span>
								</button>
							</div>
							
							
						</form>	
					</div>
												
				</div>
			</div> <!-- aside옆 Maindiv -->
			
			
		</div><!-- row -->
	</div><!-- container -->
</section>