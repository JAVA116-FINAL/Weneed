<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<label>제안 메시지</label>
<textarea rows="4" cols="30"></textarea>
<div class="container">
	<div>
		<label>직급</label>
		<input type="text">
	</div>
	<div>
		<label>연봉</label>
		<input type="text">~<input type="text">
	</div>
	<div>
		<label>포지션 선택</label><span>*포지션을 선택해서 제안을 보내면, 해당 포지션의 목록으로 이동합니다.</span>
		<select>
			<option>선택</option>
		</select>
	</div>
	<div>
		<label>근무 지역</label>
		<input type="text">
	</div>
	<div>
		<label>스톡옵션 여부</label>
		<input type="text">
	</div>
	<div>
		<input type="submit" value="보내기">
	</div>
</div>
</body>
</html>