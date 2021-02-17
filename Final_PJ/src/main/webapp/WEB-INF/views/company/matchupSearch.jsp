<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="<c:url value='/resources/css/companyService/matchup.css'/>">
<script type="text/javascript">
$(function(){
	//리스트 선택 시 표시해주기
	$('.matchupSearch-li').click(function(){
		var num=$(this).index(); //부모 요소를 기준으로 내가 몇번째 자식이냐
		$('.matchupSearch-li').removeClass('matchupSearch-selectedLi');
		$('.matchupSearch-li:eq('+num+')').addClass('matchupSearch-selectedLi')
	});

	//찜 버튼 금색 토글
	$(document).on('click', '.matchupSearch-ZzimBtn', function(){
		var resumeStr=$(this).parent().siblings('.matchupSearch-resume-1st').children('span').text();
		console.log('resumeStr: '+resumeStr);
		var resumeNo=parseInt(resumeStr.substr(3), 10);
		console.log('resumeNo: '+resumeNo);
		
		if($(this).children('i').hasClass('goldStar')){
			$(this).children('i').removeClass('goldStar');
			delZzim(resumeNo);
		}else{
			$(this).children('i').addClass('goldStar');
			addZzim(resumeNo);
		}
	});
	
	//이력서 팝업에서 찜하기
	$('#matchupResumeSimpleZzimBtn').click(function(){
		var resumeStr=$(this).parent().prev().text();
		console.log('resumeStr: '+resumeStr);
		var resumeNo=parseInt(resumeStr.substr(3), 10);
		console.log('resumeNo: '+resumeNo);
		
		if($(this).children('i').hasClass('goldStar')){
			$(this).children('i').removeClass('goldStar');
			delZzim(resumeNo);
		}else{
			$(this).children('i').addClass('goldStar');
			addZzim(resumeNo);
		}
	});
	

	var viewMoreSize=0;
	//더보기 기능 구현
	$(document).on('click', '#matchupSearch-viewMoreBtn', function(){
		//console.log('눌렀당');
		viewMoreSize=parseInt($('#matchupSearch-record').val(), 10);
		var keyword=$('#matchupSearchkeyword').val();
		var minCareer=$('#minCareerSelect').val();
		var maxCareer=$('#maxCareerSelect').val();
		var jikmu=$('#matchupSearch-jikmuSelect').val();
		var jikgun=$('#matchupSearch-jikgunSelect').val();
		var comCode=$('input[name=searchComCode]').val();
		viewMoreSize+=5;
		
		var urlstr="";
		if($('.matchupSearch-li').eq(0).hasClass('matchupSearch-selectedLi')){ //전체보기면
			console.log('전체 더보기!');
			urlstr="<c:url value='/company/viewMoreMatchupMem.do'/>";
		}else if($('.matchupSearch-li').eq(1).hasClass('matchupSearch-selectedLi')){ //찜한목록보기면
			console.log('찜한목록 더보기!');
			urlstr="<c:url value='/company/viewMoreZzimedList.do'/>";
		}
		
		$.ajax({
			url:urlstr,
			dataType:"json",
			type:"get",
			data:{
				"viewMoreSize":viewMoreSize,
				"searchKeyword":keyword,
				"searchMaxCareer":maxCareer,
				"searchMinCareer":minCareer,
				"searchJikmu":jikmu,
				"searchJikgun":jikgun,
				"comCode":comCode
			},
			success:function(memList){
				//alert('성공!');
				console.log(memList.length);
				memListSize=memList.length;
				if(memList.length!=5){
					$('#matchupSearch-viewMoreBtn').hide();
				}
				
				for(mcumem of memList){
					makeMemList(mcumem);
				}
				
				$('#matchupSearch-record').val(viewMoreSize);
				$('input[name=searchKeyword]').val(keyword);
				$('input[name=searchMinCareer]').val(minCareer);
				$('input[name=searchMaxCareer]').val(maxCareer);
				$('input[name=searchJikmu]').val(jikmu);
				$('input[name=searchJikgun]').val(jikgun);
				$('#matchupSearchkeyword').val(keyword);
				$('input[name=searchComCode]').val(comCode);
			},
			error:function(error){
				alert('error!:'+error);
			}
		});
	});
	
	//검색버튼 클릭하면 새로고침해서 이 페이지로 돌아오기
	$('.matchupSearch-searchBtn').click(function(){
		var keyword=$('#matchupSearchkeyword').val();
		var minCareer=$('#minCareerSelect option:selected').val();
		var maxCareer=$('#maxCareerSelect option:selected').val();
		var jikmu=$('#matchupSearch-jikmuSelect option:selected').val();
		var jikgun=$('#matchupSearch-jikgunSelect option:selected').val();
		$('input[name=searchKeyword]').val(keyword);
		$('input[name=searchMinCareer]').val(minCareer);
		$('input[name=searchMaxCareer]').val(maxCareer);
		$('input[name=searchJikmu]').val(jikmu);
		$('input[name=searchJikgun]').val(jikgun);
		
		$('form[name=matchupSearchForm]').submit();
	});
	
	//찜한 이력서 보기..
	$('#matchupSearch-Zzimed-list').click(function(){
		console.log('찜한 이력서 보기');
		var keyword=$('#matchupSearchkeyword').val();
		var minCareer=$('#minCareerSelect').val();
		var maxCareer=$('#maxCareerSelect').val();
		var jikmu=$('#matchupSearch-jikmuSelect').val();
		var jikgun=$('#matchupSearch-jikgunSelect').val();
		var comCode=$('input[name=searchComCode]').val();
		$.ajax({
			url:"<c:url value='/company/showZzimedList.do'/>",
			dataType:"json",
			type:"get",
			data:{
				"viewMoreSize":viewMoreSize,
				"searchKeyword":keyword,
				"searchMaxCareer":maxCareer,
				"searchMinCareer":minCareer,
				"searchJikmu":jikmu,
				"searchJikgun":jikgun,
				"comCode":comCode
			},
			success:function(memList){
				console.log(memList.length);
				memListSize=memList.length;
				$('#matchupSearch-resumeListDiv').html("");
				
				for(mcumem of memList){
					makeMemList(mcumem);
				}
				
				if(memList.length!=5){
					$('#matchupSearch-viewMoreBtn').hide();
				}
				
				$('#matchupSearch-record').val(viewMoreSize);
				$('input[name=searchKeyword]').val(keyword);
				$('input[name=searchMinCareer]').val(minCareer);
				$('input[name=searchMaxCareer]').val(maxCareer);
				$('input[name=searchJikmu]').val(jikmu);
				$('input[name=searchJikgun]').val(jikgun);
				$('input[name=searchComCode]').val(comCode);
				$('#matchupSearchkeyword').val(keyword);
			},
			error:function(xhr, status, error){
				alert('찜한 목록 보기 실패! '+error);
			}
		});
	});
	
	//var resumeNo=0;
	//버튼 선택 시 해당하는 데이터를 모달 팝업에 뿌려주는 기능
// 	$('.matchupSearchResumeOpenBtn').click(function(){
	$(document).on('click', '.matchupSearchResumeOpenBtn', function(){
 		var resumeNo=$(this).data('resumeno');
		console.log(resumeNo)
		$('#wantedResumeSimpleMDLabel').text('이력서 미리보기');
		$('#matchupResumeBtnSpan').text('*이력서 상세보기를 하면 열람권 1회가 차감됩니다.');
		$('#matchupResumeViewDetailBtn').text('상세이력 보기');
		$('.matchupSearch-downBtn').addClass('hide');
		
		setResume(setSimpleResumeMD, resumeNo);
	});
	
	//이력서 팝업 하단 버튼 클릭 시 데이터 받아다 모달 그려주기 (다시 그려야 함, 상세보기니까..) 
	$(document).on('click', '#matchupResumeViewDetailBtn', function(){
		//레주메넘버가 필요함
		var index=$('.matchupResumeName').text().indexOf(" ");
		var resumeNo=parseInt($('.matchupResumeName').text().substr(3, index-3), 10);
		console.log("하단 버튼 클릭 후 resumeNe="+resumeNo);
		console.log('다시 그리기 버튼 눌렀다');
		
		
		if($(this).text()=='상세이력 보기'){
			console.log('상세이력 보기 눌렀다');
			$('#wantedResumeSimpleMDLabel').text('상세이력 보기');
			$('#matchupResumeBtnSpan').html('유능한 인재는 여러 기업에서 면접 제안을 받습니다.<br>기회를 놓치지 마세요!');
			$('#matchupResumeViewDetailBtn').text('제안하기');
			$('.matchupSearch-downBtn').removeClass('hide');
			setResume(setDetailResumeMD, resumeNo);
			
			//이력서 조회 -1.. 기조회한 이력서면 떨어지면 안댐. 진행현황 테이블에도 추가하자 같이
			$.ajax({
				url:"<c:url value='/company/updateMatchupStatus.do'/>"
				,data:{
					'resumeNo':resumeNo
				}
				,dataType:"text"
				,type:"get"
				,success:function(result){
					alert('이력서 조회 카운트 업데이트 성공! '+result);
				}
				,error:function(xhr, status, error){
					alert('이력서 조회 카운트 업데이트 실패! '+error);
				}
			});

			//이력서 다운로드 
			$('.matchupSearch-downBtn').click(function(){
				console.log('이력서 다운로드: '+resumeNo);
				$.downResume(resumeNo);
			});
			
		}		
		//제안하기 팝업 노출해야 함
		else if($(this).text()=='제안하기'){
			console.log('제안하기 눌렀을 때 ');
			$('#wantedResumeSimpleMD').modal('hide');
			$('#wantedProposalMD').modal('show');
			
			var comcode=$('.matchupSearchResumeOpenBtn').data('comcode');
			var poslist=$('.matchupSearchResumeOpenBtn').data('poslist');
			console.log("여기맞니"+comcode);
			console.log("여기맞니2"+poslist);
			console.log("여기맞니3"+resumeNo);
			
			$('form[name=proposalForm]').children('input[name=resumeNo]').val(resumeNo);
		}
		
	});
	
	
});

