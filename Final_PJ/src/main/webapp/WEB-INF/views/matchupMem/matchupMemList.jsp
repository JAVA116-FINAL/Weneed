<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp" %>
<!-- 내꺼!! -->  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemRegister.css'/>"> 
<link rel="stylesheet" href="<c:url value='/resources/css/matchupMemList.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-3.5.1.min.js'/>"></script>
<script type="text/javascript">

$(function(){
	$('.footerInfo').show();
	$('.footerWarn').hide();
	
	$.setChageMatchupResume=function(resumeNo){
		$('#getResumeNo').val(resumeNo);
		$('#btsetResume_jy').attr('disabled', false);
		$('.footerInfo').hide();
		$('.footerWarn').show();
	}
	
	$.setResume=function(){
		/* 매치업이력서가 같지 않으면 */
		if($('#getMatchupResumeNo').val()!=$('#getResumeNo').val()){
			 $.ajax({
					url:"<c:url value='/matchupMem/matchupMemChangeResume.do'/>",
					type:"get",
					data:{"resumeNo":$('#getResumeNo').val(),"mcumemNo":$('#getMatchupMemNo').val()},
					dataType:"json",
					success:function(resumechangeRes){
						//alert(resumechangeRes);
						$.reload();
					},
					error:function(xhr,status,error){
						alert("error!:"+error);
					}
			});//ajax	
		}//if
	}//setResume
	
	//페이지 새로고침
	$.reload=function(){
		window.location.reload();	
	}
	
	//추천인 업뎃하기 0212 업뎃
	$.setRefName=function(mcumemNo){
		if($('#refNameInput_jy').val()!=""){
			$.ajax({
				url:"<c:url value='/matchupMem/matchupRefNameUpdate.do'/>",
				type:"get",
				data:{"mcumemNo":mcumemNo, "refName":$('#refNameInput_jy').val() },
				dataType:"json",
				success:function(addRefName){
					//alert(addRefName);
					$('.refName').html(addRefName.refName);
				},
				error:function(xhr,status,error){
					alert("error:"+error);
				}
			});//ajax	
		}
	}//추천인업뎃함수
	
	$.jobFlag=function(mcumemNo){
		$.ajax({
			url:"<c:url value='/matchupMem/matchupjobFlagUpdate.do'/>",
			type:"get",
			data:{"mcumemNo":mcumemNo ,"jobsearchFlag": $('#jobSearchFlag').val()},
			dataType:"json",
			success:function(resFlag){
				//alert(resFlag);
				$('#jobSearchFlag').val(resFlag.jobsearchFlag);
				if(resFlag.resumeopenFlag=='Y'){
					$('#resumeOpenFlag').html("이력서 공개중");	
				}else{
					$('#resumeOpenFlag').html("이력서 비공개");
				}
			},
			error:function(xhr,status,error){
				alert("error:"+error);
			}
		});
	}
	
	$.getComName=function(){
		$.ajax({
			url:"<c:url value='/matchupMem/matchupSearchCom.do'/>",
			type:"get",
			data:"comName="+$('#excomInput_jy').val(),
			dataType:"json",
			success:function(resComInfo){
				//alert(resComInfo);
				var comList="";
				if(resComInfo.length>0){
					$.each(resComInfo,function(idx,item){
						comList+="<li class='searchComListLi' >"; 
						comList+="<button type='button' class='searchComListbt' title='"+item.INDUSTRY+"' onclick='$.setExCom("+item.MCUCOM_NO+")'>"+item.COM_NAME+"</button>";													  
						comList+="</li>";
					});
					//alert(comList);
					$('#searchComListUl').empty();
					$('#searchComListUl').append(comList);
				}//if
			},
			error:function(xhr,status,error){
				alert("error:",error)
			}
		});//ajax
	}//회사이름뿌려주기 함수
	//제외기업등록하기
	$.setExCom=function(mcuComNo){
		$('#searchComListUl').empty();
		$.ajax({
			url:"<c:url value='/matchupMem/matchupExComRegister.do'/>",
			type:"get",
			data:{"mcumemNo":$('#mcumemNoInput').val(), "mcucomNo":mcuComNo},
			dataType:"json",
			success:function(ExcomRes){
				//alert(ExcomRes);
				var addExCom="";
				if(ExcomRes=="-1"){
					alert('제외기업이 이미 등록되었습니다.');
				}else if(ExcomRes=="1"){
					//alert(mcuComNo);
					$.addExCombt(mcuComNo);
				}else{
					alert("제외기업 등록실패");
				}
			},
			error:function(xhr,status,error){
				alert("error:"+error);
			}
		});
	}
	
	$.delExCom=function(mcuComNo){
		$.ajax({
			url:"<c:url value='/matchupMem/matchupExComDelete.do'/>",
			type:"get",
			data:{"mcumemNo":$('#mcumemNoInput').val(), "mcucomNo":mcuComNo},
			dataType:"json",
			success:function(delRes){
				//alert(res);
				if(delRes>0){
					$('#excomli'+mcuComNo).remove();
					$('#spExcom'+mcuComNo).remove();
				}
			},	
			error:function(xhr,status,error){
				alert(error);
			}
		});
	}
	
	$.addExCombt=function(mcuComNo){
		$.ajax({
			url:"<c:url value='/matchupMem/matchupExComSelectView.do'/>",
			type:"get",
			data:{"mcumemNo":$('#mcumemNoInput').val(), "mcucomNo":mcuComNo},
			dataType:"json",
			success:function(getView){
				//alert(getView);
				var addExcom="";
				var addExcomdiv="";
				addExcom+="<li class='excomli' id='excomli"+getView.MCUCOM_NO+"'>"; 
				addExcom+="<span class='excomName'>"+getView.COM_NAME+"</span>";
				addExcom+="<input type='hidden' value='"+getView.MCUCOM_NO +"'>";
				addExcom+="<button type='button' class='excomDelbt' onClick='$.delExCom("+getView.MCUCOM_NO+")'>x</button>"; 
				addExcom+="</li>";	
				$('#excomUl').append(addExcom);
				
				$('.exselectbtName_jy').empty();
				addExcomdiv+="<li class='spExComList_jy' id='spExcom"+getView.MCUCOM_NO+"'>"+getView.COM_NAME+"</li>";
				$('#excomulOut').append(addExcomdiv);
			},	
			error:function(xhr,status,error){
				alert(error);
			}
		});
		
	}
	
		
});

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
						<div class="member-img_jy" style='background-image: url("https://s3.ap-northeast-2.amazonaws.com/wanted-public/profile_default.png"), url("https://static.wanted.co.kr/images/profile_default.png")'>
						 <!-- 폼은 어디갔니 -->
							<input class="inputimg_jy" type="file" accept="image/*">
							<i class="icon-camera_icon camerai_jy"></i> 
							
						</div>
						<div class="asideMe_jy">
							<div class="asideName_jy">${memVo.name}</div>
							<div class="asideMail_jy">${memVo.email }</div>
							<div class="asideHp_jy">${memVo.hp }</div>
						</div>
						<%-- <button type="button" class="btEdit_jy" value="기본정보수정" onClick="location.href='<c:if url value="/#"/>'">기본정보 수정</button> --%>
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
			<%-- ${mDetailsList } --%> 
			
			<div class="col-lg-9 col-md-6 machupWrapperdiv_jy">
				<div class="doctor-details mt-4 mt-lg-0 machupinner_jy">
					<c:if test="${!empty mDetailsList}">
						<c:forEach var="mVo" items="${mDetailsList}">
		<!-- 매치업 번호 -->
							<input type="hidden" id="mcumemNoInput" value="${mVo.MMDetailsVo.mcumemNo}">
							<div class="text-md machupTitlediv_jy">
		<!-- 이력서 글자수세서넣기/ 간단소개글이 없으면 버튼-->
								<c:if test="${empty mVo.MMDetailsVo.resumeIntroduce}">
									<span class="introProposalP_jy redSpan_jy">간단 소개글 등록을 완료하면, 인사담당자가 직접 면접을 제안합니다.</span>
									<button type="button" class="btEditIntro" onClick="location.href='<c:url value="/matchupMem/matchupMemEdit2.do?resumeNo=${mVo.MMDetailsVo.resumeNo}&eduNo=${mVo.MMDetailsVo.eduNo}&careerNo=${mVo.MMDetailsVo.careerNo}"/>'">입력하기</button>
									
								</c:if>	
								<c:if test="${!empty mVo.MMDetailsVo.resumeIntroduce}">
									<p class="resumeLenth-p_jy">이력서 글자 수 : <span class="resumeLenth-sp_jy">${mVo.MMDetailsVo.resumeLength }자 </span> / 최소 400자  </p>
									<p class="static-label_jy">이제 면접제안을 받아보실 수 있습니다. 최신 정보를 유지하고 경쟁력을 높이세요. </p>
								</c:if>	
							</div>	
						
							<div class="machupSection_jy">
								<header class="form-header_jy">	
									<dl class="form-title_jy">
										<dt class="machupTitle-dt_jy">기본 이력서</dt>
									</dl>
								</header>	
								
								<div class="divformblock_jy">
									<div class="divformblock-contents_jy">
										<div>
											<div class="staticlabel_jy resume-p_jy">기본 이력서 선택</div>
											<div class="staticbody_jy">
												<div class="staticbodyinnerdiv_jy">
					<!-- 모달만들어서 넣기 ajax로 이력서리스트만들어서 -->
													<button class="DefaultResumeSelector-resumeLang ResumeSelector-button_jy" type="button" data-toggle="modal" data-target="#resumeListModal">
														<div class="resumeLand_jy">
															<c:if test="${mVo.MMDetailsVo.langFlag=='KR'}">한</c:if>
															<c:if test="${mVo.MMDetailsVo.langFlag=='EN'}">A</c:if>
															<c:if test="${mVo.MMDetailsVo.langFlag=='CH'}">文</c:if>
															<c:if test="${mVo.MMDetailsVo.langFlag=='JP'}">あ</c:if>
														</div>
														<span class="innersp_jy">${mVo.MMDetailsVo.resumeTitle} </span>
														<span class="textbt_jy">▼</span> 
													</button>
												 </div>
											 </div>
											
											<div class="MainResume-fieldset_jy">
												<div class="static-label_jy">학교</div>
												<div class="static-body_jy">
													<span class="ResumeEntry-major_jy innersp_jy :before">${mVo.MMDetailsVo.eduName}</span>
													<span class="distributor_jy">|</span> 
													<span class="ResumeEintry-major_jy innersp_jy">
														<c:if test="${empty mVo.MMDetailsVo.eduMajor}"><span class="redSpan_jy">전공미입력</span></c:if>
														<c:if test="${!empty mVo.MMDetailsVo.eduMajor}">${mVo.MMDetailsVo.eduMajor}</c:if>
													</span>
												</div>
												<div class="static-label_jy">직장</div>
												<div class="static-body_jy">
													<span class="ResumeEntry-major_jy innersp_jy :before">${mVo.MMDetailsVo.careerName}</span>
													<span class="distributor_jy">|</span> 
													<span class="ResumeEintry-major_jy innersp_jy"> 
														<c:if test="${empty mVo.MMDetailsVo.careerDep}"> <span class="redSpan_jy">직책미입력</span> </c:if>
														<c:if test="${!empty mVo.MMDetailsVo.careerDep}">${mVo.MMDetailsVo.careerDep}</c:if>
													</span>
												</div>
												<!-- 연필클릭하면 이력서 수정페이지 이동-->
												<a href="<c:url value='/resume/resumeDetail.do?resumeNo=${mVo.MMDetailsVo.resumeNo }'/>" class="pendil1-a_jy"> 
													<i class="icon-edit pencilEdit_jy2"></i>
												</a>
											</div> <!-- 필드셋디브 -->
											<div class="MainResume-about_jy">
												<c:if test="${empty mVo.MMDetailsVo.resumeIntroduce}"> <span class="redSpan_jy">간단 소개글 미입력</span></c:if>
												<c:if test="${!empty mVo.MMDetailsVo.resumeIntroduce}">${mVo.MMDetailsVo.resumeIntroduce} </c:if>
											</div>									
										</div>
									</div>
								</div>
							</div>	
								
							<div class="machupSection_jy">
								<header class="form-header_jy">	
									<dl class="form-title_jy">
										<dt class="machupTitle-dt_jy">전문분야 설정</dt>
									</dl>
								</header>	
								<div class="divformblock_jy">
									<div class="divformblock-contents_jy">
										<div class="EnterInterestArea-fieldset_jy">
											<div class="jobarea_jy">	
												<div class="staticlabel_jy">직군</div>
												<div class="staticbody_jy ">${mVo.MMDetailsVo.jikgunName}</div>
											</div>
											<div class="jobarea_jy">	
												<div class="staticlabel_jy">직무</div>
												<div class="staticbody_jy ">
													<c:if test="${!empty jikmuList}">
														<c:set var="i" value="0"></c:set>
														<c:forEach var="map" items="${jikmuList }">
															<c:if test="${i!=0}">,</c:if>
															${map['JIKMU_NAME']}
															<c:set var="i" value="${i+1 }"></c:set>
														</c:forEach>													
													</c:if>
												
												</div>
											</div>
											<div class="jobarea_jy">	
												<div class="staticlabel_jy">경력</div>
												<div class="staticbody_jy">${mVo.MMDetailsVo.career} <c:if test="${ mVo.MMDetailsVo.career ne '신입'}">년</c:if> </div>
											</div>
											<div class="jobarea_jy">	
												<div class="staticlabel_jy">현재연봉</div>
												<div class="staticbody_jy">${mVo.MMDetailsVo.salary}</div>
											</div>
											<div class="jobarea_jy">	
												<div class="staticlabel_jy">스킬</div>
												<div class="staticbody_jy">${mVo.MMDetailsVo.skill}</div>
											</div>
										<!-- 매치업 전문분야 편집하기 이동하면 좋을듯 -->
											<a href="<c:url value='/matchupMem/matchupMemEdit1.do?expertiseNo=${mVo.MMDetailsVo.expertiseNo}'/>" class="pendil2-a_jy"> 
												<i class="icon-edit pencilEdit_jy1"></i>
											</a>
										</div>
									</div>
								</div>
								
								<div class="divformblock_jy">
									<div class="divformblock-contents_jy">
										<div class="ectbtgroup_jy">
											<div class="formButton_jy">
												<h6 class="formButton-label_jy">추천인 선택</h6>
												<button type="button" class="btselect_jy"  data-toggle="modal" data-target="#refModal">
													
												 	<c:if test="${!empty mVo.MMDetailsVo.refName}">
														<span class="spRefName_jy refName" id="refName">${mVo.MMDetailsVo.refName}</span>
													</c:if>	
													<c:if test="${empty mVo.MMDetailsVo.refName}">
														<span class="exselectbtName_jy refName" id="refName">선택하기</span>
													</c:if>
													 
													 <i class="icon-arrow_right :before arrowIcon_jy"></i>
												</button>
											</div>
											<div class="formButton_jy">
												<h6 class="formButton-label_jy exceptconOption_jy">제외기업설정</h6>
												<button type="button" class="btselect_jy"  data-toggle="modal" data-target="#excomModal">
													<div class="excomdiv" id="excomdiv">
														<ul class="excomulOut" id="excomulOut">
															<c:if test="${!empty mVo.mcuexList}">
																<c:forEach var="map" items="${mVo.mcuexList}">
																	<li class="spExComList_jy" id="spExcom${map['MCUCOM_NO'] }">${map['COM_NAME']}</li>
																</c:forEach>
															</c:if>	
															<c:if test="${empty mVo.mcuexList}">
																<li class="exselectbtName_jy">선택하기</li>
															</c:if>
														</ul>	
													</div>
														<i class="icon-arrow_right :before arrowIcon_jy excomiconjy"></i>
												</button>
											</div>
										<!-- 기타옵션  -->		
											<div class="inputgroup_jy">
												<h6 class="InputGroup-label_jy"></h6>
												<div class="InputGroup-body_jy">
													<div class="JobSearchIntentionSelector-wrapper_jy">
														구직여부 설정
														<select class="JobSearchIntentionSelector-select_jy" id="jobSearchFlag" onchange="$.jobFlag(${mVo.MMDetailsVo.mcumemNo})">
															<option value="Y" <c:if test="${mVo.MMDetailsVo.jobsearchFlag eq 'Y'}">selected="selected"</c:if>> 현재 구직 중</option>
															<option value="N" <c:if test="${mVo.MMDetailsVo.jobsearchFlag eq 'N'}">selected="selected"</c:if>>전혀 관심 없음</option>
														</select>
													</div>
													<span class="distributor_jy">|</span>
													<span class="JobSearchIntentionSelector-status_jy" id="resumeOpenFlag">
														<c:if test="${mVo.MMDetailsVo.resumeopenFlag eq 'Y'}">이력서 공개중</c:if>
														<c:if test="${mVo.MMDetailsVo.resumeopenFlag eq 'N'}">이력서 비공개</c:if>
													</span>
												</div>
											</div> <!--기타옵션 inputdiv  -->
		
										</div>	
									</div>
								</div>
							</div>
							
							<!-- 모달1 ResumeList -->
							<div class="modal fade modalOuter2_jy" id="resumeListModal"  tabindex="-1" role="dialog" aria-labelledby="matchupModalLabel" aria-hidden="true"> 
								<div class="modal-dialog modalDialog2_jy"  role="document">
									<div class="modal-content modalContent2_jy">
										<div class="modal-header modalHeader2_jy">
											<h5 class="modal-title modalTitle2_jy" id="modalLabel2_jy">기본 이력서 선택</h5>
											<button type="button" class="close btCloseModal_jy" data-dismiss="modal" aria-label="Close"> 
												<span class="closeIcon_jy" aria-hidden="true">x</span>
											</button>
										</div>
										<div class="modal_body modalBody2_jy">
											<div class="rsumeListDiv_jy">
												<ul class="resumeListUl" id="rerumeListUl">
												<!-- 포이치로 돌리기 -->
													<c:if test="${!empty resumeList}">
														<c:forEach var="rVo" items="${resumeList}">
															<c:if test="${rVo.resumeUpfileflag eq 'N'}">
																<li class="resumeListLi"> 
																	<button class="resumeSelectbt" type="button" onClick="$.setChageMatchupResume(${rVo.resumeNo})">
																		<header class="madalResumeListHeader">
																			<div class="status">
																				<c:if test="${rVo.tempFlag eq 'Y'}">작성중</c:if>
																				<c:if test="${rVo.tempFlag eq 'N'}">작성완료</c:if>
																			</div>
																			<div class="resumeLang">
																				<c:if test="${rVo.langFlag eq 'KR'}">한</c:if>
																				<c:if test="${rVo.langFlag eq 'EN'}">A</c:if>
																				<c:if test="${rVo.langFlag eq 'CH'}">文</c:if>
																				<c:if test="${rVo.langFlag eq 'JP'}">あ</c:if>
																			</div>
																			<div class="isMatchupResume">
																				<c:if test="${rVo.resumeNo eq  mVo.MMDetailsVo.resumeNo }">매치업</c:if>
																			</div>
																		</header>
																		<dl class="resumeInfoDl">
																			<dt class="resumeInfoDt">${rVo.resumeTitle}</dt>
																			<dt class="resumeRegdtae">
																				<fmt:formatDate value="${rVo.resumeRegdate}" pattern="yyyy-MM-dd"/>
																			</dt>
																		</dl>
																	</button>
																</li>
															</c:if>	
														</c:forEach>	
													</c:if>		
												</ul>
											</div>
											<div class="modalFooter">
													<p class="footerInfo">기본 이력서는 위니드 이력서만 선택 가능합니다. </p>
													<p class="footerWarn redSpan_jy">선택된 이력서의 내용으로 프로필이 교체됩니다. </p>
												<input type="hidden" id="getResumeNo" value="">
												<input type="hidden" id="getMatchupResumeNo" value="${mVo.MMDetailsVo.resumeNo}">
												<input type="hidden" id="getMatchupMemNo" value="${mVo.MMDetailsVo.mcumemNo}">
												<button type="button" id="btsetResume_jy" disabled="disabled" class="btn btn-primary btSetResume_jy" data-dismiss="modal" onClick="$.setResume()">선택완료</button>
											</div>
										</div>
									</div>
								</div>
							</div> <!-- 모달디브 -->
						<!-- 모달2 추천인 -->
							<div class="modal fade modalOuter_jy refModalOuter_jy" id="refModal"  tabindex="-1" role="dialog" aria-labelledby="refModalLabel" aria-hidden="true"> 
								<div class="modal-dialog modalDialog_jy refModalD_jy"  role="document">
									<div class="modal-content modalContent_jy">
										<div class="modal-header modalHeader_jy">
											<h5 class="modal-title modalrefTitle_jy" id="modalLabel_jy">추천인 입력   </h5>
											<button type="button" class="close btCloseModal_jy" id="btRefModal_jy" data-dismiss="modal" aria-label="Close"> 
												<span class="closeIcon_jy" aria-hidden="true">x</span>
											</button>
										</div>
										<div class="modal_body modalBody_jy">
											<div class="modalbodyinnderDiv_jy">
												<div class="modalDivSelect1_jy">
													<div class="ModaldivInput_jy listModalDiv">
														<i class="icon-search"></i>
														<input type="hidden" value="">
														<input type="text" name="refNameInput_jy" id="refNameInput_jy" placeholder="추천인을 입력해주세요" value="${mVo.MMDetailsVo.refName}">
													</div>
													<p class="refModalP_jy">‘매치업’ 서비스를 통해 채용 확정 시 선택된 기본 추천인에게 추천 보상금이 지급됩니다.</p>
													<div class="modalFooter">
														<button type="button" id="btFinish_jy" class="btn btn-primary btfinish_jy fullbt_jy" data-dismiss="modal" onClick="$.setRefName(${mVo.MMDetailsVo.mcumemNo})">입력완료</button>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						<!-- 모달디브 -->
						<!-- 모달2 직장-->
							<div class="modal fade modalOuter_jy" id="excomModal"  tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"> 
								<div class="modal-dialog modalDialog_jy excomModalDialog_jy"  role="document">
									<div class="modal-content modalContent_jy">
										<div class="modal-header modalHeader_jy">
											<h5 class="modal-title modalTitle_jy" id="modalLabel_jy">추천 제외기업</h5>
											<button type="button" class="close btCloseModal_jy" id="btExcomModal" data-dismiss="modal" aria-label="Close"> 
												<span class="closeIcon_jy" aria-hidden="true">x</span>
											</button>
										</div>
										<div class="modal_body modalBody_jy">
											<div class="modalbodyinnderDiv_jy">
												<div class="modalDivSelect1_jy">
										<!-- c:if로 돌려야할듯 mcuexList-->
										<!-- 클릭하면 여기 추가 -->		
													<div class="excomTagHeader">
														<ul class="excomUl" id="excomUl">
															<c:forEach var="map" items="${mVo.mcuexList}">
																<li class="excomli" id="excomli${map['MCUCOM_NO']}"> 
																	<span class="excomName">${map['COM_NAME']}</span>
																	<input type="hidden" value="${map['MCUCOM_NO']}">
																	<button type="button" class="excomDelbt" onClick="$.delExCom(${map['MCUCOM_NO']})">x</button> 
																</li>
															</c:forEach>
															
														</ul>
													</div>
										<!-- 1. 입력후 엔터나 버튼클릭하면 like로 조회 -->	
													<div class="excominputDiv listModalDiv">																	
														<input type="text" name="excomInput_jy" id="excomInput_jy" placeholder="회사명을 입력해주세요" value="" >
														<span class="searchBox_jy" onclick="$.getComName()">
															<i class="icon-search"></i>
														</span>
													</div>
										<!-- 2.검색후 조회되는 리스트 뿌려준다. -->
													<ul class="searchComListUl" id="searchComListUl">
													  <!-- <li class="searchComListLi" > 
														<button type="button" class="searchComListbt" onclick="">정육각</button>													  
													  </li> -->
													</ul>

													<div class="modalFooter">
														<%-- <button type="button" id="btFinish_jy" class="btn btn-primary btfinish_jy fullbt_jy" data-dismiss="modal" onClick="$.setExcom(${mVo.MMDetailsVo.mcumemNo})">입력완료</button> --%>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div> <!-- 모달디브 -->
							
						</c:forEach>
					</c:if>
				
				</div>
			</div> <!-- aside옆 Maindiv -->
			
			
		</div><!-- row -->
	</div><!-- container -->
</section>

<%-- <%@ include file="../inc/bottom.jsp" %> --%>