<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Member member = (Member)request.getAttribute("member");
	//out.println(member);//응답출력
%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
<style>
    /* 세션 중앙정렬 */
    div#enroll-container {
        text-align: center;
    }
    div#enroll-container input {margin:3px;}
    div#enroll-container table {margin:0 auto;}
    div#enroll-container table th {padding:0 10px; text-align:right;}
    div#enroll-container table td {padding:0 10px; text-align:left;}
    /* 회원가입 필수항목 표시 */
    div#enroll-container sup {
        color: red;
    }
    #society_front_number {
        width: 55px;
    }
    #society_back_number {
        width: 82px;
    }
    .emailCheked-container{
        width: 80px;
        margin-left: 60px;
    }
    #zip_code {
        width: 89px;
    }
    .postcodify_address, .postcodify_details {
        width: 250px;
    }
</style>
<script>
function deleteMember(){
    var bool = confirm("정말로 탈퇴하시겠습니까?");
    if(bool)
        location.href = "<%=request.getContextPath() %>/member/memberDelete?memberId=<%=member.getMemberId()%>";
}

function updateMember(){
	var url = "<%=request.getContextPath() %>/member/memberUpdate";
	$("#memberUpdateFrm")
		.attr('action',url)
		.submit();	
}

function updatePassword(){
	location.href = "<%= request.getContextPath() %>/member/updatePassword?memberId=<%= member.getMemberId() %>";
}


$(function(){
	
	$("#memberUpdateFrm").submit(function(){
        //memberName
        var $memberName = $("#member_name");
        if(/^[가-힣]{2,}$/.test($memberName.val()) == false){
        	alert("이름은 한글 2글자 이상이어야 합니다.");
        	$memberName.select();
        	return false;
        }
        
        // 핸드폰
        var $phone = $("#mobile_number");
        //-제거하기
        $phone.val($phone.val().replace(/[^0-9]/g, ""));//숫자아닌 문자(복수개)제거하기
        
        if(/^010[0-9]{8}$/.test($phone.val()) == false){
        	alert("유효한 전화번호가 아닙니다.");
        	$phone.select();
        	return false;
        }
      	//집전화
        var $phone_number = $("#phone_number");
        //특수문자(복수개) 제거
        $phone_number.val($phone_number.val().replace(/[^0-9]/g, ""));
        //연락처 유효성 검사
        if(/(^02.{0})([0-9]{3})([0-9]{4})|$/.test($phone_number.val()) == false){
        	alert("유효한 전화번호가 아닙니다.");
        	$phone_number.select();
        	return false;
        }
        
      /* //비밀번호 유효성 검사
		$("#member_pw").blur(function(){
			var $pw1 = $("#member_pw");
			var $pw2 = $("#member_pw_checked");
			
			if(/^[a-zA-Z0-9!@#$$%^&*()]{5,}/.test($pw1.val()) == false){
	        	alert("유효한 패스워드를 입력하세요.");
	        	$pw1.select();
	            return false;
	        }
		}); */
		
		/* //비밀번호 일치여부 검사
		$("#member_pw_checked").blur(function(){
			var $pw1 = $("#member_pw");
			var $pw2 = $("#member_pw_checked");
			
			if($pw1.val() != $pw2.val()){
				alert("비밀번호가 일치하지 않습니다.");
				$pw2.select(); //수정용 드래그 상태
			}
		}); */

		
      	//이메일 유효성 검사
      	/* var $email = $("#email");
        if(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i.test($email.val()) == false){
        	alert("유효한 이메일이 아닙니다.");
        	$email.select();
        	return false;
        }  */       
        
      	//주소 유효성 검사
      	var $zip_code = $("#zip_code");
      	var $member_addr = $("#member_addr");
      	var $member_addr_detail = $("#member_addr_detail");
	    
        return true;
	})
	
		//우편주소 api팝업 띄우기
		$("#zip_code_search").postcodifyPopUp();

	});
</script>
<div id="enroll-container">
    <h2>회원 가입 정보 입력</h2>
    <form id="memberUpdateFrm" method="POST">
        <table>
            <tr>
                <th>아이디<sup>*</sup></th>
                <td>
                    <input type="text" name="member_id" id="member_id" value="<%= member.getMemberId() %>" readonly>
                    <button type="button" onclick="memberIdDuplicate()">중복확인</button>
                    <input type="hidden" id="idValid" value="0" />
                </td>
            </tr>
            <tr>
                <th>이름<sup>*</sup></th>
                <td>
                    <input type="text" name="member_name" id="member_name" value="<%= member.getMemberName() %>" required>
                </td>
            </tr>
            <tr>
                <th>주민번호<sup>*</sup></th>
                <td>
                    <input type="text" name="society_front_number" id="society_front_number" value="<%= member.getSocietyFrontNumber() %>" required maxlength="6"> -
                    <input type="password" name="society_back_number" id="society_back_number" value="<%= member.getSocietyBackNumber() %>" maxlength="7">
                </td>
            </tr>
            <tr>
                <th>이메일&nbsp;</th>
                <td>
                    <input type="email" name="email" id="email" placeholder="abc@naver.com" value="<%= member.getEmail() != null ? member.getEmail() : "" %>" >
                </td>
            </tr>
            <tr>
                <th>이메일 수신 여부&nbsp;</th>
                <td>
                    <div class="emailCheked-container">
                        <label for="">Y</label><input type="radio" name="email_get" value="Y">
                        <label for="">N</label><input type="radio" name="email_get" value="N" checked="checked">
                    </div>
                </td>
            </tr>
            <tr>
                <th>휴대폰 번호<sup>*</sup></th>
                <td>
                    <input type="tel" name="mobile_number" id="mobile_number" value="<%= member.getMobileNum() %>" required>
                </td>
            </tr>
            <tr>
                <th>자택 번호&nbsp;</th>
                <td>
                    <input type="tel" name="phone_number" id="phone_number" value="<%= member.getPhoneNum() != null ? member.getPhoneNum() : "" %>">
                </td>
            </tr>
            <tr>
                <th>우편 번호<sup>*</sup></th>
                <td>
                    <input type="text" name="zip_code" id="zip_code" class="postcodify_postcode5" value="<%= member.getZipCode() %>">
                    <button type="button" id="zip_code_search">우편번호</button>
                </td>
            </tr>
            <tr>
                <th>자택 주소<sup>*</sup></th>
                <td>
                    <input type="text" name="member_addr" id="member_addr" class="postcodify_address" value="<%= member.getMemberAddr() %>" >
                </td>
            </tr>
            <tr>
                <th>상세 주소<sup>*</sup></th>
                <td>
                    <input type="text" name="member_addr_detail" id="member_addr_detail" class="postcodify_details" value="<%= member.getMemberAddrDetail() %>" >
                </td>
            </tr>
        </table>
        <hr>
        <input type="button" onclick="updateMember();" value="정보수정"/>
        <input type="button" onclick="updatePassword();" value="비밀번호수정"/>
        <input type="button" onclick="deleteMember();" value="탈퇴"/>
        <!-- <input type="submit" value="수정">
		<input type="reset" value="취소"> -->
    </form>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
