<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    
    
    
<!-- 프로젝트 리스트 섹션!!!!!!! -->
<%-- <forEach: var="proVo" items="${plist}">
<div class="row shuffle-wrapper portfolio-gallery" style="margin-top:30px;">
      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;]">
	      	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
	               <div class="doctor-img">
	               		<img src="<c:url value='/progamImgUpload/${proVo.proImage }'/>" alt="" class="img-fluid w-100">
	               </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">${proVo.proName }</a></h4>
                 	<p>${proVo.proSponsor}</p> <span>${proVo.programNo }</span>
                  	<div>
	                	<p>${proVo.proStartDate}</p>
	                	<p>${programCateName}</p>
                	</div>
                </div> 
	      	</div>
      	</div>
</forEach:> --%>
      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/bookclub.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 코드가 문제야</a></h4>
                	<p>입으로코딩</p>
                  	<div>
	                	<p>#북클럽</p>
	                	<p>2021.2.17</p>     
                	</div>
               </div> 
	      	</div>
      </div>

      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/study.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 정신차리자</a></h4>
                	<p>코딩천재</p>
                  	<div>
	                	<p>#북클럽</p>
	                	<p>2021.3.7</p>
                	</div>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;,&quot;cat4&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/servicon.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">이벤트: 맥주한잔하면서</a></h4>
                	<p>야나두</p>
                  	<div>
	                	<p>#이벤트</p>
	                	<p>2021.3.22</p>
                	</div>               	
                </div> 
	      	</div>
      </div>

      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/bookclub2.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">이벤트: 오타경진대회</a></h4>
                	<p>사이보그</p>
                  	<div>
	                	<p>#이벤트</p>
	                	<p>2021.2.22</p>
                	</div>
                </div> 
	      	</div>
      	</div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat6&quot;]">
       		 <div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/study2.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">자바 101</a></h4>
                	<p>키보드워리어</p>
                	<div>
	                	<p>#교육/강의</p>
	                	<p>2021.2.23</p>
                	</div>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat4&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/recruit.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">강연: 성공하는 습관</a></h4>
                	<p>내적갈등</p>
                	<div>
	                	<p>#교육/강의</p>
	                	<p>가나다라</p>
                	</div>
                </div> 
	        </div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;,&quot;cat6&quot;,&quot;cat1&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/hrhr.PNG'/>" alt="" class="img-fluid w-100">
		             </div>
	             </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 시카고타자기 </a></h4>
                	<p>글잘알</p>
                	<div>
	                	<p>#북클럽</p>
	                	<p>2021.4.1</p>
                	</div>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item illustration" data-groups="[&quot;cat2&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/hrhr.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">이벤투  이벤투투</a></h4>
                	<p>오늘부터1일</p>
                	<div>
	                	<p>#이벤트</p>
	                	<p>2021.2.14</p>
                	</div>
                </div> 
	      	</div>
        </div>

         <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;,&quot;cat6&quot;,&quot;cat1&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/recruit.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">교육 강의</a></h4>
                	<p>시강</p>
                	<div>
	                	<p>#교육/강의</p>
	                	<p>2021.5.5</p>
                	</div>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item illustration" data-groups="[&quot;cat2&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/learnPython.PNG'/>" alt="" class="img-fluid w-100">
		             </div>
	             </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 취업</a></h4>
                	<p>백수백조클럽</p>
                	<div>
	                	<p>#북클럽</p>
	                	<p>2021.4.15</p>
                	</div>
                </div> 
	      	</div>
        </div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item illustration" data-groups="[&quot;cat2&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/learnPython.PNG'/>" alt="" class="img-fluid w-100">
		             </div>
	             </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 취업</a></h4>
                	<p>백수백조클럽</p>
                	<div>
	                	<p>#북클럽</p>
	                	<p>2021.4.15</p>
                	</div>
                </div> 
	      	</div>
        </div> 
        
      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/bookclub.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 코드가 문제야</a></h4>
                	<p>입으로코딩</p>
                  	<div>
	                	<p>#북클럽</p>
	                	<p>2021.2.17</p>     
                	</div>
               </div> 
	      	</div>
      </div>

      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/study.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">북클럽: 정신차리자</a></h4>
                	<p>코딩천재</p>
                  	<div>
	                	<p>#북클럽</p>
	                	<p>2021.3.7</p>
                	</div>
                </div> 
	      	</div>
      </div>

      <div class="col-lg-3 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat3&quot;,&quot;cat4&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/servicon.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">이벤트: 맥주한잔하면서</a></h4>
                	<p>야나두</p>
                  	<div>
	                	<p>#이벤트</p>
	                	<p>2021.3.22</p>
                	</div>               	
                </div> 
	      	</div>
      </div>

      	<div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat5&quot;]">
        	<div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/bookclub2.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">이벤트: 오타경진대회</a></h4>
                	<p>사이보그</p>
                  	<div>
	                	<p>#이벤트</p>
	                	<p>2021.2.22</p>
                	</div>
                </div> 
	      	</div>
      	</div>

      <div class="col-lg-3 col-sm-6 col-md-6 mb-4 shuffle-item" data-groups="[&quot;cat6&quot;]">
       		 <div class="position-relative doctor-inner-box">
		        <div class="doctor-profile">
		        	<div class="doctor-img">
		               <img src="<c:url value='/resources/images/career/study2.PNG'/>" alt="" class="img-fluid w-100">
		            </div>
	            </div>
                <div class="content mt-3">
                	<h4 class="mb-0"><a href="doctor-single.html">자바 101</a></h4>
                	<p>키보드워리어</p>
                	<div>
	                	<p>#교육/강의</p>
	                	<p>2021.2.23</p>
                	</div>
                </div> 
	      	</div>
      </div>




   
   </div>


<!-- 프로젝트 리스트 섹션 끝  -->
