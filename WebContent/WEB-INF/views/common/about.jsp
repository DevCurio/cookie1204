<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Corben&family=Open+Sans&family=Roboto&display=swap" rel="stylesheet">
<style>
	.about-container {
		text-align:center;
		width: 900px;
		height: 1000px;
		margin: 0 auto;
	}
	.about-photo1 {
		width: 40%;
		height: 400px;
		float: left;
		margin-top: 50px;
		position: relative;
	}
	.about-text1 {
		width: 60%;
		height: 400px;
		float: right;
		margin-top: 50px;
	}
	.about-text1 p, .about-text2 p {
		text-align: left;
		margin: 5px 0;
		 ont-family: 'Open Sans', sans-serif; 
		font-size: 1rem;
		color: #888;
	}
	.about1 {
		width: 300px;
		height: 200px;
		display:block;
		position:relative;
		top:30px;
		left:10px;
		z-index:1;

	}
	.about2 {
		width: 200px;
		height: 200px;
		display:block;
		position:relative;
		top: -50px;
		left:-30px;
		z-index:2;
	}
	.about-text2 {
		width: 60%;
		height: 400px;
		float: left;
		margin-top: 50px;
	}
	.about-photo2 {
		width: 40%;
		height: 400px;
		float: left;
		margin-top: 50px;
		position: relative;
	}
	.about3 {
		width: 250px;
		height: 200px;
		display:block;
		position:relative;
		top:30px;
		right:20px;
		z-index:2;

	}
	.about4 {
		width: 300px;
		height: 200px;
		display:block;
		position:relative;
		top: -50px;
		right:150px;
		z-index:1;
	}
</style>
<div class="about-container">
	<div class="about-photo1">
		<img class="about1" alt="about1사진" src="<%= request.getContextPath() %>/images/about/about1.PNG">
		<img class="about2" alt="about2사진" src="<%= request.getContextPath() %>/images/about/about2.PNG">
	</div>
	<div class="about-text1">
		<p>전문제과학교 졸업 경력 파티시에가 신선한 유럽 옛 구움과자를</p>
		<p>다채롭게 만드는 과자방 입니다.</p>
		<br>
		<p>과자방은 제과점의 옛말 입니다.</p>
		<br>
		<p>옛부터 남녀노소 모두가 사랑한 클래식한 제과류를</p>
		<p>과자방의 기술과 색을 담아 정직하게 선보이려고 합니다.</p>
		<br>
		<p>주 메뉴는 배꼽이 빵빵한 과자방의 마들렌과</p>
		<p>다양한 유럽의 구움과자 입니다. 모두 당일 아침 구워내는</p>
		<p>신선한 제품들 입니다.</p>
		<br>
		<p>과자방은 유럽 구움과자를 선보이는 테이크아웃</p>
		<p>only 매장입니다.</p>
	</div>
	<div class="about-text2">
		<p>구움과자에 집중하는 과자방은</p>
		<p>제품 특성에 맞춰 다양한 유럽 버터를 사용합니다.</p>
		<br>
		<p>최고의 제품임을 뜻하는 A.O.P 마크를 가진</p>
		<p>미식가의 버터 "레스큐어" 버터.</p>
		<br>
		<p>프랑스를 대표하는 최고급 버터이자,</p>
		<p>전 세계적으로 사랑받는</p>
		<p>락탈리스 그룹의 프레지던 버터.</p>
		<br>
		<p>과자방의 구움과자에서</p>
		<p>전세계가 사랑하는 유럽 최고급 버터들의</p>
		<p>다양한 풍미를 느껴보세요.</p>
	</div>
	<div class="about-photo2">
		<img class="about3" alt="about3사진" src="<%= request.getContextPath() %>/images/about/about3.png">
		<img class="about4" alt="about4사진" src="<%= request.getContextPath() %>/images/about/about4.png">
	</div>
	
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>