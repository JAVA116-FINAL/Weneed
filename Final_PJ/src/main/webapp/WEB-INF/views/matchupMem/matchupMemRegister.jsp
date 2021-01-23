<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- 내꺼!! -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!-- 리스트기반 에딧고쳐서 꼭 같이 있어야 함 -->
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemList.css'/>"> 
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemRegister.css'/>">

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
							<div class="asideName_jy">이자연</div>
							<div class="asideMail_jy">nature1119@naver.com</div>
							<div class="asideHp_jy">010-9524-4545</div>
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
						<form id="#" class="appoinment-form" method="post" action="<c:url value='/machupMem/machupMemEdit.do'/>">
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
						<!-- 직군선택하기  forEach로 뿌리기 임포트-->				
				                            <div class="form-group mcuEditformgroup_jy">
				                                <select class="form-control mcuEditFormctr_jy" id="exampleFormControlSelect1">
				                                  <option>개발</option>
				                                  <option>경영 비즈니스</option>
				                                  <option>마케팅 광고</option>
				                                </select>
				                            </div>
						                  </div>
						                        
						    <!-- 직무 태그들어가야함 foreach 임포트-->         
										 <div class="jobarea_jy mcuEditjabarea_jy">	
											<div class="staticlabel_jy mcuEditstaticlabel_jy">직무</div>
											<div class="jikmubtInnerdiv_jy">
												<!-- <div class="collapse navbar-collapse" id="navbarsalary_jy"> -->
												 <div class="collapse navbar-collapse mcuEdit-selectbox_jy" id="navbarjikmu2_jy">	
											        <div class="btn-group btn-group-toggle mcuEdit-btgruop_jy" data-toggle="buttons">
											          <label class="btn active mcuEdit-jikgunbt_jy">
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
											          </label>
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
					                                  <option>신입</option>
					                                  <option>1년</option>
					                                  <option>2년</option>
					                                  <option>3년</option>
					                                  <option>5년이상</option>
					                                  <option>10년이상</option>
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
										<button class="navbar-toggler collapsed mcuEdittogglebt2_jy" type="button" data-toggle="collapse" data-target="#navbarsalary_jy" aria-controls="navbarmain" aria-expanded="false" aria-label="Toggle navigation">
										<!-- 토글 누를때마다 이름바꾸기 -->	
											<div class="mcuEditmoreInfo_jy">선택사항 더보기
												<i class="icon-arrow_down btarrowDoun_jy :before"></i>
											</div>
						  				</button>
					  					<hr>
										<div class="collapse navbar-collapse" id="navbarsalary_jy">
											<div class="formButton_jy">
												<h6 class="formButton-label_jy mcuEditsal_jy">현재연봉</h6>
												<button type="button" class="btselect_jy mcuEditbtSelect_jy1">
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