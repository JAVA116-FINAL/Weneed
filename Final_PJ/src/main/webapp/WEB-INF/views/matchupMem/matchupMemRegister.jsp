<%@ include file="../inc/top.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 내꺼!! -->  
<!-- 리스트기반 에딧고쳐서 꼭 같이 있어야 함 -->
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemList.css'/>"> 
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemRegister.css'/>">

<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>
<%-- <script type="text/javascript" src = "<c:url value='/resources/js/skills.js'/>"></script> --%>
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
	
	//ajax로 직무테이블에서 불러와서 셋팅한다.
	$.getJikmubt=function(jList){
		var jikmu="";
		
		if(jList.length>0){
			$.each(jList, function(idx,item){
				jikmu+="<label for='ckjikmu"+item.jikmuCode+"' class='btn mcuEdit-jikgunbt_jy' onclick='$.btActivejikmu("+item.jikmuCode+")' id='lb"+item.jikmuCode+"'>";	
				/* jikmu+="<input type='text' name='mcujikmuList["+idx+"].jikmuCode' value='"+item.jikmuCode+"'/>"; */
				jikmu+="<input type='checkbox' name='mcujikmuList["+idx+"].jikmuCode' id='ckjikmu"+item.jikmuCode+"' value='"+item.jikmuCode+"'/>"+item.jikmuName    
				jikmu+="</label>";    
		
			});//each
			$('#divbtGroup').append(jikmu);
		}//if
	}//getjikmu함수
	
	//토글눌러서 더보기,접기
	var bool=true;
	$('#btToggle').click(function(){
		
		if(bool){//
			$('#moreChoice').html('선택사항 접기 <i class="icon-arrow_up btarrowDoun_jy :before"></i>');
			//bool=false;
		}else{
			$('#moreChoice').html('선택사항 더보기 <i class="icon-arrow_down btarrowDoun_jy :before"></i>');
			//bool=true;
		}
		bool=!bool;
	});//더보기 토글		
	
	//연봉정보에서 환율 정보셋팅
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
	
	//연봉정보 셋팅
	$.setSalary=function(){
		//alert($('#salaryAmount_jy').val());
		var str="";
		if($('#selectPer').val()=="year"){
			str+="연간/";	
		}else{
			str+="월간/";
		}
		str+=$('#salaryAmount_jy').val();
		str+=$('#spCurecy').html();
			
		$('#salary').val(str); /* 모달밖에 셋팅 */
	}

	
 	$('#skillsinput_jy').keydown(function(e){
 		if(e.keyCode == 13){
 			event.preventDefault(); 
 	 		$.setSkills();	
 		}
 		
	}); 
	
 	$('#salaryAmount_jy').keydown(function(e){
 		if(e.keyCode == 13){
 			event.preventDefault(); 
 		}
	});
	
	
	//기술 돋보기 클릭 시 생성(모달)
	var j=0;
	$.setSkills=function(){
		var tagstr="";

		if($('#skillsinput_jy').val().length>0){
			//alert($('#skillsinput_jy').val());
			var tag=$('#skillsinput_jy').val()

			tagstr+="<li class='skillsLi' id='tagli"+j+"'>"
			tagstr+="<span class='tags_jy'>"+tag+"</span>"
			tagstr+="<button class='btskillsDel' id='delTags' onClick='$.deltag("+j+")'>x</button>"
			tagstr+="</div>"
			tagstr+="</li>"
			$('#skillsUl').append(tagstr);
			j++
			$('#skillsinput_jy').val("");
		}
	}
	
	//기술 삭제(모달)
	$.deltag=function(delNo){
		$('#tagli'+delNo).remove();	
	}
		
	//스킬-모달 닫을 때 스킬 인풋에 셋팅
	$('#btSkillModal').click(function(){
		/* input박스 지우고 다시 셋팅하기 그리고 모달도 지우기*/
		var list = new Array();
		$(".tags_jy").each(function(index, item){
			list.push($(item).text());
		});
			//alert(list);
			$('#skill').val(list);
	});	
	
	$('#frmMcuRegister').submit(function(){
		//유효성검사 넣기 밸류 없으면 지적해! 2/11추가
		//직군. 직무, 연봉 스킬
		if($('#exampleFormControlSelect1').val()==0){
			alert("직군을 선택하세요");
			event.preventDefault();
		}else if($("input[type='checkbox']:checked").length<1){
			alert("직무를 선택하세요");
			event.preventDefault();
		//}else if($('#salary').val()==""){
		}else if($('#salaryAmount_jy').val()==""){
			alert("급여정보를 입력하세요");
			event.preventDefault();
		}else if($('#skill').val()==""){
			alert("보유기술을 입력해주세요");
			event.preventDefault();
		}
	});
	
	$('#upfile').change(function(){
		if($('#upfile').val().length<1){	
			alert('업로드할 파일을 선택하세요');
			return false;
		}
   		var form = $('#frmUpfile')[0];
	 	var formData = new FormData(form);// FormData 객체 생성
		
		  $.ajax({
			url:"<c:url value='/mypage/fileUpload.do'/>",
			type:"POST",
			dataType:"text",
			data:formData,
			processData: false,
			contentType: false,
			cache: false,
			success:function(resUp){
				//alert(resUp);
				var imgStr="";
				imgStr="<img class='img_member_jy'  src='"+resUp+"'>";
				$('#memberImg').empty();
				$('#memberImg').html(imgStr);
				
			},
			error:function(xhr,status,error){
				alert("error!:"+error);
			}
		}); //ajax
		
	});//change이벤트

});//jquery


