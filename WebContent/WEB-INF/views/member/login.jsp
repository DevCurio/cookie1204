<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.service.MemberService"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>

$(function(){
	
<% if(memberLoggedIn == null) { %>
	/*
	* 로그인폼 유효성 검사
	*
	* 폼 전송을 방지
	* return false
	* e.preventDefault()
	*/
	$(loginFrm).submit(function(e){
		//아이디 검사
		var $memberId = $(memberId);
		if(/^.{4,}$/.test($memberId.val()) == false){
			alert("유효한 아이디를 입력하세요.");
			$memberId.select();
			return false;//폼 전송 방지
		}
		//비번검사
		var $password = $(password);
		if(/^.{4,}$/.test($password.val()) == false){
			alert("유효한 비밀번호를 입력하세요.");
			$password.select();
			e.preventDefault();//폼 전송 방지
		}
	});
	
<% } %>	
	
	
});
</script>

<div class="login-container">
	<% if(memberLoggedIn == null){ %>
	<form id="loginFrm"
		action="<%= request.getContextPath() %>/member/login" method="POST">
		<table>
			<tr>
				<td><input type="text" name="memberId" id="memberId"
					placeholder="아이디" tabindex="1"
					value="<%= saveId != null ? saveId : ""%>"></td>
				<td><input type="submit" value="로그인" tabindex="3"></td>
			</tr>
			<tr>
				<td><input type="password" name="memberPw" id="memberPw"
					placeholder="비밀번호" tabindex="2"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="2"><input type="checkbox" name="saveId"
					id="saveId" <%= saveId != null ? "checked" : "" %> /> <label
					for="saveId">아이디저장</label> &nbsp;&nbsp; <input type="button"
					value="회원가입"
					onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
				</td>
			</tr>
		</table>
	</form>
	<% } else { %>
	<%-- 로그인 성공시 --%>
	<table id="logged-in">
		<tr>
			<td><%= memberLoggedIn.getMemberName() %>님, 안녕하세요.</td>
		</tr>
	</table>
	<% } %>


	<%@ include file="/WEB-INF/views/common/footer.jsp"%>