//이력서 정보 세팅하는 메소드 
function setResume(resumeStyle, resumeNo){
	$.ajax({
		url:"<c:url value='/company/getResumeData.do'/>"
		,data:{
			'resumeNo':resumeNo,
		}
		,type:"get"
		,dataType:"json"
		,success:function(result){
			console.log(result);
			resumeStyle(result);
			//받아온 db를 모달팝업에 세팅해주기	
		}
		,error:function(xhr, status, error){
			alert('error!'+error);
		}
	});
}

//모달에 그려주는 항목 중 언어, 수상및기타는 따로 뺍시다 
function drawLang(resumeAllVo){
	if(resumeAllVo.langList.length>0){
		var language='';
		
		for(lang of resumeAllVo.langList){
			if(lang.langName==null){
				lang.langName="";
			}
			language+='<div class="matchupResumeLang">';
			language+='<div>';
			language+='<span class="matchupResumeSubTitle">'+lang.langName+'</span><span class="matchupResumeMediumSpan"> '+lang.langLevel+'</span>';
			language+='</div>';
			language+='<div class="matchupResumeCont matchupResumeLangTestCont">';
			
			if(resumeAllVo.testList.length>0){
				for(test of resumeAllVo.testList){
					if(test.langtestName==null){
						test.langtestName="";
					}
					language+='<span class="matchupResumeMediumSpan matchupResumeBoldSpan">'+test.langtestName;
					language+=' '+test.langtestScore+'</span>';
					language+='<span class="matchupResumeMediumSpan">'+test.getYear+'.'+test.getMonth+'</span>';
				}
			}
			language+='</div>';
			language+='</div>';
			
			$('.matchupResumeWrapper:eq(3)').append(language);
		}
		
	}
}

