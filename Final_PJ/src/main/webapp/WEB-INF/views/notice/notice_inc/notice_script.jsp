<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
$(function(){
	$('#commit').click(function(){
		if($('#notice_search').val().length<1){
			event.preventDefault();
		}
	});
});
</script>