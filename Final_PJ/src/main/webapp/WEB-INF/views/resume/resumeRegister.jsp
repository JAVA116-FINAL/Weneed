<%@ include file="../inc/top.jsp" %>

<!-- 내꺼!! -->  
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/resumeRegister.css'/>">
<script type="text/javascript" src="<c:url value='/resources/js/jquery-ui.min.js'/>"></script>


<script type="text/javascript">


$(function(){	
	
	//var careerNo=0;//자식 li append 할때 위치 잡기위해 필요
	var c=0;//경력카운트
	var a=0;//성과 카운트
	var e=0;//edu 카운트
	var ai=0;//기타 활동사항 카운트
	var l=0;//외국어 카운트
	var t=0;//어학점수 카운트
	var lk=0;//링크 카운트
	 $('.soltableli_jy').sortable();
	 $('.soltableli_jy').disableSelection();
	 
	 //작성완료 버튼을 누르면 글자수 체크, 임시 플래그N,
	 //유효성검사, 날짜? 
	  $('.buttons_jy').click(function(){
		//글자수체크하고 저장 하기(인풋값만, 셀렉트,)
		  var count=0;
		  var list = new Array();
			$("input[type=text]").each(function(index, item){
			//list.push($(item).val());
			count+=$(item).val().length;
			});
			count+=$('#taResumeIntro_jy').val().length;
			//alert(count);
			$('#resumeLength').val(count);
		  
		  if($(this).attr("id")=="btRealSave"){
				if(count<400){
					alert("작성한 글자수: "+count+", 400자 이상 작성해야 작성을 완료할 수 있습니다.");
					return false;
				}
			
			    $('#tempFlag').val("N");
			}else{
				$('#tempFlag').val("Y");
			} 
		$('form[name=frmRegister]').submit();
	 }); 

	 
	//힝목추가버튼누르면
	 $('.btAdd_jy').click(function(){
		var resumeNo= ${resumeVo.resumeNo}
	 
		 if($(this).attr("id")=="btcareer_jy"){//경력사항
			 $.ajax({
				url:"<c:url value='/career/careerRegister.do'/>",
				type:"get",
				data: "resumeNo="+resumeNo,
				dataType:"json",
				success:function(res){
					//alert(res);
					if(res!=null){
						$.makeForm1(res);		
					}				
				},
				error:function(xhr,status,error){
					alert("error:"+error);
				}
			});
		 }else if($(this).attr("id")=="btEdu_jy"){//학력사항
			 $.ajax({
				url:"<c:url value='/education/educationRegister.do'/>",
				type:"get",
				data: "resumeNo="+ resumeNo,
				dataType:"json",
				success:function(resEdu){
					//alert(resEdu);
					if(resEdu!=null){
						$.makeForm3(resEdu);		
					}				
				},
				error:function(xhr,status,error){
					alert("error!!:"+error);
				}
			});//ajax
		}else if($(this).attr("id")=="btAddInfo_jy"){//기타활동사항
			$.ajax({
				url:"<c:url value='/addinformatiod/addinformatiodRegister.do'/>",
				type:"get",
				data:"resumeNo="+resumeNo,
				dataType:"json",
				success:function(resAdd){
					//alert(resAdd);
					if(resAdd!=null){
						$.makeForm4(resAdd);
					}
				},
				error:function(xhr,status,error){
					alert("error!!:"+error);
				}
			});//ajax
		}else if($(this).attr("id")=="btlang_jy"){//외국어
			$.ajax({
			url:"<c:url value='/languages/languagesRegister.do'/>",
			type:"get",
			data:"resumeNo="+resumeNo,
			dataType:"json",
			success:function(resLang){
				//alert(resLang);
			   if(resLang!=null){
						$.makeForm5(resLang);
					}
				},
				error:function(xhr,status,error){
					alert("error!!:"+error);
				}
			});//ajax
			
		}else if($(this).attr("id")=="btlink_jy"){//링크추가
			$.ajax({
				url:"<c:url value='/link/linkRegister.do'/>",
				type:"get",
				data:"resumeNo="+resumeNo,
				dataType:"json",
				success:function(resLink){
					//alert(resLink);
				    if(resLink!=null){
						$.makeForm7(resLink);
					}
				},
			error:function(xhr,status,error){
					alert("error!!:"+error);
				}
			});//ajax
			
			
			
		}//if
		 
	 });//클릭이벤트		
	
	//성과추가버튼누르면
	 //$(document).on("click","#btach_jy", function(){
	 $(document).on("click",".btAdd2_jy", function(){
		 if($(this).attr("id")=="btach_jy"){
			 $.ajax({
					url:"<c:url value='/achievement/achievementRegister.do'/>",
					type:"get",
					data: "careerNo="+$(this).siblings('#careerNo').val(),
					dataType:"json",
					success:function(resAch){
						//alert(resAch);
						 if(resAch!=null){
							$.makeForm2(resAch);
						 }
					},
					error:function(xhr,status,error){
						alert(error);
					}
			   });
		 }else if($(this).attr("id")=="btlangTest_jy"){
			 $.ajax({
					url:"<c:url value='/languagestest/languagestestRegister.do'/>",
					type:"get",
					data: "langNo="+$(this).siblings('#langNo').val(),
					dataType:"json",
					success:function(resTest){
						//alert(resTest);
						 if(resTest!=null){
							$.makeForm6(resTest);
						 } 
					},
					error:function(xhr,status,error){
						alert("error:"+error);
					}
			   });//ajax
		 }//if
		 
		 
	 });//이벤트 2 클릭하면
		
	//디브를 넣을까말까... 	
	 $.makeForm1=function(res){
			 var crrStr="";	 
			 crrStr+="<li class='crrLi_jy' id='crr"+res.careerNo+"'>";
			 //crrStr+="<form method='post' name='frmCrr' id='frmCrr'>";			 
			 crrStr+="<input type='hidden' value='"+res.careerNo+"' id='careerNo' name='crrList["+c+"].careerNo'>";
			 crrStr+="<input type='hidden' value='"+res.resumeNo+"' id='resumeNo' name='crrList["+c+"].resumeNo'>";	 
			 crrStr+="<input type='hidden' value='N' id='curEmployed"+c+"' class='realcurEmployed' name='crrList["+c+"].curEmployed'>";	 
			 crrStr+="<input class='startYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='crrList["+c+"].startYear'>.";
			 crrStr+="<input class='startMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='crrList["+c+"].startMonth'>-";		 
			 crrStr+="<input class='endYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='crrList["+c+"].endYear'>.";		 
			 crrStr+="<input class='endMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='crrList["+c+"].endMonth'>";		 
			 crrStr+="<input class='ckCur_jy' type='checkbox' value='' id='ckcurEmployed"+c+"' name='crrList["+c+"].ckcm' onclick='$.getCur("+c+")'>현재재직중";			 
			 crrStr+="<input class='name_jy' type='text' value='' placeholder='회사명' name='crrList["+c+"].careerName'>";
			 crrStr+="<input class='dep_jy' type='text' value='' placeholder='부서명/직책' name='crrList["+c+"].careerDep'>";
			 crrStr+="<button type='button' class='btAdd2_jy' id='btach_jy'>+ 주요 성과 추가</button>"
			 crrStr+="<button type='button' class='btDel_jy' id='btCrrDel_jy' onclick='$.del(\"" + res.careerNo+ "\",\"" + 'career' + "\")'> <i class='icon-close btDel-i_jy'></i></button>";
			 crrStr+="<ul id='ul2_jy"+res.careerNo+"' name='ul2_jy' class='soltableli_jy'>";
			// crrStr+="</ul'>";
			 c++;
	    	 //crrStr+="</form>";
			 crrStr+="</li>";
			 $('#ul1_jy').append(crrStr); 
		 }
	
	    $.makeForm2=function(resAch){
		var achStr="";
			 achStr+="<li id='ach"+resAch.achNo+"'>";
			// achStr+="<form method='post' name='frmAch' id='frmAch'>";
			 achStr+="<input type='hidden' value='"+resAch.achNo+"' id='achNo' name='achList["+a+"].achNo'>";
			 achStr+="<input type='hidden' value='"+resAch.careerNo+"' name='achList["+a+"].careerNo' >";
			 //achStr+="<input type='text' value='"+a+"'>";
			 achStr+="<input type='text' value='' placeholder='·주요 성과' id='achName' name='achList["+a+"].achName'>";
			 achStr+="<input class='startYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='achList["+a+"].startYear'>.";
			 achStr+="<input class='startMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='achList["+a+"].startMonth'>-";		 
			 achStr+="<input class='endYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='achList["+a+"].endYear'>.";		 
			 achStr+="<input class='endMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='achList["+a+"].endMonth'>";		 
			 achStr+="<textarea class='content-textArea_jy innerTA_jy' name='achList["+a+"].achDetails' value=''   placeholder='상세 업무 내용과 성과를 기입해주세요' rows='2' cols='20' ></textarea>";
			 achStr+="<button type='button' class='btDel_jy' id='btAchDel_jy' onclick='$.del(\"" + resAch.achNo+ "\",\"" + 'ach' + "\")'><i class='icon-close btDel-i_jy'></i></button>";
			 a++;
			 //achStr+="</form>"
			 achStr+="</li>"
			$('#ul2_jy'+resAch.careerNo).append(achStr);
	   } 
	    
	    $.makeForm3=function(resEdu){
			 var eduStr="";
			 
			 eduStr+="<li class='eduLi_jy' id='edu"+resEdu.eduNo+"'>";
			 //eduStr+="<form method='post' name='frmEdu' id='frmEdu'>";			 
			 eduStr+="<input type='hidden' value='"+resEdu.eduNo+"' id='eduNo' name='eduList["+e+"].eduNo'>";
			 eduStr+="<input type='hidden' value='"+resEdu.resumeNo+"' id='resumeNo' name='eduList["+e+"].resumeNo'>";	 
			 eduStr+="<input type='hidden' value='N' id='curEnrolled"+e+"' class='realcurEnrolled' name='eduList["+e+"].curEnrolled'>";	 
			 eduStr+="<input class='startYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='eduList["+e+"].startYear'>.";
			 eduStr+="<input class='startMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='eduList["+e+"].startMonth'>-";		 
			 eduStr+="<input class='endYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='eduList["+e+"].endYear'>.";		 
			 eduStr+="<input class='endMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='eduList["+e+"].endMonth'>";		 
			 eduStr+="<input class='ckCur_jy' type='checkbox' value='' id='ckcurEnrolled"+e+"' name='eduList["+e+"].ckcm' onclick='$.getCur("+e+")'>현재재학중";			 
			 eduStr+="<input class='name_jy' type='text' value='' placeholder='학교명' name='eduList["+e+"].eduName'>";
			 eduStr+="<input class='dep_jy' type='text' value='' placeholder='전공 및 학원(ex: 경영학과 학사)' name='eduList["+e+"].eduMajor'>";
			 eduStr+="<input class='dep_jy eduDetail_jy' type='text' value='' placeholder='이수과목 또는 연구내용' name='eduList["+e+"].eduDetails'>";
			 eduStr+="<button type='button' class='btDel_jy' id='btEduDel_jy' onclick='$.del(\"" + resEdu.eduNo+ "\",\"" + 'edu' + "\")'> <i class='icon-close btDel-i_jy'></i></button>";
			 e++;
	    	 //eduStr+="</form>";
			 eduStr+="</li>";
			 $('#ul3_jy').append(eduStr); 
		 }
	    
	    $.makeForm4=function(resAdd){
			 var addStr="";
			 addStr+="<li class='addLi_jy' id='add"+resAdd.addNo+"'>";
			 //addStr+="<form method='post' name='frmAdd' id='frmAdd'>";			 
			 addStr+="<input type='hidden' value='"+resAdd.addNo+"' id='addNo' name='addList["+ai+"].addNo'>";
			 addStr+="<input type='hidden' value='"+resAdd.resumeNo+"' id='resumeNo' name='addList["+ai+"].resumeNo'>";	 
			 addStr+="<input class='startYear_jy getYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='addList["+ai+"].getYear'>.";
			 addStr+="<input class='startMonth_jy getMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='addList["+ai+"].getMonth'>";
			 addStr+="<input class='name_jy' type='text' value='' placeholder='활동명' name='addList["+ai+"].addName'>";
			 addStr+="<input class='dep_jy eduDetail_jy addDetail_jy' type='text' value='' placeholder='세부사항' name='addList["+ai+"].addDetails'>";
			 addStr+="<button type='button' class='btDel_jy' id='btEduDel_jy' onclick='$.del(\"" + resAdd.addNo+ "\",\"" + 'add' + "\")'> <i class='icon-close btDel-i_jy'></i></button>";
			 ai++;
	    	 //addStr+="</form>";
			 addStr+="</li>";
			 $('#ul4_jy').append(addStr); 
		 }
	   
	    $.makeForm5=function(resLang){
			 var langStr="";
			 langStr+="<li class='langLi_jy' id='lang"+resLang.langNo+"'>";
			 //langStr+="<form method='post' name='frmLang' id='frmLang'>";			 
			 langStr+="<input type='hidden' value='"+resLang.langNo+"' id='langNo' name='langList["+l+"].langNo'>";
			 langStr+="<input type='hidden' value='"+resLang.resumeNo+"' id='resumeNo' name='langList["+l+"].resumeNo'>";	 
			 langStr+="<input type='hidden' value='"+l+"'>";	 
			 langStr+="<select name='langList["+l+"].langName' class='selectlang_jy'> <i class='dropdown-caret icon-arrow_down'></i><option value='' class='placeholder_jy'>언어</option><option value='영어'>영어</option><option value='중국어'>중국어</option><option value='일본어'>일본어</option><option value='한국어'>한국어</option><option value='스페인어'>스페인어</option><option value='프랑스어'>프랑스어</option> </select>"
			 langStr+="<select name='langList["+l+"].langLevel' class='selectlevel_jy'><i class='dropdown-caret icon-arrow_down'></i><option value='' class='placeholder_jy'>수준</option><option value='1'>유창함</option><option value='2'>비즈니스수준</option><option value='3'>일상생활가능</option></select>"
			 langStr+="<button type='button' class='btAdd2_jy' id='btlangTest_jy'>+ 어학시험 추가</button>"
			 langStr+="<button type='button' class='btDel_jy' id='btLangDel_jy' onclick='$.del(\"" + resLang.langNo+ "\",\"" + 'lang' + "\")'> <i class='icon-close btDel-i_jy'></i></button>";
			 langStr+="<ul id='ul6_jy"+resLang.langNo+"' name='ul6_jy' class='soltableli_jy'>";
			 //langStr+="</ul'>";
			 l++;
	    	 //langStr+="</form>";
			 langStr+="</li>";
			 $('#ul5_jy').append(langStr); 
		 }
	     
	      $.makeForm6=function(resTest){
			var testStr="";
				testStr+="<li class='testLi_jy' id='test"+resTest.langtestNo+"'>";
				// testStr+="<form method='post' name='frmTest' id='frmTest'>";
				 testStr+="<input type='hidden' value='"+resTest.langtestNo+"' id='langTestNo' name='testList["+t+"].langtestNo'>";
				 testStr+="<input type='hidden' value='"+resTest.langNo+"' name='testList["+t+"].langNo' >";
				 testStr+="<input type='hidden' value='"+t+"'>";
				 testStr+="·<input type='text' value='' class='testN_jy' placeholder='시험명' id='langtestName' name='testList["+t+"].langtestName'>";
				 testStr+="<input class='dep_jy' type='text' value='' class='testL_jy' placeholder='점수/급' name='testList["+t+"].langtestScore'>";
				 testStr+="<input class='startYear_jy getYear_jy' maxlength='4' type='text' value='' placeholder='YYYY' name='testList["+t+"].getYear'>.";
				 testStr+="<input class='startMonth_jy getMonth_jy' maxlength='2' type='text' value='' placeholder='MM' name='testList["+t+"].getMonth'>.";		 
				 testStr+="<button type='button' class='btDel_jy' id='btTestDel_jy' onclick='$.del(\"" + resTest.langtestNo+ "\",\"" + 'test' + "\")'><i class='icon-close btDel-i_jy'></i></button>";
				 t++;
				 //testStr+="</form>"
				 testStr+="</li>"
				$('#ul6_jy'+resTest.langNo).append(testStr);
		   }
	      
	      $.makeForm7=function(resLink){
				var linkStr="";
					linkStr+="<li class='linkLi_jy' id='link"+resLink.linkNo+"'>";
					// linkStr+="<form method='post' name='frmLink' id='frmLink'>";
					 linkStr+="<input type='hidden' value='"+resLink.linkNo+"' id='linkNo' name='linkList["+lk+"].linkNo'>";
					 linkStr+="<input type='hidden' value='"+resLink.resumeNo+"' name='linkList["+lk+"].resumeNo' >";
					 linkStr+="<input type='hidden' value='"+lk+"'>";
					 linkStr+="<input class='dep_jy linkUrlC_jy' type='text' value='' placeholder='http://' name='linkList["+lk+"].linkUrl'>";
					 linkStr+="<button type='button' class='btDel_jy' id='btLinkDel_jy' onclick='$.del(\"" + resLink.linkNo+ "\",\"" + 'link' + "\")'><i class='icon-close btDel-i_jy'></i></button>";
					 lk++;
					 //testStr+="</form>"
					 linkStr+="</li>"
					$('#ul7_jy').append(linkStr);
		} 
	    
	    //체크박스 선택여부에 따라 밸류지정
	    $.getCur=function(c){
	    	if($('#ckcurEmployed'+c).is(":checked")){//현재재직중
		   		 $('#curEmployed'+c).val("Y");
		   	}else{
		   		$('#curEmployed'+c).val("N");
		   	}
	    	if($('#ckcurEnrolled'+c).is(":checked")){//현재재학중
		   		 $('#curEnrolled'+c).val("Y");
		   	}else{
		   		$('#curEnrolled'+c).val("N");
		   	}
	    	
	    }	  
	    
	    //버튼 누르면 삭제하기
	     $.del=function(delNo, type){   	
	    	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인

		    	 if(type=="career"){ //경력삭제
		    		 $.ajax({
		 				url:"<c:url value='/career/careerDelete.do'/>",
		 				type:"get",
		 				data: "careerNo="+delNo/* $(this).siblings('#careerNo').val() */,
		 				dataType:"json",
		 				success:function(delcrr){
		 					//alert(delcrr);
		 					 if(delcrr>0){
		 						$('#crr'+delNo).remove();
		 					 } 
		 				},
		 				error:function(xhr,status,error){
		 					alert(error+":에러");
		 				}
		 		   });//ajax
				}else if(type=="ach"){//성과삭제
					 $.ajax({
			 				url:"<c:url value='/achievement/achievementDelete.do'/>",
			 				type:"get",
			 				data:"achNo="+delNo,
			 				dataType:"json",
			 				success:function(delach){
			 					//alert(delach);
			 					  if(delach>0){
			 						$('#ach'+delNo).remove();
			 					 } 
			 				},
			 				error:function(xhr,status,error){
			 					alert(error+":에러");
			 				}
			 		   });//ajax
				}else if(type=="edu"){//학력사항삭제
					$.ajax({
		 				url:"<c:url value='/education/educationDelete.do'/>",
		 				type:"get",
		 				data:"eduNo="+delNo,
		 				dataType:"json",
		 				success:function(deledu){
		 				 	//alert(deledu);
		 				 		  if(deledu>0){
		 						$('#edu'+delNo).remove();
		 					 }  
		 				},
		 				error:function(xhr,status,error){
		 					alert(error+":에러");
		 				}
		 		   });//ajax
				}else if(type=="add"){//기타삭제
					$.ajax({
		 				url:"<c:url value='/addinformatiod/addinformatiodDelete.do'/>",
		 				type:"get",
		 				data:"addNo="+delNo,
		 				dataType:"json",
		 				success:function(deladd){
		 				 	//alert(deladd);
		 				 	 if(deladd>0){
		 						$('#add'+delNo).remove();
		 					 }   
		 				},
		 				error:function(xhr,status,error){
		 					alert(error+":에러");
		 				}
		 		   });//ajax
				}else if(type=="lang"){//언어삭제
					$.ajax({
		 				url:"<c:url value='/languages/languagesDelete.do'/>",
		 				type:"get",
		 				data:"langNo="+delNo,
		 				dataType:"json",
		 				success:function(delLang){
		 				 	//alert(delLang);
		 				 	  if(delLang>0){
		 						$('#lang'+delNo).remove();
		 					 }  
		 				},
		 				error:function(xhr,status,error){
		 					alert(error+":에러"+delNo+type);
		 				}
		 		   });//ajax
				}else if(type=="test"){//어학시험 삭제
					$.ajax({
						url:"<c:url value='/languagestest/languagestestDelete.do'/>",
		 				type:"get",
		 				data:"langtestNo="+delNo,
		 				dataType:"json",
		 				success:function(delTest){
		 				 	//alert(delTest);
		 				 	  if(delTest>0){
		 						$('#test'+delNo).remove();
		 					 }   
		 				},
		 				error:function(xhr,status,error){
		 					alert(error+":에러"+delNo+type);
		 				}
		 		   });//ajax
				}else if(type=="link"){
					$.ajax({
						url:"<c:url value='/link/linkDelete.do'/>",
		 				type:"get",
		 				data:"linkNo="+delNo,
		 				dataType:"json",
		 				success:function(delTest){
		 				 	//alert(delTest);
		 				 	 if(delTest>0){
		 						$('#link'+delNo).remove();
		 					 }  
		 				},
		 				error:function(xhr,status,error){
		 					alert(error+":에러"+delNo+type);
		 				}
		 		   });//ajax
				}//if
	    	 }//confirm if	
	    }//del함수끝
	       
});
</script>
<section class="resumeWriteSection_jy">
	<div class="container container_jy">
		<!-- 이력서 기본 인적사항 나중에 value바꾸기-->
		<form name="frmRegister" method="post" action="<c:url value='/resume/resumeRegister.do'/>">
			
		<div class="resume-basic-info_jy">
			<div class="resume-select-lang_jy">
				<div class="langselectBox_jy">
					<i class="icon-ic-language :before"></i>
					<select name="resumeVo.langFlag" class="realselect_jy selectLangOption">  
						<i class="icon-arrow_bottom_fill :before btselect_jy"></i>
						<option value="KR" <c:if test="${resumeVo.langFlag=='KR'}"> selected="selected"</c:if>>한국어</option> 
						<option value="EN" <c:if test="${resumeVo.langFlag=='EN'}"> selected="selected"</c:if>>English</option>
						<option value="JP" <c:if test="${resumeVo.langFlag=='JP'}"> selected="selected"</c:if>>日本語 </option> 
						<option value="CH" <c:if test="${resumeVo.langFlag=='CH'}"> selected="selected"</c:if>>繁體中文 </option> 	
					</select>
				</div>
			</div>
			<!--
			1. 이력서 새로 작성하기를 누르면 바로 insert
			2. 추가 누르면 바로 항목으로 인서트 
			 -->		
			<button class="btResume-down_jy" type="button" data-reactid=".0.0.0.0.0.0.0.1.0">
				<i class="icon-download" > </i>
			</button>
		</div>
			
			<input type="hidden" name="resumeVo.resumeNo" value="${resumeVo.resumeNo}"> 			
			<input type="hidden" name="resumeVo.memNo" value="${resumeVo.memNo}">
			<input type="hidden" id="tempFlag" name="resumeVo.tempFlag" value="${resumeVo.tempFlag}">
			<input type="hidden" id="resumeLength" name="resumeVo.resumeLength" value="${resumeVo.resumeLength}">
			<!-- 엄청크게 --> 
			<div class="reumeTitle_jy">
				<input type="text" class="title-input_jy" name="resumeVo.resumeTitle" value="${resumeVo.resumeTitle}">
			</div>
			<div class="reumeBasicInfo_jy">
				<input type="text" class="content-input_jy" name="resumeVo.resumeName" value="${resumeVo.resumeName}"><br>
				<input type="text" class="content-input_jy" name="resumeVo.resumeEmail" value="${resumeVo.resumeEmail}"><br>
				<input type="text" class="content-input_jy" name="resumeVo.resumeHp" value="${resumeVo.resumeHp}"><br>
			</div>
			<div class="resumeSubTitle_jy"> 
				<label for="resumeIntroduce">간단소개글</label><br>
			</div>
			<textarea id="taResumeIntro_jy" name="resumeVo.resumeIntroduce" value="${resumeVo.resumeIntroduce}"  class="content-textArea_jy" placeholder="간단한 자기소개를 통해 이력서를 돋보이게 만들어보세요. (3~5줄 권장)" rows="3" cols="50" ></textarea>
			<br>	
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">경력</div>
				<div class="divbtAdd_jy">
					<button type="button" id="btcareer_jy" class="btAdd_jy" >+ 추가</button>
					<!-- 값이 있다면 여기에 ul li로  list추가! -->
				 	<ul id="ul1_jy" class='soltableli_jy'>
				 		
				 	</ul>
				</div>
			</div>
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">학력</div>
				<div class="divbtAdd_jy">
					<button type="button" id="btEdu_jy"  class="btAdd_jy">+ 추가</button>
					<!-- 값이 있다면 여기에 ul li로  list추가! -->
				 	<ul id="ul3_jy" class='soltableli_jy'>
				 		
				 	</ul>
				</div>
			</div>
			<div class="RWcomponent_jy">	
				<div class="resumeSubTitle_jy">수상 및 기타</div>
				<div class="divbtAdd_jy">
					<button  type="button" id="btAddInfo_jy" class="btAdd_jy">+ 추가</button>
					<!-- 값이 있다면 여기에 ul li로  list추가! -->
				 	<ul id="ul4_jy" class='soltableli_jy'>
				 		
				 	</ul>
				</div>
			</div>
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">외국어</div>
				<div class="divbtAdd_jy">
					<button  type="button" id="btlang_jy" class="btAdd_jy">+ 추가</button>
					<ul id="ul5_jy" class='soltableli_jy'>
				 		
				 	</ul>
					
				</div>
			</div>
			
			<div class="RWcomponent_jy">
				<div class="resumeSubTitle_jy">링크</div>
				<div class="divbtAdd_jy">
					<button  type="button" id="btlink_jy" class="btAdd_jy">+ 추가</button>
					<ul id="ul7_jy" class='soltableli_jy'>
				 		
				 	</ul>
				</div>
			</div>
			
			<!-- 임시저장 누르면 tempFlag Y 저장 누르면 N-->
			<div class="btGroup_jy">	
				<input type="submit" name="btTempSave" id="btTempSave" class="buttons_jy" value="임시저장"></input>
				<button name="btRealSave" id="btRealSave" class="buttons_jy" value="작성완료">작성완료</button>
			</div>
		</form>
	</div><!-- 컨테이너 디브 -->
	
</section>		


<%-- <%@ include file="../inc/bottom.jsp" %> --%>