function drawAdd(resumeAllVo){
	if(resumeAllVo.addList.length>0){
		for(add of resumeAllVo.addList){
			if(add.addName==null){
				add.addName="";
			}
			if(add.addDetails==null){
				add.addDetails="";
			}

			var additional='';
			additional+='<div class="matchupResumeCont matchupResumeSpace">';
			additional+='<div class="matchupResumeSubTitle">'+add.addName+'</div>';
			additional+='<div>'+add.getYear+'.'+add.getMonth+'</div>';
			additional+='</div>';
			additional+='<div>';
			additional+=add.addDetails;
			additional+='</div>';
			
			$('.matchupResumeWrapper:eq(2)').append(additional);
		}
	}
}

//이력서 미리보기 모달을 그려줍니다
function setSimpleResumeMD(resumeAllVo){
	//데이터 초기화
	$('.matchupResumeName').html('');
	$('.matchupResumeWrapper').html('');
	
	var name=resumeAllVo.resumeVo.resumeName;
	var resumeNo=resumeAllVo.resumeVo.resumeNo;
	var firstName=name.substr(0,1)+"OO";
	console.log(firstName);
	$('.matchupResumeName').html("No."+resumeNo+" / "+firstName);
	
	//찜버튼 색칠해주기 
	//가져올때 찜여부 같이 가져와야되자나
	var resumeNo=resumeAllVo.resumeVo.resumeNo;
	console.log(resumeNo);
	
	$.ajax({
		url:"<c:url value='/company/isZzimed.do'/>"
		,data:{
			'resumeNo':resumeNo
		}
		,type:"get"
		,dataType:"text"
		,success:function(result){
			if(result=='Y'){
				$('#matchupResumeSimpleZzimBtn i').addClass('goldStar');
			}else{
				$('#matchupResumeSimpleZzimBtn i').removeClass('goldStar');
			}
		}
		,error:function(xhr, status, error){
			alert('error!');
		}
	});
	
	for(crr of resumeAllVo.crrList){
		if(crr.careerDep==null){
			crr.careerDep="";		
		}
		if(crr.careerName==null){
			crr.careerName="";
		}
		if(crr.startYear==null || crr.startMonth==null || crr.endYear==null || crr.endMonth==null){
			crr.startYear='';
			crr.startMonth='';
			crr.endYear='';
			crr.endMonth='';
		}
		var career='';
		career+='<div class="matchupResumeCont matchupResumeSpace">';
		career+='<div>';
		career+='<div class="matchupResumeSubTitle">'+crr.careerName+'</div>';
		career+='<div>'+crr.careerDep+'</div>';
		career+='</div>';
		career+='<div>'+crr.startYear+'.'+crr.startMonth+' ~ '+crr.endYear+'.'+crr.endMonth+'</div>';
		career+='</div>';
		
		$('.matchupResumeWrapper:eq(0)').append(career);
	}
	
	for(edu of resumeAllVo.eduList){
		if(edu.eduName!=null && edu.eduName != ''){
			var education='';
			if(edu.eduMajor==null){
				edu.eduMajor="";
			}
			if(edu.startYear==null || edu.startMonth==null || edu.endYear==null || edu.endMonth==null){
				edu.startYear="";
				edu.startMonth="";
				edu.endYear="";
				edu.endMonth="";
			}
			
			education+='<div class="matchupResumeCont matchupResumeSpace">';
			education+='<div class="matchupResumeSubTitle">'+edu.eduName+'</div>';
			education+='<div>'+edu.startYear+'.'+edu.startMonth+' ~ '+edu.endYear+'.'+edu.endMonth+'</div>';
			education+='</div>';
			education+='<div>';
			education+='<div>'+edu.eduMajor+'</div>';
			education+='</div>';
			
			$('.matchupResumeWrapper:eq(1)').append(education);
		}
	}
	
	drawLang(resumeAllVo);
	drawAdd(resumeAllVo);
	
}//drawSimpleResumeMD

