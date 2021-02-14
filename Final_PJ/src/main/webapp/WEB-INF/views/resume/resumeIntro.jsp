<%@ include file="../inc/top.jsp" %>

<!-- 내꺼 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<link rel="stylesheet" href="<c:url value='/resources/css/resumeIntro.css'/>">

<section class="page-title section1-resumeIntro_jy white_jy">
  <div class="container container-resumeIntro_jy">
    <div class="row row_jy">
      <div class="col-md-12 col-resumeIntro_jy">
        <div class="block text-center bolck-resumeIntro_jy">
          
          <h1 class="text-capitalize mb-5 text-lg resumeIntro-title_jy">이력서 양식, 그 이상</h1>
			<span class="text-resumeIntro_jy">채용 전문가들의 조언을 얻어, 이력서를 잘 쓸 수 있는 도구를 만들었습니다.<br>
				서류 통과가 잘 되는 원티드 이력서를 쉽고 빠르게 작성해 보세요. </span>
				<div class="divbt-resumeIntro_jy">
	 				<button type="button" class="bt1-resumeIntro_jy" onClick='location.href="<c:url value='/resume/resumeList.do'/>"'>이력서 관리</button>	
	 				<button type="button" class="bt2-resumeIntro_jy"  onClick='location.href="<c:url value='/resume/resumeRegister.do'/>"'>새 이력서 작성</button>				
 				</div>	
 				<div class="divbackgroundIMG2_jy"></div>		
        </div>
      </div>
    </div>
  </div>
</section>

<section class="page-title section2-resumeIntro_jy">
  <div class="container container-resumeIntro_jy">
    <div class="row row_jy">
      <div class="col-md-12 col-resumeIntro_jy">
        <div class="block text-center bolck-resumeIntro_jy">
          
          <h1 class="text-capitalize mb-5 text-lg">지원에 유리한</h1>
			<span class="text-white text-resumeIntro_jy">글로벌 기업에 보편적이고, 성별이나 가족관계 등 차별 금지 정책에 맞춰서 제작하였습니다.<br>
				군더더기 없이, 당신의 진짜 경쟁력을 드러 내 보세요.</span>
        </div>
      </div>
    </div>
  </div>
</section>

<section class="page-title section3-resumeIntro_jy white_jy">
  <div class="container container-resumeIntro_jy">
    <div class="row row_jy">
      <div class="col-md-12 col-resumeIntro_jy">
        <div class="block text-center bolck-resumeIntro_jy">
          
          <h1 class="text-capitalize mb-5 text-lg resumeIntro-title_jy">본질에 집중한</h1>
			<span class="text-resumeIntro_jy">보다 명확한 정보 설계로 당신의 커리어를 돋보이게 만들어 드립니다.<br>
				불필요한 정보 입력을 최소화하고 이력서 작성에 방해가 되는 UI 요소들을 제거하였습니다. </span>
			<div class="divbackgroundIMG_jy"></div>		
        </div>
      </div>
    </div>
  </div>
</section>


<section class="page-title section4-resumeIntro_jy">
  <div class="container container-resumeIntro_jy">
    <div class="row row_jy">
      <div class="col-md-12 col-resumeIntro_jy">
        <div class="block text-center bolck-resumeIntro_jy">
          <h1 class="text-capitalize mb-5 text-lg">활용이 자유로운</h1>
			<span class="text-white text-resumeIntro_jy">PC/모바일 어디에서나 작성할 수 있고, PDF 파일로 저장과 활용이 쉽습니다.<br>
				가독성에 중점을 두고 설계하여, 파일 저장/출력시에도 돋보이는 결과물을 얻을 수 있습니다.</span>
				<div class="divbt-resumeIntro_jy">
	 				<button type="button" class="bt1-resumeIntro_jy bt-borderNon_jy"  onClick='location.href="<c:url value='/resume/resumeSampleFileDown.do'/>"'>샘플다운로드</button>	
	 				<button type="button" class="bt2-resumeIntro_jy"  onClick='location.href="<c:url value='/resume/resumeRegister.do'/>"'>새 이력서 작성</button>				
 				</div>	
        </div>
      </div>
    </div>
  </div>
</section>











<%@ include file="../inc/bottom.jsp" %>