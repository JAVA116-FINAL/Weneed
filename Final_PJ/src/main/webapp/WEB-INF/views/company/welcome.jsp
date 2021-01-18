<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../inc/company_top.jsp" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700,600,300" />
<style>

body{
	font-family: -apple-system, system-ui, "Apple SD Gothic Neo", Helvetica, Arial, 
				"hiragino kaku gothic pro", meiryo, "ms pgothic", "Nanum Gothic", "Malgun Gothic", sans-serif;
}

section{
	padding: 100px 0px;
}

section:first-child{
	color: #ffffff;
}

h1{
	font-weight: 200;
	font-size: 4rem;
	text-align: center;
	margin: 0px auto;
}

:-webkit-any(article, aside, nav, section) h1 {
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    
.companyWelcome-first{
	margin-right: 30px;
}
</style>
<script type="text/javascript">
$('#myModal').on('shown.bs.modal', function () {
	  $('#myInput').trigger('focus');
	});
	
</script>
<section>
	<div class="container">
		<h1>
			<span>
				<b>사람</b>과 
				<b>일자리</b>를 가장 인간적이고 효율적으로
				<b>연결</b>합니다
			</span>
		</h1>
		<button class="btn btn-outline-dark">서비스 소개서</button>
		<!-- Button trigger modal -->
		<button type="button" class="btn btn-primary" id="btnRegi" data-toggle="modal" data-target="#ModalComMemRegi"
		onclick="fnModuleInfo('${test.id}')">시작하기</button>
		
		<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
		
	</div>
</section>
	<section class="section about-page">
		<div class="container">
			<div class="row companyWelcome-first">
				<div>
					<h2>원티드를</h2>
					<h2>이용하는</h2>
					<h2>이유</h2>
				</div>
				<div>
					<div>국내외 200만 유저 및 10,000개 기업 이용</div>
					<div>공고 후 1개월 내 채용 성공률 52%</div>
					<div>채용 후 6개월 내 채용 유지율 95%</div>
					<div>기존 채널 대비 40%이상 채용 비용 절감</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>