//이력서 상세보기 모달을 그려줍니다
function setDetailResumeMD(resumeAllVo){
	//데이터 초기화
	$('.matchupResumeName').html('');
	$('.matchupResumeWrapper').html('');
	
	var name=resumeAllVo.resumeVo.resumeName;
	var resumeNo=resumeAllVo.resumeVo.resumeNo;
	var firstName=name.substr(0,1)+"OO";
	console.log(firstName);
	$('.matchupResumeName').html("No."+resumeNo+" / "+firstName);
	
	//찜버튼 색칠해주기 
	//가져올때 찜여부 같이 가져와야되자나
	var resumeNo=resumeAllVo.resumeVo.resumeNo;
	console.log(resumeNo);
	
	$.ajax({
		url:"<c:url value='/company/isZzimed.do'/>"
		,data:{
			'resumeNo':resumeNo
		}
		,type:"get"
		,dataType:"text"
		,success:function(result){
			if(result=='Y'){
				$('#matchupResumeDetailZzimBtn i').addClass('goldStar');
			}else{
				$('#matchupResumeDetailZzimBtn i').removeClass('goldStar');
			}
		}
		,error:function(xhr, status, error){
			alert('error!');
		}
	});
	
	//자기소개 써주기
	$('.matchupResumeIntroSection').children('span').html('');
	var intro='';
	intro+='<br>';
	intro+='<span>';
	if(resumeAllVo.resumeVo.resumeIntroduce != null){
		intro+=resumeAllVo.resumeVo.resumeIntroduce;
	}
	intro+='</span>';
	$('.matchupResumeIntroSection').append(intro);
	
	for(crr of resumeAllVo.crrList){
		if(crr.careerDep==null){
			crr.careerDep="";		
		}
		if(crr.careerName==null){
			crr.careerName="";
		}
		var career='';
		career+='<div class="matchupResumeCont matchupResumeSpace">';
		career+='<div>';
		career+='<div class="matchupResumeSubTitle">'+crr.careerName+'</div>';
		career+='<div>'+crr.careerDep+'</div>';
		career+='</div>';
		career+='<div>'+crr.startYear+'.'+crr.startMonth+' ~ '+crr.endYear+'.'+crr.endMonth+'</div>';
		career+='</div>';
		
		if(resumeAllVo.achList.length>0){
			for(ach of resumeAllVo.achList){
				console.log("성과"+ach);
				if(ach!=null){
					if(ach.achDetails==null){
						ach.achDetails="";
					}
					if(ach.achName==null){
						ach.achName="";
					}
					
					career+='<div class="matchupResumeCont matchupResumeSpace matchupResumeAchievement">';
					career+='<div>'+ach.achName+'</div>';
					career+='<div class="matchupResumeMediumSpan">';
					if(ach.startYear!=null || ach.startMonth!=null || ach.endYear!=null || ach.endMonth!=null){
						career+=ach.startYear+'.'+ach.startMonth +' ~ '+ach.endYear+'.'+ach.endMonth;
					}
					career+='</div>';
					career+='</div>';
					career+='<div>'+ach.achDetails+'</div>';
					career+='<div class="matchupResumeMDLightLine"></div>';
				
				}
				
			}
		}
		$('.matchupResumeWrapper:eq(0)').append(career);
	}
	
	for(edu of resumeAllVo.eduList){
		var education='';
		if(edu.eduName==null){
			edu.eduName="";
		}
		if(edu.eduMajor==null){
			edu.eduMajor="";
		}
		education+='<div class="matchupResumeCont matchupResumeSpace">';
		education+='<div class="matchupResumeSubTitle">'+edu.eduName+'</div>';
		education+='<div>'+edu.startYear+'.'+edu.startMonth+' ~ '+edu.endYear+'.'+edu.endMonth+'</div>';
		education+='</div>';
		education+='<div>';
		education+='<div>'+edu.eduMajor+'</div>';
		education+='</div>';
		
		$('.matchupResumeWrapper:eq(1)').append(education);
	}
	
	drawLang(resumeAllVo);
	drawAdd(resumeAllVo);
	
}//drawDetailResumeMD

