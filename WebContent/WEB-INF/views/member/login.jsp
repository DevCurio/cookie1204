<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.service.MemberService"%>



<%@ include file="/WEB-INF/views/common/header.jsp"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css2/default.css">
  <link rel="stylesheet" href="<%= request.getContextPath() %>/css2/style.css">

<style>
	#loginFrm {
		margin-bottom : 200px;
	}

</style>


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
			/* 필요없는것같아서지움 시작 */
			//$memberId.select();
			/* 필요없는것같아서지움 끝 */
			return false;//폼 전송 방지
		}
		//비번검사
		var $password = $(memberPw);
		if(/^.{4,}$/.test($password.val()) == false){
			alert("유효한 비밀번호를 입력하세요.");
			/* 필요없는것같아서지움 시작 */
			//$password.select();
			//e.preventDefault();//폼 전송 방지
			/* 필요없는것같아서지움 끝 */
			return false;
		}
	});
	
<% } %>	
	
	
});
</script>

<!-- name="memberId"name="memberPw"name="saveId" -->
  <form id="loginFrm" action="<%= request.getContextPath() %>/member/login" method="POST">
  <section class="login">
    <h2>로그인</h2>
    <ul>
      <li><input type="text" name="memberId" placeholder="아이디" title="아이디입력" value="<%= saveId != null ? saveId : ""%>" ></li>
      <li><input type="password" name="memberPw" placeholder="비밀번호" title="비밀번호입력"></li>
      <li><input type="checkbox" name="saveId" id="chk_id" <%= saveId != null ? "checked" : "" %>><label for="chk_id">아이디저장</label></li>
      <li><button>로그인</button></li>
    </ul>
    <div>
      <ul>
      <li><a href='<%= request.getContextPath() %>/member/memberEnroll'>회원가입</a></li>
     
      </ul>
    </div>

</section>
   </form>
<!-- <div class="login-container" id="divLogin"> -->
<%-- 	<% if(memberLoggedIn == null){ %> --%>
<!-- 	<form id="loginFrm" -->
<%-- 		action="<%= request.getContextPath() %>/member/login" method="POST"> --%>
	
<!-- 			<h2>login</h2> -->
<!-- 		<table id="logintb"> -->
<!-- 			<tr> -->
<!-- 				<td><input type="text" name="memberId" id="memberId" -->
<!-- 					placeholder="아이디" tabindex="1" -->
<%-- 					value="<%= saveId != null ? saveId : ""%>"></td> --%>
<!-- 				<td><input type="submit" value="로그인" tabindex="3"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td><input type="password" name="memberPw" id="memberPw" -->
<!-- 					placeholder="비밀번호" tabindex="2"></td> -->
<!-- 				<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2"> -->
<!-- 				<input type="checkbox" name="saveId" -->
<%-- 					id="saveId" <%= saveId != null ? "checked" : "" %> /> <label --%>
<!-- 					for="saveId">아이디저장</label> &nbsp;&nbsp; <input type="button" -->
<!-- 					value="회원가입" -->
<%-- 					onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';"> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<!-- 	</form> -->
<%-- 	<% } %> --%>
<!-- </div> -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>