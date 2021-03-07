<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = request.getParameter("memberId");
	boolean available = (boolean)request.getAttribute("available");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디중복검사</title>
<script
  src="https://code.jquery.com/jquery-3.5.1.js"
  integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
  crossorigin="anonymous"></script>
<style>
	div#checkId-container{text-align:center; padding-top:50px;}
	span#duplicated {
		color:red;
		font-weight:bold;
	}
	
	button {
    	border-radius: 5px;
    }
    
    button:hover {
        cursor: pointer;
        opacity: 0.7;
    }
    button:active {
        box-shadow: 1px 1px 0 rgb(0,0,0,0.5);
        position: relative;
        top:2px;
    }
</style>
<script>
/**
 * 아이디 중복검사
 */
function checkIdDuplicate(){
	//1. 아이디 유효성 검사하기
    var $member_id = $("#member_id");
    if(/^[a-zA-Z0-9_]{4,}$/.test($member_id.val()) == false){
        alert("4글자 이상 입력해주세요.");
        $member_id.select();
        return;
    }
	
    //2. 중복검사
    var $frm = $(document.checkIdDuplicateFrm);

	//아이디값 세팅
//     $frm.find("[name=memberId]")
// 		.val($member_id.val());
	
	$frm.submit();
	
}

function confirmMemberId(){
	//opener : 팝업을 연 부모창의 window객체
	var $frm = $(opener.document.memberEnrollFrm);
	$frm.find("#member_id").val("<%= memberId %>");
	
	$frm.find("#idValid").val(1);
	
	//현재 팝업윈도우 닫기
	close();
}
</script>
</head>
<body>
	<div id="checkId-container">
	<% if(available) { %>
		
		<%= memberId %> 은/는 사용 가능합니다.
		<br /><br />
		<button type="button" onclick="confirmMemberId();">사용하기</button>
		
	<% } else { %>
		<span id="duplicated"><%= memberId %></span> 은/는 이미 사용중입니다.
		<br /><br />
		<form 
			action="<%= request.getContextPath() %>/member/checkIdDuplicate"
			method="POST"
			name="checkIdDuplicateFrm">
			<input type="text" name="memberId" id="member_id" placeholder="아이디"/>
			<button type="button" onclick="checkIdDuplicate();">중복검사</button>
		</form>
	<% } %>
	</div>
</body>
</html>