function delZzim(resumeNo){
	$.ajax({
		url:"<c:url value='/company/delZzim.do'/>",
		type:"get",
		dataType:"text",
		data:{"resumeNo":resumeNo},
		success:function(result){
			console.log(result);
		},
		error:function(xhr, status, error){
			console.log("에러!:"+error);
		}
	});
}

function addZzim(resumeNo){
	$.ajax({
		url:"<c:url value='/company/addZzim.do'/>",
		type:"get",
		dataType:"text",
		data:{"resumeNo":resumeNo},
		success:function(result){
			//alert('성공');
			console.log(result);
		},
		error:function(xhr, status, error){
			alert('error: '+error);
		}
	});
}

//pdf 다운로드
$.downResume=function(resumeNo){
	$.ajax({
		url:"<c:url value='/resume/matchupPopupResumeDown.do'/>",
		type:"get",
		data:"resumeNo="+resumeNo,
		dataType:"json",
		success:function(resDown){
			//alert(resDown);
			if(resDown>0){
				alert("pdf 파일생성, 다운로드 되었습니다.");
			}
		},
		error:function(xhr,status,error){
			alert("error:"+error);
		}
	});//ajax
}//downResume

//리스트 그리는 함수
function makeMemList(mcumem){
	var str="";
	str+='<div class="matchupSearch-resumeBound">';
	str+='<div class="matchupSearch-resume-1st">';
	str+='<i class="fas fa-user-tie"></i>';
	str+='<span>No.'+ mcumem.RESUMENO +'</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-2nd">';
	str+='<span>'+mcumem.JIKGUNNAME;
	
	if(mcumem.JIKMUNAME != null){
		str+=' / '+mcumem.JIKMUNAME;
	}
	
	str+='</span><span>';
	
	if(mcumem.CAREER == '신입'){
		str+=mcumem.CAREER+'</span>';
	}else{
		str+=mcumem.CAREER+'년 경력</span>';
	}
	str+='<span>'+mcumem.EDUNAME+' '+mcumem.EDUMAJOR+'</span>';
	str+='</div>';
	str+='<div class="matchupSearch-resume-3rd">';
	str+='<button class="matchupSearch-ZzimBtn"><i class="fas fa-star';
	
	console.log("mcumem.CNT: "+mcumem.CNT)
	if(mcumem.CNT > 0){
		str+=' goldStar';
	}
	
	str+='"></i> 찜</button>';
	str+='<button class="matchupSearchResumeOpenBtn" type="button" data-toggle="modal" ';
	str+='data-target="#wantedResumeSimpleMD" data-resumeno="'+mcumem.RESUMENO+'">이력서 미리보기</button>';
	str+='</div></div>';

	$('#matchupSearch-resumeListDiv').append(str);
}
</script>
<form name="matchupSearchForm" method="post" action="#">
	<input type="hidden" id="matchupSearch-record" value="0">
	<input type="hidden" value="${searchVo.searchJikgun }" name="searchJikgun">
	<input type="hidden" value="${searchVo.searchJikmu }" name="searchJikmu">
	<input type="hidden" value="${searchVo.searchKeyword }" name="searchKeyword">
	<input type="hidden" value="${searchVo.searchMinCareer }" name="searchMinCareer">
	<input type="hidden" value="${searchVo.searchMaxCareer }" name="searchMaxCareer">
	<input type="hidden" value="${sessionScope.comInfoVo.comCode}" name="searchComCode">