</script>

<section class="section doctor-single machupSection_jy">
	<div class="container machupContainer1_jy">
		<div class="row machupRow_jy">
<!-- 프로필구역 -->		
			<aside class="col-lg-3 col-md-6 machupAside_jy" >
				<!-- 프로필상자, 사진업로드?-->
				<div class="profileTitle-dt_jy">프로필</div>
				<div class="profileblock_jy">
					<header class="profileHeader_jy">
						<div id="divupfile" class="member-img_jy">
						 <!-- 폼은 어디갔니 -->
							<div class="memberImg" id="memberImg">
								<c:if test="${empty memVo.fileName }">
									<i class="fas fa-user fa-5x"></i>
								</c:if>
								<c:if test="${!empty memVo.fileName }">
									<img class="img_member_jy" alt="회원이미지" src="<c:url value='/resources/memberImgUpload/${memVo.fileName }'/>">
								</c:if>
							</div>
							<form name="frmUpfile" id="frmUpfile" method="post" enctype="multipart/form-data" action="<c:url value='/mypage/fileUpload.do'/>">
								<input class="inputimg_jy" type="file" name="upfile" id="upfile" accept="image/*" >
								<input type="hidden" name="oldFileName" value="${memVo.fileName}"/>
								<button id="btUpfile" type="button" onclick="$('#upfile').trigger('click');">
									<i class="icon-camera_icon camerai_jy"></i>
								</button>
							</form>
						</div>
						<div class="asideMe_jy">
							<div class="asideName_jy">${memVo.name}</div>
							<div class="asideMail_jy">${memVo.email}</div>
							<div class="asideHp_jy">${memVo.hp}</div>
						</div>
						<button type="button" class="btEdit_jy" value="기본정보수정" onclick="location.href='<c:url value="/mypage/profileEdit.do"/>'">기본정보 수정</button>
					</header>
					<div class="info-block mt-4 infoblock_jy">
						<a href="#" class="profileInfo-a_jy">
							<span class="spWant_jy">원해요</span>
							<strong class="wantCount_jy">${likeCnt }</strong>
						</a>
						<a href="#" class="profileInfo-a_jy">
							<span class="spOpen_jy">열람</span>
							<strong class="openCount">${openResumeCnt }</strong>
						</a>
						<a href="#" class="profileInfo-a_jy">
							<span class="spSuggest">받은제안</span>
							<strong class="suggestCount">${proposalCnt }</strong>
						</a>
					</div>
				</div>
			</aside>		

			<div class="col-lg-9 col-md-6 machupWrapperdiv_jy paddingTop_jy">
				<div class="doctor-details mt-4 mt-lg-0 machupinner_jy">
					<div class="machupSection_jy">
						<form id="frmMcuRegister" class="appoinment-form" method="post" action="<c:url value='/matchupMem/matchupMemRegister.do'/>">
							<!-- <input type="text" name="mcumemVo.mcumemNo" value=""> --> 						
							<input type="hidden" name="mcumemVo.memNo" value="${memVo.memNo}">		 		
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
				                <!-- 전문가번호 -->  
				                               <!-- <input type="text" name="expertiseNo" value=""> -->
				                <!-- 직군코드 -->
				                                <select class="form-control mcuEditFormctr_jy" id="exampleFormControlSelect1" name="expertVo.jikgunCode">
				                                 <option value="0">선택하세요</option>
				                                  <c:forEach var="jikgunVo" items="${jikgunList}">
					                                  <option value="${jikgunVo.jikgunCode}">${jikgunVo.jikgunName}</option>
				                                  </c:forEach>
				                                </select>
				                            </div>
						                  </div>
						    <!-- 직무 태그들어가야함 foreach 직무를 선택할 때마다 근데 이력서 가있어야 하눈데-insert할까..?-->         
										 <div class="jobarea_jy mcuEditjabarea_jy">	
											<div class="staticlabel_jy mcuEditstaticlabel_jy">직무</div>
											<div class="jikmubtInnerdiv_jy">
												<!-- <div class="collapse navbar-collapse" id="navbarsalary_jy"> -->
												 <div class="collapse navbar-collapse mcuEdit-selectbox_jy" id="navbarjikmu2_jy">	
											        <div class="btn-group btn-group-toggle mcuEdit-btgruop_jy" data-toggle="buttons" id="divbtGroup">
											          <!-- 
											          	<label class="btn active mcuEdit-jikgunbt_jy">
											            <input type="checkbox" name="jikmuName" value="서버개발자" />서버개발자
											          	</label>
											          -->
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
					            		  <!--경력-->            
				                                <select class="form-control mcuEditFormctr_jy" name="expertVo.career" id="career">
				                                  <option value="신입">신입</option>
				                                  <option value="1">1년</option>
				                                  <option value="2">2년</option>
				                                  <option value="3">3년</option>
				                                  <option value="4">4년이상</option>
				                                  <option value="5">5년이상</option>
				                                  <option value="6">6년이상</option>
				                                  <option value="7">7년이상</option>
				                                  <option value="8">8년이상</option>
				                                  <option value="9">9년이상</option>
				                                  <option value="10이상">10년이상</option>
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
										<!-- 연봉 -->
													<span class="spSalary_jy" id="spSalary_jy">
														<input type="text" name="expertVo.salary" readonly="readonly" id="salary" placeholder="선택하기">
													</span>
													<button type="button" class="btselect_jy mcuEditbtSelect_jy1"  data-toggle="modal" data-target="#salarayModal">
														<i class="icon-arrow_right :before arrowIcon_jy"></i>
													</button>
												</div>
											
												<div class="formButton_jy">
													<h6 class="formButton-label_jy exceptconOption_jy mcuEditskil_jy">스킬</h6>
										<!-- 스킬 -->	
													<span class="spSkills_jy" id="spSkills_jy">
														<input type="text" name="expertVo.skill" readonly="readonly" id="skill" placeholder="선택하기" value="">
													</span>
													<button type="button" class="btselect_jy mcuEditbtSelect_jy" data-toggle="modal" data-target="#skillsModal">	
														<i class="icon-arrow_right :before arrowIcon_jy"></i>
													</button>
												</div>
									<!-- 모달1 salary -->
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
																	<div class="MosaldivInput_jy">
																		<input type="text" name="salaryAmount_jy" id="salaryAmount_jy"  placeholder="입력해주세요" value="">
																		<span class="spCurecy_jy" id="spCurecy">만원</span>
																	</div>
																	
																	<div class="modalFooter">
																		<button type="button" id="btFinish_jy" class="btn btn-primary btfinish_jy" data-dismiss="modal" onClick="$.setSalary()">완료</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div> <!-- 모달디브 -->
										<!-- 모달2 skills-->
												<div class="modal fade modalOuter_jy" id="skillsModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
													<div class="modal-dialog modalDialog_jy"  role="document">
														<div class="modal-content modalContent_jy">
															<div class="modal-header modalHeader_jy">
																<h5 class="modal-title modalTitle_jy" id="modalLabel_jy">스킬선택</h5>
																<button type="button" class="close btCloseModal_jy" id="btSkillModal" data-dismiss="modal" aria-label="Close"> 
																	<span class="closeIcon_jy" aria-hidden="true">x</span>
																</button>
															</div>
															<div class="modal_body modalBody_jy">
																<div class="modalbodyinnderDiv_jy">
																	<div class="modalDivSelect1_jy">
																		<label for="skillsinput_jy" >스킬</label>
																		<div class="skillinputDiv" onClick="$.setSkills()">																	
																			<input type="hidden" >
																			<input type="text" name="skillsinput_jy" id="skillsinput_jy" placeholder="보유스킬을 작성해주세요" value="">
																			<i class="icon-search"></i>
																		</div>
																	</div>
																	<div class="skillsUlDiv">
																		<ul class="skillsUl" id="skillsUl">
																		</ul>
																	</div>
																	<div class="modalFooter"></div>
																	</div>
																</div>
															</div>
														</div>
													</div> <!-- 모달디브 -->
												 </div> <!-- 토글 디브-->
											</div>	
										</div>
									</div>
								</div>
								<div class="machupMemEdit-btOk_jy mcuRegisterdiv">
									<button type="submit" class="btMachupEdit_jy mcuRegisterbt">
										<span class="spbtText">다음단계</span> <!-- 이때. 전문가번호, 직무List,매치업번호 insert=>이력서 인서트한다음에 매치업에 업뎃 -->
									</button>
								</div> 
							</form> 	
						</div>
												
					</div>
				</div> <!-- aside옆 Maindiv -->
			
			
		</div><!-- row -->
	</div><!-- container -->
		
</section>