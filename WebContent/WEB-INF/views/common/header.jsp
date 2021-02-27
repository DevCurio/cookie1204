<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// session 객체를 통해 받아온 메세지 전달.
	String msg = (String)session.getAttribute("msg");
	//1회 사용후 폐기
	if(msg != null) session.removeAttribute("msg");
	
	// 리퀘스트 객체에 저장된 로케이션(이동주소) 전달.
	String loc = (String)request.getAttribute("loc");
	// 로그인 여부 헤더에 전달.
	Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
	
	//서버로 전송된 쿠키값 확인 (아이디 저장 버튼)
	String saveId = null;
	Cookie[] cookies = request.getCookies();
	if(cookies != null){
		for(Cookie c : cookies){
			if("saveId".equals(c.getName())){
				saveId = c.getValue();
				break;
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cookie__1204</title>

<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<script>
<% if(msg != null) { %> alert("<%= msg %>"); <% } %>
<% if(loc != null) { %> location.href = "<%= loc %>"; <% } %>

</script>

</head>

	<body>
		<div class="container">
		
			<header>
				<div>
					<div id="mainpage-logo">
						<a href=""><img src="./images/Java-Servlets-JSP.png" alt="과자방로고?" /></a>
					</div>
					<div id="mainpage-insta">
						<a href=""><img src="./images/Java-Servlets-JSP.png" alt="인스타" /></a>
					</div>
					<div id="mainpage-blog">
						<a href=""><img src="./images/Java-Servlets-JSP.png" alt="블로그" /></a>								
					</div>
					
					<nav>
						<ul class="main-nav">
							<li class="main-menubar"><a href="#">Home</a></li>
							<li class="main-menubar"><a href="#">PROFILE</a></li>
							<li class="main-menubar"><a href="#">ABOUT</a></li>
							<li class="main-menubar"><a href="#">오시는 길</a></li>
							<li class="main-menubar"><a href="#">Shop</a>
								<ul>
									<li><a href="#">마들렌</a></li>
									<li><a href="#">케이크</a></li>
									<li><a href="#">휘낭시에</a></li>
									<li><a href="#">스페셜</a></li>
								</ul>
							</li>
							<li class="main-menubar"><a href="#">Notice</a></li>
							<li class="main-menubar"><a href="#">QnA</a></li>
							<%-- 관리자 메뉴 : 관리자만 노출 --%>
							<% if(memberLoggedIn != null && "1".equals(memberLoggedIn.getIsAdmin())) { %>
							<li id=""><a href="#">회원관리</a></li>
							<% } %>
							
						</ul>
					</nav>
					
					<div id="login-join">
						<ul>
							<% if(memberLoggedIn == null) { %>
							<li><a href="#">login</a></li>
							<% } else { %>
							<li><a href="#">logout</a></li>						
							<% } %>
							<li><a href="<%= request.getContextPath() %>/member/memberEnroll">join</a></li>
						</ul>
					</div>
				</div>
			</header>
			
			<section>