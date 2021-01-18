<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="Orbitor,business,company,agency,modern,bootstrap4,tech,software">
<meta name="author" content="themefisher.com">
<title>WANTED</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<style>
#modal {
  display:none;
  position:relative;
  width:100%;
  height:100%;
  z-index:1;
}

#modal h2 {
  margin:0;   
}

#modal button {
  display:inline-block;
  width:100px;
  margin-left:calc(100% - 100px - 10px);
}

#modal .modal_content {
  width:300px;
  margin:100px auto;
  padding:20px 10px;
  background:#fff;
  border:2px solid #666;
}

#modal .modal_layer {
  position:fixed;
  top:0;
  left:0;
  width:100%;
  height:100%;
  background:rgba(0, 0, 0, 0.5);
  z-index:-1;
}   
</style>
<script>
    $("#modal_open_btn").click(function(){
        $("#modal").attr("style", "display:block");
    });
   
     $("#modal_close_btn").click(function(){
        $("#modal").attr("style", "display:none");
    });      
</script>
</head>
<body>

	<div id="root">
		<button type="button" id="modal_open_btn">모달 창 열기</button>
	</div>
	
	<div id="modal">
		<div class="modal_content">
			<h2>모달 창</h2>
			<p>모달 창입니다.</p>
			<button type="button" id="modal_close_btn">모달 창 닫기</button>
		</div>
		<div class="modal_layer"></div>
	</div>

</body>
</html>