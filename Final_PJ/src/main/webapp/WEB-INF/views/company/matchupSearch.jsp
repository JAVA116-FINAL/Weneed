<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WANTED - MATCHUP</title>
</head>
<body>
	<div class="container"> <!-- 가장 바깥 래퍼 --> 
		<section> <!-- 이름, 검색필터, 검색창, 필터 -->
			<h1>찾고 있는 인재의 직군/직무를 설정하세요</h1>
			<select value="마케팅, 광고">
				<option>전체</option>				
			</select>
			<select> <!-- 여기도 아작스구나 -->
				<option>전체</option>
			
			</select>
			<div>
				<input type="text" ><button>검색하기</button>
			</div>
			<div> 
				<select>
					<option>국가 선택</option>
					<option>한국</option>
					<option>일본</option>
					<option>대만</option>
					<option>홍콩</option>
					<option>싱가폴</option>
				</select>
			</div> <!-- 드롭다운 -->
			<div>
				<select>
					<option>언어 선택</option>
					<option>한국어</option>
					<option>일본어</option>
					<option>중국어</option>
					<option>영어</option>
				</select>
			</div> <!-- 드롭다운 -->
			<div> <!-- Range Slider -->
				
			</div> 
		</section>
		<section> <!-- 목록  -->
			<div>
				<ul>
					<li>목록 전체</li>
					<li>요청 후 받은 이력서</li>
					<li>찜한 목록</li>
					<li>미열람 목록</li>
					<li>열람한 목록</li>
					<li>면접 제안한 목록</li>
				</ul>
			</div>
			<div>
				<input type="radio" value="최신순">
				<input type="radio" value="열람순">
			</div>
			<div> <!-- 이력서 목록 -->
				<img src="#">
				<span>직군직종명</span>
				<span>6년 경력</span>
				<span>학력대학교</span><span>무슨학과</span>
				
			</div>
			<div>
				<button>찜</button>
				<button>이력서 미리보기</button>
			</div>
		</section>
	</div>
</body>
</html>