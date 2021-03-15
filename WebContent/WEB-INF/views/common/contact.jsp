<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous">
</script>
<!-- * 카카오맵 - 지도퍼가기 -->
<!-- 1. 지도 노드 -->

<style>
	#daumRoughmapContainer1614591009516 {
		margin : 80px auto 0;
	}
	#contact {
		width: 960px;
		height: 100px;
		margin: 0 auto;
	}
	#address {
		width: 50%;
		float: left;
        text-align: center;
	}
	#directions {
		width: 50%;
        float: right;
        text-align: center;
	}
	h5 {
		color: rgba(184, 46, 46);
	}
	h4 {
		color: rgba(213, 114, 46);
	}
</style>

<div id="daumRoughmapContainer1614591009516" class="root_daum_roughmap root_daum_roughmap_landing"></div>
<div id="contact">
	<div id="address">
		<h5>주소</h5>
		<h4>서울특별시 마포구 만리재로 74상가 2F 214호</h4>
	</div>
	<div id="directions">
		<h5>오시는 길</h5>
		<h4>공덕역 5번 출구 도보 10분</h4>
	</div>
</div>

<!-- 2. 설치 스크립트 -->
<script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

<!-- 3. 실행 스크립트 -->
<script charset="UTF-8">

	new daum.roughmap.Lander({
		"timestamp" : "1614591009516",
		"key" : "24ndz",
		"mapWidth" : "960",
		"mapHeight" : "500"
	}).render();
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>