</form>

	<div class="matchupNoticeCon">
		<div class="container matchupNoticeWrapper">
			<div>
				<span class="matchupNoticeTitle">Matchup <i class="far fa-handshake fa-sm"></i></span>
				<c:if test="${checkMap.LEFTDATE > 0 && checkMap.LEFTCOUNT > 0}">
					<span id="matchupUseorNotSpan" class="matchupNoticeText">[이용중]</span>
					<span id="matchupDuedateSpan" class="matchupNoticeText"><fmt:formatDate value="${matchupComVo.mcupdExdate}" pattern="yyyy.MM.dd"/> 까지</span>
					<span id="matchupViewCountSpan1" class="matchupNoticeText">사용 ${matchupComVo.resumeReadCount}회 </span>
					<span id="matchupViewCountSpan2" class="matchupNoticeText">| 잔여 ${checkMap.LEFTCOUNT}회</span>
				</c:if>
				<c:if test="${checkMap.LEFTDATE eq 0 || checkMap.LEFTCOUNT eq 0}">
					<span id="matchupUseorNotSpan" class="matchupNoticeText">[만료]</span>
					<span id="matchupDuedateSpan" class="matchupNoticeText"><fmt:formatDate value="${matchupComVo.mcupdExdate}" pattern="yyyy.MM.dd"/> 까지</span>
					<span id="matchupViewCountSpan1" class="matchupNoticeText">사용 ${matchupComVo.resumeReadCount}회 </span>
					<span id="matchupViewCountSpan2" class="matchupNoticeText">| 잔여 ${checkMap.LEFTCOUNT}회</span>
				</c:if>
			</div>
			<div class="matchupNoticeBtnWrapper">
				<!-- 매치업서비스 가입 모달 팝업 -->
				<button type="button" data-toggle="modal" data-target=".matchupServPlanMD" data-comcode="${comInfoVo.comCode}" class="matchupServiceBuyBtn">매치업 서비스 구입</button>
				<%@ include file="../company/modal/matchupServiceSelect.jsp"%>
			</div>
		</div>
	</div>
	<div class="container"> <!-- 가장 바깥 래퍼 --> 
		<section class="matchupSearch-1stSec"> <!-- 이름, 검색필터, 검색창, 필터 -->
			<h1>찾고 있는 인재의 직군/직무를 설정하세요</h1>
			<select id="matchupSearch-jikgunSelect" class="matchupSearch-select matchupSearch-selectShort">
				<c:forEach var="jikgunVo" items="${jikgunList}">
					<option value="${jikgunVo.jikgunCode}">${jikgunVo.jikgunName}</option>			
				</c:forEach>
			</select>
			<select id="matchupSearch-jikmuSelect" class="matchupSearch-select matchupSearch-selectLong"> 
				<option value="all">전체</option>
				<c:forEach var="jikmuVo" items="${jikmuList}">
					<option value="${jikmuVo.jikmuCode}"
						<c:if test="${searchVo.searchJikmu eq jikmuVo.jikmuCode}">
							selected
						</c:if>
					>${jikmuVo.jikmuName}</option>			
				</c:forEach>
			</select>
			<div class="matchupSearch-searchFilter">
				<!-- <div class="matchupSearch-filter"> 
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>국가 선택</option>
						<option>한국</option>
						<option>일본</option>
						<option>대만</option>
						<option>홍콩</option>
						<option>싱가폴</option>
					</select>
				</div>  -->
				<!-- 드롭다운 -->
				<!-- 분량이 안될거같으면 삭제 <div class="matchupSearch-filter">
					<select class="matchupSearch-select matchupSearch-select-sub">
						<option>언어 선택</option>
						<option>한국어</option>
						<option>일본어</option>
						<option>중국어</option>
						<option>영어</option>
					</select>
				 드롭다운 -->
				 <div class="matchupSearch-filter"> 
				 	<span style="font-weight: bold; font-size: 0.8em;">최소 경력</span>
					<select id="minCareerSelect" class="matchupSearch-select matchupSearch-select-sub">
						<option value="전체"
							<c:if test="${searchVo.searchMinCareer eq '전체'}">
								selected
							</c:if>
						>전체</option>
						<option value="신입"<c:if test="${searchVo.searchMinCareer eq '신입'}">
								selected
							</c:if>
						>신입</option>
						<option value="1"
							<c:if test="${searchVo.searchMinCareer eq '1'}">
								selected
							</c:if>
						>1년</option>
						<option value="2"
							<c:if test="${searchVo.searchMinCareer eq '2'}">
								selected
							</c:if>
						>2년</option>
						<option value="3"
							<c:if test="${searchVo.searchMinCareer eq '3'}">
								selected
							</c:if>
						>3년</option>
						<option value="4"
							<c:if test="${searchVo.searchMinCareer eq '4'}">
								selected
							</c:if>
						>4년</option>
						<option value="5"
							<c:if test="${searchVo.searchMinCareer eq '5'}">
								selected
							</c:if>
						>5년</option>
						<option value="6"
							<c:if test="${searchVo.searchMinCareer eq '6'}">
								selected
							</c:if>
						>6년</option>
						<option value="7"
							<c:if test="${searchVo.searchMinCareer eq '7'}">
								selected
							</c:if>
						>7년</option>
						<option value="8"
							<c:if test="${searchVo.searchMinCareer eq '8'}">
								selected
							</c:if>
						>8년</option>
						<option value="9"
							<c:if test="${searchVo.searchMinCareer eq '9'}">
								selected
							</c:if>
						>9년</option>
						<option value="10"
							<c:if test="${searchVo.searchMinCareer eq '10'}">
								selected
							</c:if>
						>10년 이상</option>
					</select>
				</div> 
				<div class="matchupSearch-filter"> 
					<span style="font-weight: bold; font-size: 0.8em;">최대 경력</span>
					<select id="maxCareerSelect" class="matchupSearch-select matchupSearch-select-sub">
						<option value="전체"
							<c:if test="${searchVo.searchMaxCareer eq '전체'}">
								selected
							</c:if>
						>전체</option>
						<option value="신입"
							<c:if test="${searchVo.searchMaxCareer eq '신입'}">
								selected
							</c:if>
						>신입</option>
						<option value="1"
							<c:if test="${searchVo.searchMaxCareer eq '1'}">
								selected
							</c:if>
						>1년</option>
						<option value="2"
							<c:if test="${searchVo.searchMaxCareer eq '2'}">
								selected
							</c:if>
						>2년</option>
						<option value="3"
							<c:if test="${searchVo.searchMaxCareer eq '3'}">
								selected
							</c:if>
						>3년</option>
						<option value="4"
							<c:if test="${searchVo.searchMaxCareer eq '4'}">
								selected
							</c:if>
						>4년</option>
						<option value="5"
							<c:if test="${searchVo.searchMaxCareer eq '5'}">
								selected
							</c:if>
						>5년</option>
						<option value="6"
							<c:if test="${searchVo.searchMaxCareer eq '6'}">
								selected
							</c:if>
						>6년</option>
						<option value="7"
							<c:if test="${searchVo.searchMaxCareer eq '7'}">
								selected
							</c:if>
						>7년</option>
						<option value="8"
							<c:if test="${searchVo.searchMaxCareer eq '8'}">
								selected
							</c:if>
						>8년</option>
						<option value="9"
							<c:if test="${searchVo.searchMaxCareer eq '9'}">
								selected
							</c:if>
						>9년</option>
						<option value="10"
							<c:if test="${searchVo.searchMaxCareer eq '10'}">
								selected
							</c:if>
						>10년 이상</option>
					</select>
				</div> 
				<div class="matchupSearch-searchDiv">
					<input class="matchupSearch-searchInput" id="matchupSearchkeyword" type="text" 
						value="${searchVo.searchKeyword }" placeholder="회사명, 학교, 스킬 검색">
					<button class="matchupSearch-searchBtn"><i class="fas fa-search"></i></button>
				</div>
				<!-- <div class="matchupSearch-rangeSlider">
					<div class="matchupSearch-rangeSliderLabel">
						<label class="matchupSearch-label" for="amount">경력</label>
						<input type="text" id="amount" readonly style="border:0; font-weight:bold;">
					</div>
					Range Slider
					<div id="slider-range"></div>
				</div>  -->
			</div>
		</section>
		<section class="matchupSearch-2ndSec"> <!-- 목록  -->
			<div class="matchupSearch-tabBound">
				<ul class="matchupSearch-resultList">
					<li class="matchupSearch-li matchupSearch-selectedLi" onclick="location.reload()">목록 전체</li>
					<li class="matchupSearch-li" id="matchupSearch-Zzimed-list">찜한 이력서</li>
					<li class="matchupSearch-li">미열람 이력서</li>
					<li class="matchupSearch-li">열람한 이력서</li>
					<li class="matchupSearch-li">면접 제안한 이력서</li>
				</ul>
			</div>
			<div class="matchupSearch-resultOrderFilters">
				<input type="radio" id="matchupSearch-orderFilter-new" name="matchupSearch-orderFilter" value="new">
				<label class="matchupSearch-orderFilterLb" for="matchupSearch-orderFilter-new">최신순</label>
				<input type="radio" id="matchupSearch-orderFilter-read" name="matchupSearch-orderFilter" value="read">
				<label class="matchupSearch-orderFilterLb" for="matchupSearch-orderFilter-read">열람순</label>
			</div>
		</section>
		<section class="matchupSearch-resumeList">
			<div id="matchupSearch-resumeListDiv">
			<!-- 
			 select m.resume_no as resumeNo, m.mem_no as memNo, m.expertise_no as expertiseNo, 
				  m.jobsearch_flag as jobSearchFlag, m.resumeopen_flag as resumepenFlag,
				  r.resume_title as resumeTitle, r.resume_name as resumeName, r.resume_introduce as resumeIntroduce, 
				  r.lang_flag as langFlag from matchupMem m join resume r 
				  on m.resume_No = r.resume_no 
			 -->
			 	<c:if test="${!empty emptyCheck }">
			 		<div style="text-align: center; padding: 50px 100px;">
				 		<span>검색결과가 없습니다. 다시 검색해 주세요.</span>
			 		</div>
			 	</c:if>
			 	<c:if test="${empty emptyCheck }">
					<c:forEach var="mcumemMap" items="${memList }">
						<div class="matchupSearch-resumeBound">
							<div class="matchupSearch-resume-1st">
								<i class="fas fa-user-tie"></i>
								<span>No.${mcumemMap.RESUMENO}</span>
							</div>
							<div class="matchupSearch-resume-2nd"> <!-- 이력서 목록 -->
								<span>${mcumemMap.JIKGUNNAME}
								<c:if test="${!empty mcumemMap.JIKMUNAME}">
									<c:if test="${mcumemMap.JIKMUNAME ne 'undefined'}">
										<c:set value=" / ${mcumemMap.JIKMUNAME}" var="jikmuName"/>
										 ${jikmuName}
									</c:if>
								</c:if></span>
								<span>
									<c:if test="${mcumemMap.CAREER eq '신입' }">
										${mcumemMap.CAREER}
									</c:if>
									<c:if test="${mcumemMap.CAREER ne '신입' }">
										${mcumemMap.CAREER}년 경력
									</c:if>
								</span>
								<span>${mcumemMap.EDUNAME} ${mcumemMap.EDUMAJOR}</span>
							</div>
							<div class="matchupSearch-resume-3rd">
								<button class="matchupSearch-ZzimBtn">
									<i class="fas fa-star <c:if test="${mcumemMap.CNT > 0}">goldStar</c:if>
									"></i> 찜</button>
								<!-- 이력서 미리보기 모달 팝업 -->								
								<button class="matchupSearchResumeOpenBtn" type="button" data-toggle="modal" data-target="#wantedResumeSimpleMD" data-resumeno="${mcumemMap.RESUMENO}"
									data-comcode="${sessionScope.comInfoVo.comCode}" data-poslist="${posList}">이력서 미리보기</button>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</section>		
		<c:if test="${fn:length(memList) eq 5}">
			<div class="matchupSearch-resume-paging">
				<div id="matchupSearch-viewMoreBtn" class="matchupSearch-pagingDiv matchupSearch-pagingDiv_next" >
					더보기</div>
			</div>
		</c:if>	
	</div>
	<!-- 모달팝업들 : 이력서 조회, 제안하기 팝업 -->
	<%@ include file="../company/modal/resumeSimple.jsp" %>
	<%@ include file="../company/modal/proposal.jsp" %>
	<%-- <%@ include file="../company/modal/resumeDetail.jsp" %> --%>
</body>
</html>