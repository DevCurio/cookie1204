<%@page import="member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.service.MemberService"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<script>
window.onload = function () {
	 modal('divLogin');
	
};

function modal(id) {
    var zIndex = 9999;
    var modal = $('#' + id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = $('<div>')
        .css({
            position: 'fixed',
            zIndex: zIndex,
            left: '0px',
            top: '0px',
            width: '100%',
            height: '100%',
            overflow: 'auto',
            // 레이어 색갈은 여기서 바꾸면 됨
            backgroundColor: 'rgba(0,0,0,0.4)'
        })
        .appendTo('body');

    modal
        .css({
            position: 'fixed',
            boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

            // 시꺼먼 레이어 보다 한칸 위에 보이기
            zIndex: zIndex + 1,

            // div center 정렬
            top: '50%',
            left: '50%',
            transform: 'translate(-50%, -50%)',
            msTransform: 'translate(-50%, -50%)',
            webkitTransform: 'translate(-50%, -50%)'
        })
        .show()
        // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
        .find('#modalClose')
        .on('click', function() {
            bg.remove();
            modal.hide();
        });
}

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
<div class="login-container" id="divLogin">
	<% if(memberLoggedIn == null){ %>
	<form id="loginFrm"
		action="<%= request.getContextPath() %>/member/login" method="POST">
			<div id="close-logo">
				<a href="<%= request.getContextPath() %>/index.jsp"><img src="<%= request.getContextPath() %>/images/close.png" alt="닫기" /></a>
			</div>
			<h2>login</h2>
		<table id="logintb">
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
				<td colspan="2">
				<input type="checkbox" name="saveId"
					id="saveId" <%= saveId != null ? "checked" : "" %> /> <label
					for="saveId">아이디저장</label> &nbsp;&nbsp; <input type="button"
					value="회원가입"
					onclick="location.href='<%= request.getContextPath() %>/member/memberEnroll';">
				</td>
			</tr>
		</table>
	</form>
	<% } %>

</div>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>